import 'package:flutter/material.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../l10n/l10n.dart';
import '../models/booth_project.dart';
import '../services/plan_builder.dart';

/// "Editing the beard…" and its siblings, from the last poll.
String stageText(BoothProject project, RenderJobStatus? status, [AppLocalizations? l]) {
  l ??= deviceL10n;
  if (status == null) return l.stageWaitingServer;
  String? active;
  for (final e in status.steps.entries) {
    if (e.value.status == 'running') {
      active = e.key;
      break;
    }
  }
  switch (active) {
    case kBeardStep:
      return l.stageBeard;
    case kGlassesStep:
      return l.stageGlasses;
    case kHairStep:
      return l.stageHair;
  }
  final styles = status.steps.keys.where((k) => k.startsWith('s'));
  if (styles.isEmpty) return l.stageQueue;
  final done = styles.where((k) => status.steps[k]!.finished).length;
  final total = styles.length;
  return l.stagePainting(done < total ? done + 1 : total, total);
}

class StageBanner extends StatelessWidget {
  const StageBanner({super.key, required this.text, this.problem});

  final String text;

  /// Connection trouble while polling continues.
  final String? problem;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(text)),
          ],
        ),
        if (problem != null) ...[
          const SizedBox(height: 4),
          Text(
            problem!,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ],
      ],
    ),
  );
}
