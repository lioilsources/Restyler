import 'dart:io';
import 'dart:isolate';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:restyler/models/booth_project.dart';
import 'package:restyler/services/analysis.dart';
import 'package:restyler/services/errors.dart';
import 'package:restyler/services/photo.dart';
import 'package:restyler/services/plan_builder.dart';
import 'package:restyler/services/worker.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import 'support/helpers.dart';

/// Python's answers: what `gen_fixtures` read, or null where there was no photo.
BoothAnalysis _analysis(FixtureCase c) => BoothAnalysis(
  masks: c.parse().toAnalysis(),
  width: c.width,
  height: c.height,
  hairColour: c.json['colour'] as String?,
  hasBeard: c.json['has_beard'] as bool?,
);

BoolMask _expected(FixtureCase c, Map<String, dynamic> e) =>
    decodeMaskPng(File('${c.dir}/${e['file']}').readAsBytesSync());

Beard _beard(Map<String, dynamic> e, String block) {
  final r = (e['region'] as Map).cast<String, dynamic>();
  return Beard(
    id: (e['style'] as String).substring('beard-'.length),
    label: '',
    cs: '',
    section: '',
    block: block,
    region: BeardRegion(
      BeardRegionKind.values.byName(r['kind'] as String),
      belowChin: (r['below_chin'] as num).toDouble(),
      moustache: r['moustache'] as bool? ?? false,
      chinSides: r['chin_sides'] as bool? ?? false,
    ),
  );
}

Hairstyle _hair(Map<String, dynamic> e) {
  final s = (e['shape'] as Map).cast<String, dynamic>();
  return Hairstyle(
    // `mode: hair` is what keep-cut asks for, whatever the shape.
    id: e['mode'] == 'hair' ? kKeepCutId : 'x',
    label: '',
    group: '',
    section: '',
    block: 'test cut',
    shape: HairShape(
      length: HairLength.values.byName(s['length'] as String),
      bangs: HairBangs.values.byName(s['bangs'] as String),
      updo: s['updo'] as bool,
    ),
  );
}

const _dye = HairColour(id: 'd', label: '', group: '', phrase: 'blue');

