@Tags(['screenshots'])
library;

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restyler/data/mixes.dart';
import 'package:restyler/providers/booth_provider.dart';
import 'package:restyler/providers/core_providers.dart';
import 'package:restyler/screens/beard_step.dart';
import 'package:restyler/screens/glasses_step.dart';
import 'package:restyler/screens/hair_step.dart';
import 'package:restyler/screens/styles_step.dart';
import 'package:restyler/theme.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import 'support/helpers.dart';

/// Renders the wizard steps to PNGs for the store page (olin.now/restyler):
///
///     SCREENSHOT_DIR=/tmp/shots flutter test test/screenshots_test.dart
///
/// Without SCREENSHOT_DIR every test is skipped, so the normal
/// `flutter test` never depends on pixels. The screens are the app's own
/// widgets over the bundled previews; the selfie is the man-bearded fixture.
final _dir = Platform.environment['SCREENSHOT_DIR'];

const _phone = Size(390, 844); // iPhone 14/15, rendered @3x
const _ratio = 3.0;

final _shotKey = GlobalKey();

Future<void> _loadFonts() async {
  // The test environment otherwise draws every glyph as a box.
  final dir = '${Platform.environment['FLUTTER_ROOT']!}/bin/cache/artifacts/material_fonts';
  Future<ByteData> read(String path) async => ByteData.sublistView(File(path).readAsBytesSync());
  final roboto = FontLoader('Roboto');
  for (final w in ['Regular', 'Medium', 'Bold']) {
    roboto.addFont(read('$dir/Roboto-$w.ttf'));
  }
  await roboto.load();
  await (FontLoader('MaterialIcons')..addFont(read('$dir/MaterialIcons-Regular.otf'))).load();
}

/// Scrolls the step so [heading] sits at the top: the previews, not the chips.
Future<void> _scrollTo(WidgetTester t, String heading) async {
  await Scrollable.ensureVisible(t.element(find.text(heading)), alignment: 0.02);
  await t.pumpAndSettle();
}

Hairstyle _hair(String id) => kHairstyles.firstWhere((h) => h.id == id);
Beard _beard(String id) => kBeards.firstWhere((b) => b.id == id);

void main() {
  setUpAll(_loadFonts);

  late ProviderContainer c;

  setUp(() async {
    final fixture = caseNamed('man-bearded');
    c = boothContainer(
      boothOverrides(
        backend: FakeBackend(),
        store: MemoryProjectStore(),
        files: MemoryProjectFiles(),
        parser: FakeFaceParser(fixture.parse()),
      ),
    );
    addTearDown(c.dispose);
    final n = c.read(draftProvider.notifier);
    expect(await n.analyse(fixture.photoBytes()), isTrue);
  });

  Future<void> shoot(
    WidgetTester tester,
    String name,
    Widget home, {
    Future<void> Function()? then,
  }) async {
    tester.view.physicalSize = _phone * _ratio;
    tester.view.devicePixelRatio = _ratio;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: c,
        child: RepaintBoundary(
          key: _shotKey,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: boothTheme().copyWith(
              textTheme: boothTheme().textTheme.apply(fontFamily: 'Roboto'),
            ),
            home: home,
          ),
        ),
      ),
    );
    await tester.pump();
    if (then != null) await then();
    // The previews are real asset decodes, which only finish outside fake time.
    await tester.runAsync(() async {
      for (final image in tester.widgetList<Image>(find.byType(Image))) {
        await precacheImage(image.image, tester.element(find.byWidget(image)));
      }
    });
    await tester.pumpAndSettle();

    final boundary = tester.renderObject<RenderRepaintBoundary>(find.byKey(_shotKey));
    await tester.runAsync(() async {
      final image = await boundary.toImage(pixelRatio: _ratio);
      final png = await image.toByteData(format: ui.ImageByteFormat.png);
      File('$_dir/$name.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(png!.buffer.asUint8List());
    });
  }

  final skip = _dir == null ? 'set SCREENSHOT_DIR' : null;

  testWidgets('01 vlasy', skip: skip != null, (t) async {
    await t.runAsync(
      () => c.read(draftProvider.notifier).chooseHair(
        _hair('bob'),
        kHairColours.firstWhere((h) => h.id == 'platinum-blonde'),
      ),
    );
    await shoot(t, '01-vlasy', const HairStep(), then: () => _scrollTo(t, 'Cuts'));
  });

  testWidgets('02 vousy', skip: skip != null, (t) async {
    await t.runAsync(
      () => c.read(draftProvider.notifier).chooseBeard(_beard('full-beard')),
    );
    await shoot(t, '02-vousy', const BeardStep(), then: () => _scrollTo(t, 'Krátké vousy'));
  });

  testWidgets('03 bryle', skip: skip != null, (t) async {
    final round = kGlasses.firstWhere((g) => g.id == 'round');
    await t.runAsync(
      () => c.read(draftProvider.notifier).chooseGlasses(
        round,
        round.finishes.isEmpty ? null : round.finishes.first,
      ),
    );
    await shoot(t, '03-bryle', const GlassesStep());
  });

  testWidgets('04 vlasy muzi', skip: skip != null, (t) async {
    await t.runAsync(
      () => c.read(draftProvider.notifier).chooseHair(_hair('m-quiff'), null),
    );
    await shoot(
      t,
      '04-vlasy-muzi',
      const HairStep(),
      then: () async {
        await t.tap(find.text('Muži'));
        await t.pumpAndSettle();
        await _scrollTo(t, 'Short');
      },
    );
  });

  testWidgets('05 styly', skip: skip != null, (t) async {
    await t.runAsync(
      () => c.read(draftProvider.notifier).chooseBeard(_beard('full-beard')),
    );
    await shoot(
      t,
      '05-styly',
      const StylesStep(),
      then: () async {
        await t.tap(find.text('6'));
        await t.pumpAndSettle();
        await t.tap(find.text(kStyleMixes.first.label));
        await t.pumpAndSettle();
      },
    );
  });
}
