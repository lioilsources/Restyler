import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restyler/app.dart';
import 'package:restyler/data/mixes.dart';
import 'package:restyler/models/booth_project.dart';
import 'package:restyler/providers/core_providers.dart';
import 'package:restyler/screens/booth_screen.dart';
import 'package:restyler/services/errors.dart';
import 'package:restyler/services/face_parser.dart';
import 'package:restyler/services/model_store.dart';
import 'package:restyler/services/photo_source.dart';

import 'support/helpers.dart';

class _Photo implements PhotoSource {
  _Photo(this.bytes);

  final Uint8List bytes;

  @override
  Future<Uint8List?> pick(SelfieSource source) async => bytes;
}

class _ReadyModels extends ModelNotifier {
  @override
  ModelState build() => const ModelState(ModelStage.ready);

  @override
  Future<void> ensure() async {}
}

class _OfflineParser implements FaceParser {
  @override
  Future<Never> parse(Uint8List bytes) async =>
      throw const ModelException(kModelOfflineText);
}

Future<void> _pumps(WidgetTester t, [int n = 30]) async {
  for (var i = 0; i < n; i++) {
    await t.pump(const Duration(milliseconds: 20));
  }
}

Future<void> _tap(WidgetTester t, String text) async {
  await t.ensureVisible(find.text(text).first);
  await _pumps(t, 5);
  await t.tap(find.text(text).first);
  await _pumps(t);
}

