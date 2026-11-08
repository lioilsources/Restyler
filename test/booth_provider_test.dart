import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restyler/models/booth_project.dart';
import 'package:restyler/providers/booth_provider.dart';
import 'package:restyler/providers/core_providers.dart';
import 'package:restyler/screens/wizard.dart';
import 'package:restyler/services/errors.dart';
import 'package:restyler/services/plan_builder.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import 'support/helpers.dart';

const _anime = BoothFrame(styleId: 'anime', medium: RestyleMedium.illustration);
const _noir = BoothFrame(styleId: 'noir', medium: RestyleMedium.photo);

Map<String, dynamic> _job(
  String status,
  Map<String, Map<String, dynamic>> steps,
) => {
  'status': status,
  'done': steps.values.where((s) => s['status'] == 'done').length,
  'total': steps.length,
  'steps': steps,
};

Future<void> _settle(bool Function() until) async {
  for (var i = 0; i < 400 && !until(); i++) {
    await Future<void>.delayed(const Duration(milliseconds: 2));
  }
  expect(until(), isTrue, reason: 'never settled');
}

void main() {
  late FakeBackend backend;
  late MemoryProjectStore store;
  late MemoryProjectFiles files;
  late ProviderContainer c;
  final hairStyle = kHairstyles.first;

  ProviderContainer container({BoothCatalog catalog = fullCatalog}) {
    final made = boothContainer(
      boothOverrides(
        backend: backend,
        store: store,
        files: files,
        catalog: catalog,
        parser: FakeFaceParser(caseNamed('man-bearded').parse()),
      ),
    );
    addTearDown(made.dispose);
    return made;
  }

  setUp(() {
    backend = FakeBackend();
    store = MemoryProjectStore();
    files = MemoryProjectFiles();
    c = container();
  });

  Future<BoothDraft> draft({List<BoothFrame> frames = const [_anime, _noir]}) async {
    final n = c.read(draftProvider.notifier);
    expect(await n.analyse(caseNamed('man-bearded').photoBytes()), isTrue);
    await n.chooseBeard(testBeard);
    await n.chooseHair(hairStyle, null);
    n.setFrames(frames);
    return c.read(draftProvider);
  }

  BoothProject project(String id) => c.read(boothProvider).byId(id)!;

  Future<String> started() async {
    final id = await c.read(boothProvider.notifier).start(await draft());
    await _settle(() => !project(id).status.active);
    return id;
  }

  test('happy path: every step lands in a file, plan saved, job cleared', () async {
    final id = await started();
    final p = project(id);
    expect(p.status, RunStatus.done);
    expect(p.jobId, isNull);
    expect(p.stepPaths.keys, unorderedEquals(['beard', 'hair', 's1', 's2']));
    expect(files.files[p.stepPaths['s1']], isNotNull);
    expect(files.files[p.selfiePath], isNotNull);
    expect(store.saved[id]!.status, RunStatus.done);
    expect(p.frameZeroKey, 'hair');
    final sent = backend.renders.single;
    expect(sent['source'], isNotEmpty);
    expect((sent['steps'] as List).map((s) => s['input']), [
      'source',
      'beard',
      'hair',
      'hair',
    ]);
  });

  test('a finished step is fetched while the job is still running', () async {
    backend.nextScript = [
      _job('running', {'hair': stepJson('done'), 's1': stepJson('running')}),
      _job('running', {'hair': stepJson('done'), 's1': stepJson('running')}),
      _job('done', {'hair': stepJson('done'), 's1': stepJson('done')}),
    ];
    final n = c.read(draftProvider.notifier);
    await n.analyse(caseNamed('man-bearded').photoBytes());
    await n.chooseHair(hairStyle, null);
    n.setFrames([_anime]);
    final id = await c.read(boothProvider.notifier).start(c.read(draftProvider));
    await _settle(() => project(id).stepPaths.containsKey('hair'));
    await _settle(() => project(id).status == RunStatus.done);
    expect(backend.downloads.where((d) => d.endsWith('/hair')), hasLength(1));
  });

  test('status decides the end: skips keep done below total for good', () async {
    backend.nextScript = [
      _job('done', {
        'hair': stepJson('error'),
        's1': stepJson('skipped'),
        's2': stepJson('done'),
      }),
    ];
    final n = c.read(draftProvider.notifier);
    await n.analyse(caseNamed('man-bearded').photoBytes());
    await n.chooseHair(hairStyle, null);
    n.setFrames([_anime, _noir]);
    final id = await c.read(boothProvider.notifier).start(c.read(draftProvider));
    await _settle(() => !project(id).status.active);
    final p = project(id);
    expect(p.status, RunStatus.partial);
    expect(p.failed, unorderedEquals(['hair', 's1']));
    expect(p.stepPaths.keys, ['s2']);
    expect(p.jobId, isNull);
  });

  test('a job with no output at all has failed', () async {
    backend.nextScript = [
      _job('error', {'hair': stepJson('error'), 's1': stepJson('skipped')}),
    ];
    final n = c.read(draftProvider.notifier);
    await n.analyse(caseNamed('man-bearded').photoBytes());
    await n.chooseHair(hairStyle, null);
    n.setFrames([_anime]);
    final id = await c.read(boothProvider.notifier).start(c.read(draftProvider));
    await _settle(() => !project(id).status.active);
    expect(project(id).status, RunStatus.failed);
    expect(project(id).status.canRetry, isTrue);
    expect(project(id).error, contains('vrácené'));
  });

  test('a full render queue says „zkus později“, not a failure', () async {
    const busy = {
      'status': 'error',
      'kind': 'image',
      'error': 'busy: the render server is busy, try again in a few minutes',
    };
    backend.nextScript = [
      _job('error', {'hair': busy, 's1': stepJson('skipped')}),
    ];
    final n = c.read(draftProvider.notifier);
    await n.analyse(caseNamed('man-bearded').photoBytes());
    await n.chooseHair(hairStyle, null);
    n.setFrames([_anime]);
    final id = await c.read(boothProvider.notifier).start(c.read(draftProvider));
    await _settle(() => !project(id).status.active);
    expect(project(id).status, RunStatus.failed);
    expect(project(id).status.canRetry, isTrue);
    expect(project(id).error, kServerBusyText);
  });

  test('a busy step in a partial run still says „zkus později“', () async {
    backend.nextScript = [
      _job('done', {
        'hair': stepJson('done'),
        's1': {'status': 'error', 'kind': 'image', 'error': 'busy: later'},
      }),
    ];
    final n = c.read(draftProvider.notifier);
    await n.analyse(caseNamed('man-bearded').photoBytes());
    await n.chooseHair(hairStyle, null);
    n.setFrames([_anime]);
    final id = await c.read(boothProvider.notifier).start(c.read(draftProvider));
    await _settle(() => !project(id).status.active);
    expect(project(id).status, RunStatus.partial);
    expect(project(id).error, kServerBusyText);
  });

  test('404 on poll: lost, and „Spustit znovu“ sends the same plan and source', () async {
    backend.nextScript = [
      _job('running', {'beard': stepJson('done'), 'hair': stepJson('running')}),
    ];
    final id = await c.read(boothProvider.notifier).start(await draft());
    await _settle(() => project(id).stepPaths.containsKey('beard'));
    backend.lost.add('job1');
    await _settle(() => project(id).status == RunStatus.lost);
    expect(project(id).jobId, isNull);
    expect(project(id).stepPaths, contains('beard'), reason: 'kept until a rerun is accepted');

    await c.read(boothProvider.notifier).retry(id, kMainRun);
    await _settle(() => project(id).status == RunStatus.done);
    expect(backend.renders, hasLength(2));
    expect(backend.renders[1]['source'], backend.renders[0]['source']);
    expect(backend.renders[1]['steps'], backend.renders[0]['steps']);
    expect(project(id).stepPaths.keys, unorderedEquals(['beard', 'hair', 's1', 's2']));
  });

  test('a refused rerun leaves the lost project intact, reason in Czech', () async {
    backend.nextScript = [
      _job('running', {'beard': stepJson('done')}),
    ];
    final id = await c.read(boothProvider.notifier).start(await draft());
    await _settle(() => project(id).stepPaths.containsKey('beard'));
    backend.lost.add('job1');
    await _settle(() => project(id).status == RunStatus.lost);

    backend.refuseNext = 429;
    await c.read(boothProvider.notifier).retry(id, kMainRun);
    expect(project(id).status, RunStatus.lost);
    expect(project(id).error, kBusyText);
    expect(project(id).stepPaths, contains('beard'));
  });

  test('a refused start stays as a project with its plan and the Czech reason', () async {
    backend.refuseNext = 429;
    final id = await c.read(boothProvider.notifier).start(await draft());
    expect(project(id).status, RunStatus.rejected);
    expect(project(id).error, kBusyText);
    await c.read(boothProvider.notifier).retry(id, kMainRun);
    await _settle(() => project(id).status == RunStatus.done);
    expect(project(id).error, isNull);
  });

  test('resume at start picks up the saved job id, once', () async {
    backend.nextScript = [
      _job('running', {'hair': stepJson('running')}),
    ];
    final id = await c.read(boothProvider.notifier).start(await draft());
    await _settle(() => (backend.polls['job1'] ?? 0) > 0);
    final saved = store.saved[id]!;
    expect(saved.jobId, 'job1');
    expect(saved.status, RunStatus.running);
    c.dispose();

    // A new process: same box, the server finished meanwhile.
    backend.scripts.remove('job1');
    final fresh = container();
    final notifier = fresh.read(boothProvider.notifier);
    await notifier.resumeAll();
    await notifier.resumeAll(); // start + resumed racing
    await _settle(() => fresh.read(boothProvider).byId(id)!.status == RunStatus.done);
    expect(backend.downloads.where((d) => d == 'job1/hair'), hasLength(1));
  });

  test('resume on a restarted server ends in lost', () async {
    backend.nextScript = [
      _job('running', {'hair': stepJson('running')}),
    ];
    final id = await c.read(boothProvider.notifier).start(await draft());
    await _settle(() => (backend.polls['job1'] ?? 0) > 0);
    c.dispose();
    backend.lost.add('job1');
    final fresh = container();
    await fresh.read(boothProvider.notifier).resumeAll();
    await _settle(() => fresh.read(boothProvider).byId(id)!.status == RunStatus.lost);
  });

  test('a POST the app died in is not left spinning', () async {
    final seed = BoothProject(
      id: 'p',
      createdAt: DateTime(2026),
      selfiePath: 's',
      run: const BoothRun(
        id: kMainRun,
        plan: [],
        sourcePath: 's',
        status: RunStatus.starting,
      ),
    );
    store.saved['p'] = seed;
    final fresh = container();
    await fresh.read(boothProvider.notifier).resumeAll();
    expect(fresh.read(boothProvider).byId('p')!.status, RunStatus.rejected);
  });

  test('polling rides out an outage and carries on', () async {
    backend.pollFailures.addAll([502, 503]);
    final id = await started();
    expect(project(id).status, RunStatus.done);
    expect(backend.pollFailures, isEmpty);
  });

  test('Oživit: frame bytes go up as source, the mp4 lands in stepPaths', () async {
    final id = await started();
    final frame = project(id).stepPaths['s1']!;
    final error = await c
        .read(boothProvider.notifier)
        .startClip(id, 's1', testLive);
    expect(error, isNull);
    await _settle(() => project(id).clips.single.status == RunStatus.done);
    final sent = backend.renders.last;
    final step = (sent['steps'] as List).single as Map;
    expect(step['graph'], 'live_portrait');
    expect(step['input'], 'source');
    expect(step['motion'], 'alive');
    expect(Uint8List.fromList(_b64(sent['source'] as String)), files.files[frame]);
    expect(project(id).stepPaths['m1'], endsWith('m1.mp4'));
    expect(project(id).status, RunStatus.done, reason: 'the booth is untouched');
  });

  test('Oživit during a running render: 429 in Czech, no clip left behind', () async {
    final id = await started();
    backend.refuseNext = 429;
    final error = await c
        .read(boothProvider.notifier)
        .startClip(id, 's1', testWan);
    expect(error, kBusyText);
    expect(project(id).clips, isEmpty);
  });

  test('a lost clip runs again from the same frame', () async {
    final id = await started();
    backend.nextScript = [
      _job('running', {'m1': stepJson('running', kind: 'video')}),
    ];
    await c.read(boothProvider.notifier).startClip(id, 's2', testLive);
    await _settle(() => (backend.polls['job2'] ?? 0) > 0);
    backend.lost.add('job2');
    await _settle(() => project(id).clips.single.status == RunStatus.lost);
    expect(project(id).status, RunStatus.done);

    await c.read(boothProvider.notifier).retry(id, 'm1');
    await _settle(() => project(id).clips.single.status == RunStatus.done);
    expect(backend.renders[2]['source'], backend.renders[1]['source']);
    expect(backend.renders[2]['steps'], backend.renders[1]['steps']);
    expect(project(id).stepPaths['m1'], endsWith('.mp4'));
  });

  test('a frame still rendering cannot be animated', () async {
    final id = await c.read(boothProvider.notifier).start(await draft());
    await _settle(() => !project(id).status.active);
    backend.refuseNext = null;
    expect(
      await c.read(boothProvider.notifier).startClip(id, 'nope', testLive),
      contains('není hotový'),
    );
  });

  test('skipped picks stay out of the plan and the look', () async {
    final n = c.read(draftProvider.notifier);
    await n.analyse(caseNamed('man-bearded').photoBytes());
    await n.chooseBeard(testBeard);
    await n.chooseBeard(null);
    n.setFrames([_anime]);
    final d = c.read(draftProvider);
    expect(d.plan!.steps.map((s) => s.id), ['s1']);
    expect(d.look.parts, isEmpty);
  });

  test('a mask error on a pick stays on that step, in Czech', () async {
    final clean = container();
    addTearDown(clean.dispose);
    final parser = FakeFaceParser(caseNamed('man-short').parse());
    final fresh = boothContainer(
      boothOverrides(
        backend: backend,
        store: store,
        files: files,
        catalog: fullCatalog,
        parser: parser,
      ),
    );
    addTearDown(fresh.dispose);
    final n = fresh.read(draftProvider.notifier);
    expect(await n.analyse(caseNamed('man-short').photoBytes()), isTrue);
    await n.chooseBeard(testShave);
    final d = fresh.read(draftProvider);
    expect(d.error, kMaskErrors['no_beard_to_shave']);
    expect(d.beardEdit, isNull);
    expect(d.beard, isNull);
  });

  test('keep-cut without a colour builds nothing', () async {
    final n = c.read(draftProvider.notifier);
    await n.analyse(caseNamed('man-bearded').photoBytes());
    await n.chooseHair(kKeepCutStyle, null);
    expect(c.read(draftProvider).hairEdit, isNull);
    await n.chooseHair(kKeepCutStyle, kHairColours.first);
    final d = c.read(draftProvider);
    expect(d.hairEdit, isNotNull);
    expect(d.hairEdit!.prompt, contains(kHairColours.first.phrase));
    expect(d.look.hair, contains(kHairColours.first.phrase));
  });

  test('a clip plan priced by the plan, not by the screen', () {
    expect(clipPlan('m1', testWan).cost, kRenderWanCost);
  });

  group('empty catalogs (gate not passed yet)', () {
    const empty = BoothCatalog(beards: [], glasses: [], motions: []);

    test('wizard goes selfie → hair → styles', () {
      expect(wizardSteps(empty), [WizardStep.hair, WizardStep.styles]);
    });

    test('one empty catalog hides one step', () {
      const noGlasses = BoothCatalog(beards: [testBeard], glasses: []);
      expect(wizardSteps(noGlasses), [
        WizardStep.beard,
        WizardStep.hair,
        WizardStep.styles,
      ]);
    });

    test('full catalogs show everything', () {
      expect(wizardSteps(fullCatalog), WizardStep.values);
    });
  });
}

List<int> _b64(String s) => Uri.parse('data:;base64,$s').data!.contentAsBytes();
