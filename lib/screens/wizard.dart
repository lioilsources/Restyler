import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';

import '../providers/booth_provider.dart';
import '../providers/core_providers.dart';
import '../telemetry/telemetry_dictionary.dart';
import 'beard_step.dart';
import 'glasses_step.dart';
import 'hair_step.dart';
import 'styles_step.dart';

enum WizardStep { beard, glasses, hair, styles }

/// Steps after the selfie. A step with an empty catalog (the bench gate has
/// not passed anything yet) simply is not there.
List<WizardStep> wizardSteps(BoothCatalog catalog) => [
  if (catalog.beards.isNotEmpty) WizardStep.beard,
  if (catalog.glasses.isNotEmpty) WizardStep.glasses,
  WizardStep.hair,
  WizardStep.styles,
];

/// To the step after [from]; null = right after the selfie.
void goToNextStep(BuildContext context, WidgetRef ref, WizardStep? from) {
  final steps = wizardSteps(ref.read(catalogProvider));
  final next = steps[from == null ? 0 : steps.indexOf(from) + 1];
  if (from != null) _trackLookStep(ref.read(draftProvider), from);
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      settings: RouteSettings(name: '/${next.name}'),
      builder: (_) => switch (next) {
        WizardStep.beard => const BeardStep(),
        WizardStep.glasses => const GlassesStep(),
        WizardStep.hair => const HairStep(),
        WizardStep.styles => const StylesStep(),
      },
    ),
  );
}

/// Which look step people change, keep, or find closed on their photo.
void _trackLookStep(BoothDraft draft, WizardStep step) {
  final a = draft.analysis;
  final (String? item, bool changed, bool blocked) = switch (step) {
    WizardStep.beard => (
      draft.beard?.id,
      draft.beardEdit != null,
      a?.beardIssue != null,
    ),
    WizardStep.glasses => (
      draft.glasses?.id,
      draft.glassesEdit != null,
      a?.glassesIssue != null,
    ),
    WizardStep.hair => (draft.hair?.id, draft.hairEdit != null, false),
    WizardStep.styles => (null, false, false),
  };
  if (step == WizardStep.styles) return;
  Telemetry.track('look_step', {
    'step': step.name,
    'choice': changed
        ? 'change'
        : blocked
        ? 'blocked'
        : 'keep',
    'item': catalogValue(changed ? item : null, kTelemetryLookIds),
    'colour': catalogValue(
      step == WizardStep.hair && changed ? draft.hairColour?.id : null,
      kTelemetryColourIds,
    ),
  });
}
