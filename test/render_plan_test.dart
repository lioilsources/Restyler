import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:restyler/models/booth_project.dart';
import 'package:restyler/services/plan_builder.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import 'support/helpers.dart';

BuiltEdit _edit([int w = 8, int h = 8]) => BuiltEdit(
  prompt: 'p',
  negative: 'n',
  mask: Uint8List(3),
  width: w,
  height: h,
);

const _frames = [
  BoothFrame(styleId: 'anime', medium: RestyleMedium.illustration),
  BoothFrame(styleId: 'noir', medium: RestyleMedium.photo),
];

List<(String, String)> _chain(RenderPlan p) => [
  for (final s in p.steps) (s.id, s.input),
];

void main() {
  test('beard → glasses → hair → styles, each reading the one before', () {
    final plan = assemblePlan(
      width: 8,
      height: 8,
      beard: _edit(),
      glasses: _edit(),
      hair: _edit(),
      frames: _frames,
    );
    expect(_chain(plan), [
      ('beard', 'source'),
      ('glasses', 'beard'),
      ('hair', 'glasses'),
      ('s1', 'hair'),
      ('s2', 'hair'),
    ]);
    expect(plan.cost, 5);
    expect(plan.steps.take(3).every((s) => s.mask != null), isTrue);
    expect(plan.steps.skip(3).every((s) => s.mask == null), isTrue);
    expect(plan.steps.take(3).map((s) => s.graph), everyElement(RenderGraph.kontextEdit));
    expect(plan.steps.skip(3).map((s) => s.graph), everyElement(RenderGraph.restyleFlux));
  });

  test('a skipped step leaves no gap in the chain', () {
    expect(
      _chain(assemblePlan(width: 8, height: 8, beard: _edit(), hair: _edit(), frames: _frames)),
      [('beard', 'source'), ('hair', 'beard'), ('s1', 'hair'), ('s2', 'hair')],
    );
    expect(
      _chain(assemblePlan(width: 8, height: 8, glasses: _edit(), frames: _frames.sublist(1))),
      [('glasses', 'source'), ('s1', 'glasses')],
    );
  });

  test('styles alone start from the source', () {
    final plan = assemblePlan(width: 8, height: 8, frames: _frames);
    expect(_chain(plan), [('s1', 'source'), ('s2', 'source')]);
    expect(plan.steps.map((s) => s.id), isNot(contains('hair')));
    expect(plan.cost, 2);
  });

  test('edits alone are a valid plan', () {
    expect(assemblePlan(width: 8, height: 8, hair: _edit()).cost, 1);
  });

  test('nothing at all is no plan', () {
    expect(() => assemblePlan(width: 8, height: 8), throwsArgumentError);
  });

  test('the largest booth fits RENDER_MAX_STEPS', () {
    final plan = assemblePlan(
      width: 8,
      height: 8,
      beard: _edit(),
      glasses: _edit(),
      hair: _edit(),
      frames: List.filled(8, _frames.first),
    );
    expect(plan.steps.length, lessThanOrEqualTo(kRenderMaxSteps));
    expect(plan.cost, 11);
  });

  test('look travels in the style prompt, medium stays out of the field', () {
    const look = RestyleLook(glasses: 'wearing round glasses');
    final s = assemblePlan(width: 8, height: 8, frames: _frames, look: look).steps;
    expect(s[0].prompt, contains('wearing round glasses'));
    expect(s[0].negative, restyleNegative(RestyleMedium.illustration));
    expect(s[1].negative, restyleNegative(RestyleMedium.photo));
    expect(s[0].medium, isNull);
  });

  test('a mask that does not fit the source never reaches the server', () {
    expect(
      () => assemblePlan(width: 8, height: 8, hair: _edit(8, 9)),
      throwsStateError,
    );
  });

  test('clip plan: one step reading the source, priced by engine', () {
    final live = clipPlan('m1', testLive);
    expect(live.steps.single.graph, RenderGraph.livePortrait);
    expect(live.steps.single.input, kRenderSource);
    expect(live.steps.single.motion, 'alive');
    expect(live.steps.single.mask, isNull);
    expect(live.cost, 1);

    final wan = clipPlan('m2', testWan);
    expect(wan.steps.single.graph, RenderGraph.wanMotion);
    expect(wan.cost, kRenderWanCost);
  });
}
