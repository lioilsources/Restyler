import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';
import 'package:tsumiki_shared/ui.dart';

import '../providers/booth_provider.dart';
import '../providers/core_providers.dart';
import '../services/errors.dart';
import '../widgets/step_scaffold.dart';
import 'wizard.dart';

class BeardStep extends ConsumerWidget {
  const BeardStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(draftProvider);
    final notifier = ref.read(draftProvider.notifier);
    final beards = ref.watch(catalogProvider).beards;
    final issue = draft.analysis?.beardIssue;
    return StepScaffold(
      title: 'Vousy',
      error: draft.error,
      issue: issue == null ? null : maskErrorText(issue, MaskStep.beard),
      onKeep: () async {
        await notifier.chooseBeard(null);
        if (context.mounted) goToNextStep(context, ref, WizardStep.beard);
      },
      onNext: draft.beardEdit == null
          ? null
          : () => goToNextStep(context, ref, WizardStep.beard),
      children: [
        for (final section in kBeardSections)
          if (beardsIn(section, beards).isNotEmpty)
            StyleSection(
              title: kBeardSectionCs[section] ?? section,
              children: [
                for (final b in beardsIn(section, beards))
                  StyleCard(
                    label: b.cs,
                    preview: b.previewPath,
                    selected: draft.beard?.id == b.id,
                    onTap: () => notifier.chooseBeard(b),
                  ),
              ],
            ),
      ],
    );
  }
}
