// The checks every app copies from ol1n_telemetry (README "Testovací sada"),
// plus the restyle flow, the one that matters most here.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';
import 'package:ol1n_telemetry/testing.dart';
import 'package:restyler/models/booth_project.dart';
import 'package:restyler/telemetry/restyle_runs.dart';
import 'package:restyler/telemetry/telemetry_dictionary.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('docs/telemetry.md lists exactly the dictionary', () {
    expect(
      telemetryDocProblems(
        restylerDictionary,
        File('docs/telemetry.md').readAsStringSync(),
      ),
      isEmpty,
    );
  });

  test('no property is free text', () {
    expect(telemetryDictionaryProblems(restylerDictionary), isEmpty);
  });

  test('app version matches pubspec.yaml', () {
    expect(
      telemetryVersionProblems(
        kAppVersion,
        File('pubspec.yaml').readAsStringSync(),
      ),
      isEmpty,
    );
  });

  test('the code sends only dictionary events, and every one of them', () {
    expect(telemetryTrackCallProblems(restylerDictionary), isEmpty);
  });

  test('no key, no network', () async {
    expect(await telemetryNoKeyProblems(restylerDictionary), isEmpty);
  }, skip: const bool.fromEnvironment('TELEMETRY_DEBUG'));

  test('off means nothing', () async {
    expect(await telemetryOffProblems(restylerDictionary), isEmpty);
  });

  test('catalog ids outside the catalog are other', () {
    expect(catalogValue(null, kTelemetryStyleIds), 'none');
    expect(catalogValue('anime', kTelemetryStyleIds), 'anime');
    expect(catalogValue('a photo of me', kTelemetryStyleIds), 'other');
  });

  group('restyle flow', () {
    late FakeSink sink;
    final project = BoothProject(
      id: 'p1',
      createdAt: DateTime(2026, 11, 14),
      selfiePath: 'projects/p1/source.jpg',
      beardId: 'goatee',
      run: const BoothRun(
        id: kMainRun,
        plan: [],
        sourcePath: 'projects/p1/source.jpg',
        status: RunStatus.starting,
      ),
    );
    final plan = RenderPlan(const [
      RenderStep(
        id: 's1',
        graph: RenderGraph.restyleFlux,
        input: kRenderSource,
        prompt: 'test',
      ),
    ]);

    setUp(() async {
      sink = FakeSink();
      await Telemetry.init(
        app: 'restyler',
        appVersion: kAppVersion,
        dictionary: restylerDictionary,
        store: MemoryTelemetryStore(),
        lang: () => 'cs',
        sink: sink,
        startTimer: false,
        observeLifecycle: false,
      );
    });
    tearDown(Telemetry.resetForTest);

    Map<String, Object> last(String name) =>
        Telemetry.debugQueue.lastWhere((e) => e.name == name).props;

    test('start and end carry the stage of the wait', () {
      final runs = RestyleRuns()
        ..start('p1/main', kind: 'booth', plan: plan, project: project)
        ..accepted('p1/main');
      expect(last('restyle_start')['kind'], 'booth');
      expect(last('restyle_start')['beard'], true);
      expect(last('restyle_start')['motion'], 'none');
      runs.end('p1/main', 'queued');
      final end = last('restyle_end');
      expect(end['result'], 'queued');
      expect(end['stage'], 'queue');
      expect(end['frames_ok'], 0);
    });

    test('a deleted booth cancels its open renders', () {
      RestyleRuns()
        ..start('p1/main', kind: 'booth', plan: plan, project: project)
        ..cancelProject('p1');
      expect(last('restyle_end')['result'], 'cancel');
      expect(last('restyle_end')['stage'], 'upload');
    });

    test('backend errors map to results', () {
      expect(
        backendRefusalResult(const BackendException(429, 'busy')),
        'refused',
      );
      expect(
        backendRefusalResult(const BackendException(422, 'plan')),
        'rejected',
      );
      expect(backendRefusalResult(const SocketException('down')), 'timeout');
      expect(backendErrorKind(const SocketException('down')), 'offline');
    });
  });
}
