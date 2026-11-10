import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';
import 'package:tsumiki_shared/ui.dart';

import '../l10n/l10n.dart';
import '../providers/booth_provider.dart';
import '../providers/core_providers.dart';
import '../services/errors.dart';
import '../widgets/step_scaffold.dart';
import 'wizard.dart';

class GlassesStep extends ConsumerWidget {
  const GlassesStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(draftProvider);
    final notifier = ref.read(draftProvider.notifier);
    final glasses = ref.watch(catalogProvider).glasses;
    final issue = draft.analysis?.glassesIssue;
    final picked = draft.glasses;
    final l = context.l10n;
    return StepScaffold(
      title: l.glassesTitle,
      error: draft.error,
      issue: issue == null ? null : maskErrorText(issue, MaskStep.glasses),
      onKeep: () async {
        await notifier.chooseGlasses(null);
        if (context.mounted) goToNextStep(context, ref, WizardStep.glasses);
      },
      onNext: draft.glassesEdit == null
          ? null
          : () => goToNextStep(context, ref, WizardStep.glasses),
      children: [
        for (final group in kGlassesGroups)
          for (final section in kGlassesSections)
            if (glasses.any((g) => g.group == group && g.section == section))
              StyleSection(
                title:
                    '${catalogName(context, kGlassesGroupCs[group] ?? group, group)} · '
                    '${catalogName(context, kGlassesSectionCs[section] ?? section, section)}',
                children: [
                  for (final g in glasses.where(
                    (g) => g.group == group && g.section == section,
                  ))
                    StyleCard(
                      label: catalogName(context, g.cs, g.label),
                      preview: g.preview,
                      fallbackIcon: Icons.visibility,
                      selected: picked?.id == g.id,
                      onTap: () => notifier.chooseGlasses(
                        g,
                        g.finishes.isEmpty ? null : g.finishes.first,
                      ),
                    ),
                ],
              ),
        if (picked != null && picked.finishes.isNotEmpty)
          StyleSection(
            title: l.glassesFinish,
            children: [
              for (final f in picked.finishes)
                ChoiceChip(
                  label: Text(f),
                  selected: draft.finish == f,
                  onSelected: (_) => notifier.chooseGlasses(picked, f),
                ),
            ],
          ),
      ],
    );
  }
}
