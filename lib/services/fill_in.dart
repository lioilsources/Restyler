import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../models/booth_project.dart';

/// What „Dodělat“ sends: only the steps of [run] with no saved output.
typedef FillIn = ({RenderPlan plan, String sourcePath});

/// The missing steps of [run] as a plan the server accepts on its own. A
/// missing step that reads a finished step reads the source instead, and that
/// step's saved file becomes the source: edits keep the photo's geometry, so
/// masks made on the original still fit.
///
/// Null when nothing is missing, or when the missing steps read more than one
/// finished output (one job has one source); the caller then runs it all.
FillIn? fillInPlan(BoothProject project, BoothRun run) {
  final steps = RenderPlan.fromJson(run.plan).steps;
  final done = project.stepPaths;
  final missing = [
    for (final s in steps)
      if (!done.containsKey(s.id)) s,
  ];
  if (missing.isEmpty || missing.length == steps.length) return null;
  final roots = {
    for (final s in missing)
      if (s.input == kRenderSource || done.containsKey(s.input)) s.input,
  };
  if (roots.length != 1) return null;
  final root = roots.single;
  return (
    plan: RenderPlan([
      for (final s in missing)
        RenderStep(
          id: s.id,
          graph: s.graph,
          input: s.input == root ? kRenderSource : s.input,
          prompt: s.prompt,
          negative: s.negative,
          mask: s.mask,
          medium: s.medium,
          motion: s.motion,
        ),
    ]),
    sourcePath: root == kRenderSource ? run.sourcePath : done[root]!,
  );
}
