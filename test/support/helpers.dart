import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:image/image.dart' as img;
import 'package:restyler/models/booth_project.dart';
import 'package:restyler/providers/core_providers.dart';
import 'package:restyler/services/face_parser.dart';
import 'package:restyler/services/project_files.dart';
import 'package:restyler/services/project_store.dart';
import 'package:restyler/services/render_service.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

const fixtures = 'packages/tsumiki_shared/test/fixtures';

Future<R> inlineWorker<R>(R Function() work) async => work();

Uint8List classMap(String path) {
  final image = img.decodePng(File(path).readAsBytesSync())!;
  final out = Uint8List(image.width * image.height);
  var i = 0;
  for (final p in image) {
    out[i++] = p.index.toInt();
  }
  return out;
}

class FixtureCase {
  FixtureCase(this.json);

  final Map<String, dynamic> json;

  String get name => json['case'] as String;
  String get dir => '$fixtures/masks/$name';
  int get width => json['width'] as int;
  int get height => json['height'] as int;
  bool get hasPhoto => json['photo'] as bool;

  List<Map<String, dynamic>> expected(String kind) => [
    for (final e in json['expected'] as List)
      if ((e as Map)['kind'] == kind) e.cast<String, dynamic>(),
  ];

  FaceParse parse() => FaceParse(
    face: classMap('$dir/parse.png'),
    clothes: json['clothes'] as bool ? classMap('$dir/clothes.png') : null,
    width: width,
    height: height,
  );

  /// The photo, or a grey stand-in of the right size where Python had none.
  Uint8List photoBytes() => hasPhoto
      ? File('$dir/photo.png').readAsBytesSync()
      : img.encodePng(img.Image(width: width, height: height));
}

List<FixtureCase> loadCases() {
  final doc =
      jsonDecode(File('$fixtures/masks/cases.json').readAsStringSync()) as Map;
  return [
    for (final c in doc['cases'] as List)
      FixtureCase((c as Map).cast<String, dynamic>()),
  ];
}

FixtureCase caseNamed(String name) =>
    loadCases().firstWhere((c) => c.name == name);

Map<String, dynamic> loadPrompts() =>
    jsonDecode(File('$fixtures/prompts.json').readAsStringSync())
        as Map<String, dynamic>;

class FakeFaceParser implements FaceParser {
  FakeFaceParser(this.result);

  final FaceParse result;
  int calls = 0;

  @override
  Future<FaceParse> parse(Uint8List bytes) async {
    calls++;
    return result;
  }
}

class MemoryProjectStore implements ProjectStore {
  MemoryProjectStore([List<BoothProject> seed = const []])
    : saved = {for (final p in seed) p.id: p};

  final Map<String, BoothProject> saved;

  @override
  List<BoothProject> all() => saved.values.toList();

  @override
  Future<void> save(BoothProject project) async => saved[project.id] = project;

  @override
  Future<void> delete(String id) async => saved.remove(id);
}

class MemoryProjectFiles implements ProjectFiles {
  final files = <String, Uint8List>{};

  @override
  String absolute(String relative) => '/memory/$relative';

  @override
  Future<void> write(String relative, Uint8List bytes) async =>
      files[relative] = bytes;

  @override
  Future<Uint8List> read(String relative) async => files[relative]!;

  @override
  Future<void> deleteProject(String projectId) async =>
      files.removeWhere((k, _) => k.startsWith('projects/$projectId/'));
}

Map<String, dynamic> stepJson(String status, {String kind = 'image'}) => {
  'status': status,
  'kind': kind,
};

/// The server of `tgbot/render.py`, as far as the app can tell: real
/// [BackendClient] on top, an in-memory job table below.
class FakeBackend {
  FakeBackend();

  /// Answer of the next POST instead of a job, then cleared.
  int? refuseNext;

  /// Poll snapshots per job, in order; the last one repeats. Without a script
  /// a job is finished on the first poll with all steps done.
  final scripts = <String, List<Map<String, dynamic>>>{};
  List<Map<String, dynamic>>? nextScript;

  /// Status to answer polls with once, in order (`null` = behave).
  final pollFailures = <int>[];
  final lost = <String>{};
  final renders = <Map<String, dynamic>>[];
  final jobs = <String, List<Map<String, dynamic>>>{};
  final polls = <String, int>{};
  final downloads = <String>[];
  int freeRemaining = 40;

  http.Client client() => MockClient(_handle);