void main() {
  final cases = loadCases();
  final prompts = loadPrompts();
  final beardBlocks = {
    for (final b in (prompts['beard'] as List).cast<Map>())
      b['style_id'] as String: b['block'] as String,
  };

  test('fixtures are there and cover what they should', () {
    expect(cases.length, greaterThanOrEqualTo(15));
    expect(cases.where((c) => c.hasPhoto), isNotEmpty);
  });

  for (final c in cases) {
    group(c.name, () {
      late BoothAnalysis a;
      setUpAll(() => a = _analysis(c));

      test('hair edits carry Python\'s masks', () {
        for (final e in c.expected('hair')) {
          final style = _hair(e);
          // keep-cut asks for a colour; the plan never has it without one.
          final colour = style.id == kKeepCutId ? _dye : null;
          if (e['error'] != null) {
            expect(
              () => buildHairEdit(a, style, colour),
              throwsA(isA<HairMaskException>().having((x) => x.code, 'code', e['error'])),
              reason: '${e['style']}',
            );
            continue;
          }
          final edit = buildHairEdit(a, style, colour);
          expect((edit.width, edit.height), (c.width, c.height));
          expect(decodeMaskPng(edit.mask).data, _expected(c, e).data, reason: '${e['style']}');
        }
      });

      test('beard edits carry Python\'s masks', () {
        for (final e in c.expected('beard')) {
          final style = _beard(e, beardBlocks[e['style'].substring(6)] ?? 'beard');
          if (e['error'] != null) {
            expect(
              () => buildBeardEdit(a, style),
              throwsA(isA<HairMaskException>().having((x) => x.code, 'code', e['error'])),
              reason: '${e['style']}',
            );
            continue;
          }
          final edit = buildBeardEdit(a, style);
          expect(decodeMaskPng(edit.mask).data, _expected(c, e).data, reason: '${e['style']}');
        }
      });

      if (c.hasPhoto) {
        test('colour and has_beard off the real photo, as Python read them', () {
          final photo = normalisePhoto(c.photoBytes());
          final got = analyseParse(c.parse(), photo);
          expect(got.hairColour, c.json['colour']);
          expect(got.hasBeard, c.json['has_beard']);
        });
      }
    });
  }

  test('prompts in the plan are the ones Python wrote', () {
    final a = _analysis(caseNamed('man-short'));
    final c = caseNamed('man-short');
    final entry = (prompts['beard'] as List).cast<Map>().firstWhere(
      (b) =>
          b['style_id'] == 'full-beard' &&
          b['colour'] == 'brown' &&
          b['grey'] == false,
      orElse: () => const {},
    );
    if (entry.isNotEmpty) {
      final e = c.expected('beard').firstWhere((e) => e['style'] == 'beard-full-beard');
      expect(buildBeardEdit(a, _beard(e, entry['block'] as String)).prompt, entry['expected']);
    }
    final restyle = (prompts['restyle'] as List).cast<Map>().first;
    final medium = RestyleMedium.values.firstWhere((m) => m.wire == restyle['medium']);
    final plan = assemblePlan(
      width: 8,
      height: 8,
      frames: [BoothFrame(styleId: restyle['style_id'] as String, medium: medium)],
    );
    expect(plan.steps.single.prompt, restyle['expected']);
    expect(plan.steps.single.negative, restyle['negative']);
  });

  test('a whole plan over the golden masks matches Python step for step', () {
    final c = caseNamed('man-bearded');
    final a = _analysis(c);
    final beardEntry = c.expected('beard').firstWhere((e) => e['style'] == 'beard-clean-shaven');
    final hairEntry = c.expected('hair').firstWhere((e) => e['style'] == 'hair-short-none-down');
    final plan = assemblePlan(
      width: c.width,
      height: c.height,
      beard: buildBeardEdit(a, _beard(beardEntry, '')),
      hair: buildHairEdit(a, _hair(hairEntry), null),
      frames: const [BoothFrame(styleId: 'anime', medium: RestyleMedium.illustration)],
      look: const RestyleLook(beard: 'clean-shaven'),
    );
    expect(plan.steps.map((s) => s.id), ['beard', 'hair', 's1']);
    expect(plan.steps[1].input, 'beard');
    expect(decodeMaskPng(plan.steps[0].mask!).data, _expected(c, beardEntry).data);
    expect(decodeMaskPng(plan.steps[1].mask!).data, _expected(c, hairEntry).data);
    expect(plan.steps[2].prompt, contains('clean-shaven'));
  });

  test('glasses: no Python fixtures yet, so against the shared Dart mask', () {
    final c = caseNamed('man-short');
    final a = _analysis(c);
    final edit = buildGlassesEdit(a, testGlasses, 'gold');
    expect(
      decodeMaskPng(edit.mask).data,
      buildGlassesMask(a.masks, testGlasses.fit).mask.data,
    );
    expect(edit.prompt, glassesPrompt(testGlasses, 'gold'));
    expect(cases.every((c) => c.expected('glasses').isEmpty), isTrue,
        reason: 'fixtures appeared: compare against them here');
  });

  test('photos with no use stop before anything is sent, in Czech', () async {
    for (final name in ['no-face', 'tiny-face']) {
      final c = caseNamed(name);
      final parser = FakeFaceParser(c.parse());
      await expectLater(
        analyseSelfie(c.photoBytes(), parser, inlineWorker),
        throwsA(isA<HairMaskException>()),
        reason: name,
      );
    }
    final c = caseNamed('no-face');
    try {
      await analyseSelfie(c.photoBytes(), FakeFaceParser(c.parse()), inlineWorker);
      fail('should throw');
    } on Object catch (e) {
      expect(analysisErrorText(e), kMaskErrors['no_face']);
    }
  });

  test('a step-sized problem closes that step and not the booth', () {
    final eyes = analyseParse(
      caseNamed('eyes-covered').parse(),
      normalisePhoto(caseNamed('eyes-covered').photoBytes()),
    );
    expect(eyes.glassesIssue?.code, 'eyes_not_visible');
    final mouth = analyseParse(
      caseNamed('mouth-covered').parse(),
      normalisePhoto(caseNamed('mouth-covered').photoBytes()),
    );
    expect(mouth.beardIssue?.code, 'mouth_not_visible');
    final bald = analyseParse(
      caseNamed('bald').parse(),
      normalisePhoto(caseNamed('bald').photoBytes()),
    );
    expect(bald.hairColour, isNull);
  });

  test('shaving a clean chin is refused with the Czech text', () {
    final a = _analysis(caseNamed('man-short'));
    expect(a.hasBeard, isFalse);
    try {
      buildBeardEdit(a, testShave);
      fail('should throw');
    } on HairMaskException catch (e) {
      expect(maskErrorText(e, MaskStep.beard), 'Na fotce nejsou vousy k oholení.');
    }
  });

  test('a selfie off a phone: mask size is the size of the bytes sent', () async {
    // Stored 3000×2000, orientation 6, long side over the limit: upright and
    // scaled it is 1024×1536, and the parser reports at that size.
    final raw = img.Image(width: 3000, height: 2000);
    raw.exif.imageIfd.orientation = 6;
    final bytes = img.encodeJpg(raw);
    final c = caseNamed('man-short');
    final (photo, a) = await analyseSelfie(
      bytes,
      FakeFaceParser(c.parse().resized(1024, 1536)),
      inlineWorker,
    );
    expect((photo.width, photo.height), (1024, 1536));
    final sent = img.decodeJpg(photo.bytes)!;
    final edit = buildHairEdit(a, _hair(c.expected('hair')[1]), null);
    final mask = img.decodePng(edit.mask)!;
    expect((mask.width, mask.height), (sent.width, sent.height));
    assemblePlan(width: sent.width, height: sent.height, hair: edit);
  });

  test('a parser at the wrong size is an error, not a nearest-neighbour fix', () {
    final c = caseNamed('man-short');
    expect(
      () => analyseParse(c.parse().resized(256, 320), normalisePhoto(c.photoBytes())),
      throwsArgumentError,
    );
  });

  test('runs for real in an isolate, errors included', () async {
    final c = caseNamed('man-bearded');
    final (photo, a) = await analyseSelfie(
      c.photoBytes(),
      FakeFaceParser(c.parse()),
      isolateWorker,
    );
    expect(photo.width, c.width);
    expect(a.hasBeard, isTrue);

    final none = caseNamed('no-face');
    await expectLater(
      analyseSelfie(none.photoBytes(), FakeFaceParser(none.parse()), isolateWorker),
      throwsA(isA<HairMaskException>().having((e) => e.code, 'code', 'no_face')),
    );
    final edit = await Isolate.run(() => buildBeardEdit(a, testShave));
    expect(edit.width, c.width);
  });
}
