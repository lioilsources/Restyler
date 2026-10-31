import 'dart:typed_data';

import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../models/booth_project.dart';
import 'analysis.dart';

const kBeardStep = 'beard';
const kGlassesStep = 'glasses';
const kHairStep = 'hair';

/// One finished edit step, waiting for the plan.
class BuiltEdit {
  const BuiltEdit({
    required this.prompt,
    required this.negative,
    required this.mask,
    required this.width,
    required this.height,
  });

  final String prompt;
  final String negative;
  final Uint8List mask;

  /// Size of [mask]; the server refuses one that differs from the source.
  final int width;
  final int height;
}

BuiltEdit _edit(String prompt, String negative, MaskResult result) => BuiltEdit(
  prompt: prompt,
  negative: negative,
  mask: maskToPng(result.mask),
  width: result.mask.w,
  height: result.mask.h,
);

/// The builders below throw [HairMaskException] for a photo the step cannot
/// use, and always work from the original's masks.
BuiltEdit buildBeardEdit(BoothAnalysis a, Beard style) => _edit(
  beardPrompt(style, a.hairColour),
  kBeardNegative,
  buildBeardMask(
    a.masks,
    style.region,
    shave: style.id == kCleanShavenId,
    hasBeard: a.hasBeard,
  ),
);

BuiltEdit buildGlassesEdit(BoothAnalysis a, Glasses style, String? finish) =>
    _edit(
      glassesPrompt(style, finish),
      kGlassesNegative,
      buildGlassesMask(a.masks, style.fit, remove: style.id == kNoGlassesId),
    );

/// `keep-cut` repaints the old silhouette, like `POST /api/hair`.
BuiltEdit buildHairEdit(BoothAnalysis a, Hairstyle style, HairColour? colour) =>
    _edit(
      hairPrompt(style, a.hairColour, newColour: colour),
      kHairNegative,
      buildHairMask(
        a.masks,
        style.shape,
        mode: style.id == kKeepCutId ? 'hair' : kHairMaskMode,
      ),
    );

/// Beard → glasses → hair → styles; each step reads the last one that is
/// actually in the plan, so a skipped step leaves no gap in the chain.
RenderPlan assemblePlan({
  required int width,
  required int height,
  BuiltEdit? beard,
  BuiltEdit? glasses,
  BuiltEdit? hair,
  List<BoothFrame> frames = const [],
  RestyleLook look = const RestyleLook(),
}) {
  final steps = <RenderStep>[];
  var input = kRenderSource;
  for (final (id, edit) in [
    (kBeardStep, beard),
    (kGlassesStep, glasses),
    (kHairStep, hair),
  ]) {
    if (edit == null) continue;
    if (edit.width != width || edit.height != height) {
      throw StateError('mask of $id does not fit the source');
    }
    steps.add(
      RenderStep(
        id: id,
        graph: RenderGraph.kontextEdit,
        input: input,
        prompt: edit.prompt,
        negative: edit.negative,
        mask: edit.mask,
      ),
    );
    input = id;
  }
  for (final (i, frame) in frames.indexed) {
    final style = restyleStyleById(frame.styleId)!;
    steps.add(
      RenderStep(
        id: styleStepId(i + 1),
        graph: RenderGraph.restyleFlux,
        input: input,
        prompt: restyleLookPrompt(style, frame.medium, look: look),
        negative: restyleNegative(frame.medium),
      ),
    );
  }
  return RenderPlan(steps);
}

/// One clip: the frame's bytes go up as `source`, because the job that made
/// the frame may be long gone.
RenderPlan clipPlan(String stepId, Motion motion) => RenderPlan([
  RenderStep(
    id: stepId,
    graph: motion.engine == MotionEngine.wan
        ? RenderGraph.wanMotion
        : RenderGraph.livePortrait,
    input: kRenderSource,
    motion: motion.id,
  ),
]);