void main() {
  late FakeBackend backend;
  late MemoryProjectStore store;
  late MemoryProjectFiles files;

  setUp(() {
    backend = FakeBackend();
    store = MemoryProjectStore();
    files = MemoryProjectFiles();
  });

  Future<void> boot(
    WidgetTester t, {
    required BoothCatalog catalog,
    String fixture = 'man-bearded',
    FaceParser? parser,
  }) async {
    final c = caseNamed(fixture);
    await t.binding.setSurfaceSize(const Size(420, 1000));
    addTearDown(() => t.binding.setSurfaceSize(null));
    await t.pumpWidget(
      ProviderScope(
        overrides: [
          ...boothOverrides(
            backend: backend,
            store: store,
            files: files,
            catalog: catalog,
            parser: parser ?? FakeFaceParser(c.parse()),
          ).cast(),
          photoSourceProvider.overrideWithValue(_Photo(c.photoBytes())),
          modelProvider.overrideWith(_ReadyModels.new),
        ],
        child: const RestylerApp(),
      ),
    );
    await _pumps(t);
  }

  Future<void> finishBooth(WidgetTester t) async {
    await _tap(t, 'Galerie');
    await _tap(t, 'Spustit fotobuňku');
    await _pumps(t, 60);
  }

  testWidgets('empty catalogs: selfie → hair → styles, no Oživit', (t) async {
    await boot(t, catalog: const BoothCatalog(beards: [], glasses: [], motions: []));
    await _tap(t, 'Nová fotobuňka');
    expect(backend.renders, isEmpty);
    await _tap(t, 'Vyfotit se');

    expect(find.text('Vlasy'), findsOneWidget);
    expect(find.text('Vousy'), findsNothing);
    expect(find.text('Brýle'), findsNothing);
    await _tap(t, 'Nechat');

    expect(find.text('Styly'), findsOneWidget);
    expect(find.text('Vyber aspoň jednu úpravu nebo styl.'), findsOneWidget);
    await _tap(t, 'Galerie');
    expect(find.textContaining('Stojí 4 generací'), findsOneWidget);
    await _tap(t, 'Spustit fotobuňku');
    await _pumps(t, 60);

    final steps = backend.renders.single['steps'] as List;
    expect(steps.map((s) => s['id']), ['s1', 's2', 's3', 's4']);
    expect(steps.map((s) => s['input']), everyElement('source'));

    expect(find.byType(BoothScreen), findsOneWidget);
    expect(find.text('Selfie'), findsOneWidget);
    expect(find.text('Oživit'), findsNothing);
    final p = store.saved.values.single;
    expect(p.status, RunStatus.done);
    expect(p.tiles(), hasLength(5));
  });

  testWidgets('full catalogs: every step shows, edits chain, Oživit opens', (t) async {
    await boot(t, catalog: fullCatalog);
    await _tap(t, 'Nová fotobuňka');
    await _tap(t, 'Vyfotit se');

    expect(find.text('Vousy'), findsOneWidget);
    await _tap(t, 'plnovous');
    await _tap(t, 'Další');

    expect(find.text('Brýle'), findsOneWidget);
    await _tap(t, 'Nechat');

    expect(find.text('Vlasy'), findsOneWidget);
    await _tap(t, 'Nechat');

    await finishBooth(t);
    final steps = backend.renders.single['steps'] as List;
    expect(steps.map((s) => s['id']), ['beard', 's1', 's2', 's3', 's4']);
    expect(steps.skip(1).map((s) => s['input']), everyElement('beard'));
    expect(find.text('Nový vzhled'), findsOneWidget);

    expect(find.text('Oživit'), findsWidgets);
    await _tap(t, 'Oživit');
    expect(find.text('Rychlé, během sekund'), findsOneWidget);
    expect(find.text('Pomalé, desítky minut'), findsOneWidget);
    expect(find.text('Stojí 1'), findsOneWidget);
    expect(find.text('Stojí 5'), findsOneWidget);

    backend.refuseNext = 429;
    await _tap(t, 'Vlasy ve větru');
    expect(find.text(kBusyText), findsOneWidget);
    expect(store.saved.values.single.clips, isEmpty);
  });

  testWidgets('a photo with no face stops at the selfie, nothing sent', (t) async {
    await boot(t, catalog: const BoothCatalog(), fixture: 'no-face');
    await _tap(t, 'Nová fotobuňka');
    await _tap(t, 'Vyfotit se');
    expect(find.text(kMaskErrors['no_face']!), findsOneWidget);
    expect(find.text('Vlasy'), findsNothing);
    expect(backend.renders, isEmpty);
  });

  testWidgets('a step closed by the photo says why and offers only Nechat', (t) async {
    await boot(t, catalog: fullCatalog, fixture: 'mouth-covered');
    await _tap(t, 'Nová fotobuňka');
    await _tap(t, 'Vyfotit se');
    expect(find.text(kMaskErrors['mouth_not_visible']!), findsWidgets);
    expect(find.text('plnovous'), findsNothing);
    await _tap(t, 'Nechat');
    expect(find.text('Brýle'), findsOneWidget);
  });

  testWidgets('offline with no model: clear message on the selfie step', (t) async {
    await boot(t, catalog: const BoothCatalog(), parser: _OfflineParser());
    await _tap(t, 'Nová fotobuňka');
    await _tap(t, 'Vyfotit se');
    expect(find.text(kModelOfflineText), findsOneWidget);
    expect(find.text('Vlasy'), findsNothing);
  });

  testWidgets('a lost render offers „Spustit znovu“ with its price', (t) async {
    backend.nextScript = [
      {
        'status': 'running',
        'done': 0,
        'total': 4,
        'steps': {'s1': stepJson('running')},
      },
    ];
    await boot(t, catalog: const BoothCatalog(beards: [], glasses: [], motions: []));
    await _tap(t, 'Nová fotobuňka');
    await _tap(t, 'Vyfotit se');
    await _tap(t, 'Nechat');
    await _tap(t, 'Galerie');
    await _tap(t, 'Spustit fotobuňku');
    await _pumps(t);
    expect(find.text('Maluji 1/1'), findsOneWidget);
    backend.lost.add('job1');
    await _pumps(t, 60);
    expect(find.text('Spustit znovu (4)'), findsOneWidget);
    await _tap(t, 'Spustit znovu (4)');
    await _pumps(t, 60);
    expect(store.saved.values.single.status, RunStatus.done);
    expect(backend.renders[1]['steps'], backend.renders[0]['steps']);
  });

  testWidgets('a 429 at the start of a booth shows the Czech reason', (t) async {
    backend.refuseNext = 429;
    await boot(t, catalog: const BoothCatalog(beards: [], glasses: [], motions: []));
    await _tap(t, 'Nová fotobuňka');
    await _tap(t, 'Vyfotit se');
    await _tap(t, 'Nechat');
    await _tap(t, 'Galerie');
    await _tap(t, 'Spustit fotobuňku');
    await _pumps(t, 40);
    expect(find.text(kBusyText), findsOneWidget);
    expect(kStyleMixes, isNotEmpty);
  });
}