  Future<http.Response> _handle(http.Request r) async {
    final path = r.url.path;
    if (r.method == 'POST' && path == '/api/render') {
      if (refuseNext != null) {
        final code = refuseNext!;
        refuseNext = null;
        return _json({'detail': 'refused'}, code);
      }
      final body = jsonDecode(r.body) as Map<String, dynamic>;
      renders.add(body);
      final id = 'job${renders.length}';
      final steps = (body['steps'] as List).cast<Map<String, dynamic>>();
      jobs[id] = steps;
      if (nextScript != null) {
        scripts[id] = nextScript!;
        nextScript = null;
      }
      return _json({
        'job_id': id,
        'steps_total': steps.length,
        'cost': steps.fold<int>(
          0,
          (n, s) => n + (s['graph'] == 'wan_motion' ? 5 : 1),
        ),
      });
    }
    if (path == '/api/me') {
      return _json({
        'credits': 0,
        'free_remaining': freeRemaining,
        'free_limit': 40,
      });
    }
    final segments = r.url.pathSegments;
    if (segments.length >= 3 && segments[1] == 'jobs') {
      final id = segments[2];
      if (lost.contains(id) || !jobs.containsKey(id)) {
        return _json({'detail': 'job not found'}, 404);
      }
      if (segments.length == 5) {
        downloads.add('$id/${segments[4]}');
        return http.Response.bytes(
          utf8.encode('bytes of ${segments[4]}'),
          200,
        );
      }
      if (pollFailures.isNotEmpty) {
        return _json({'detail': 'down'}, pollFailures.removeAt(0));
      }
      final n = polls[id] = (polls[id] ?? 0) + 1;
      final script = scripts[id];
      if (script != null) return _json(script[(n - 1).clamp(0, script.length - 1)]);
      final steps = jobs[id]!;
      return _json({
        'status': 'done',
        'done': steps.length,
        'total': steps.length,
        'steps': {
          for (final s in steps)
            s['id'] as String: stepJson(
              'done',
              kind:
                  s['graph'] == 'live_portrait' || s['graph'] == 'wan_motion'
                  ? 'video'
                  : 'image',
            ),
        },
      });
    }
    return _json({'detail': 'no route'}, 500);
  }

  http.Response _json(Object body, [int status = 200]) => http.Response(
    jsonEncode(body),
    status,
    headers: {'content-type': 'application/json; charset=utf-8'},
  );
}

RenderService fakeService(FakeBackend backend) => RenderService(
  BackendClient(
    baseUrl: 'https://test',
    auth: const AppAuth(token: 't', user: 'test'),
    client: backend.client(),
  ),
  // Not zero: a zero timer that re-arms never lets fake time move on.
  pollInterval: const Duration(milliseconds: 1),
  retryBase: const Duration(milliseconds: 1),
);

/// Overrides for a booth with nothing real under it.
List<dynamic> boothOverrides({
  required FakeBackend backend,
  required ProjectStore store,
  required ProjectFiles files,
  FaceParser? parser,
  BoothCatalog catalog = const BoothCatalog(),
}) => [
  renderServiceProvider.overrideWithValue(fakeService(backend)),
  projectStoreProvider.overrideWithValue(store),
  projectFilesProvider.overrideWithValue(files),
  workerProvider.overrideWithValue(inlineWorker),
  catalogProvider.overrideWithValue(catalog),
  if (parser != null) faceParserProvider.overrideWithValue(parser),
];

ProviderContainer boothContainer(List<dynamic> overrides) =>
    ProviderContainer(overrides: overrides.cast());

const testBeard = Beard(
  id: 'full-beard',
  label: 'Full Beard',
  cs: 'plnovous',
  section: 'Full',
  block: 'full beard',
  region: BeardRegion(BeardRegionKind.full),
);

const testShave = Beard(
  id: kCleanShavenId,
  label: 'Clean',
  cs: 'oholit',
  section: 'Shave',
  block: '',
  region: BeardRegion(BeardRegionKind.full, belowChin: 0.1),
);

const testGlasses = Glasses(
  id: 'round',
  label: 'Round',
  cs: 'kulaté',
  group: 'Eyeglasses',
  section: 'Round',
  block: 'round wire glasses',
  finishes: ['gold'],
  fit: GlassesFit(),
);

const testLive = Motion(
  id: 'alive',
  label: 'Alive',
  cs: 'Živý',
  seconds: 8,
  engine: MotionEngine.live,
  loop: true,
);

const testWan = Motion(
  id: 'hair-breeze',
  label: 'Breeze',
  cs: 'Vlasy ve větru',
  seconds: 5,
  engine: MotionEngine.wan,
  loop: false,
);

const fullCatalog = BoothCatalog(
  beards: [testBeard, testShave],
  glasses: [testGlasses],
  motions: [testLive, testWan],
);
