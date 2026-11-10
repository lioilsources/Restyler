import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';
import 'package:tsumiki_shared/ui.dart';

import '../l10n/l10n.dart';
import '../providers/booth_provider.dart';
import '../widgets/step_scaffold.dart';
import 'wizard.dart';

class HairStep extends ConsumerStatefulWidget {
  const HairStep({super.key});

  @override
  ConsumerState<HairStep> createState() => _HairStepState();
}

class _HairStepState extends ConsumerState<HairStep> {
  String _group = kHairGroupWomen;

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(draftProvider);
    final notifier = ref.read(draftProvider.notifier);
    final style = draft.hair;
    final colour = draft.hairColour;
    final l = context.l10n;
    return StepScaffold(
      title: l.hairTitle,
      error: draft.error,
      onKeep: () async {
        await notifier.chooseHair(null, null);
        if (context.mounted) goToNextStep(context, ref, WizardStep.hair);
      },
      onNext: draft.hairEdit == null
          ? null
          : () => goToNextStep(context, ref, WizardStep.hair),
      children: [
        SegmentedButton<String>(
          segments: [
            ButtonSegment(value: kHairGroupWomen, label: Text(l.hairWomen)),
            ButtonSegment(value: kHairGroupMen, label: Text(l.hairMen)),
          ],
          selected: {_group},
          onSelectionChanged: (s) => setState(() => _group = s.first),
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l.hairKeepCut),
          value: style?.id == kKeepCutId,
          onChanged: (on) =>
              notifier.chooseHair(on == true ? kKeepCutStyle : null, colour),
        ),
        StyleSection(
          title: draft.analysis?.hairColour == null
              ? l.hairColour
              : l.hairColourOnPhoto('${draft.analysis!.hairColour}'),
          children: [
            ChoiceChip(
              label: Text(l.hairNoChange),
              selected: colour == null,
              onSelected: (_) => notifier.chooseHair(style, null),
            ),
            for (final c in kHairColours)
              ChoiceChip(
                avatar: c.swatch == null
                    ? null
                    : CircleAvatar(backgroundColor: Color(c.swatch!)),
                label: Text(catalogName(context, c.cs, c.label)),
                selected: colour?.id == c.id,
                onSelected: (_) => notifier.chooseHair(style, c),
              ),
          ],
        ),
        for (final section in kHairSections)
          if (hairstylesIn(_group, section).isNotEmpty)
            StyleSection(
              title: section,
              children: [
                for (final h in hairstylesIn(_group, section))
                  StyleCard(
                    label: catalogName(context, h.cs, h.label),
                    preview: h.preview,
                    selected: style?.id == h.id,
                    onTap: () => notifier.chooseHair(h, colour),
                  ),
              ],
            ),
      ],
    );
  }
}
