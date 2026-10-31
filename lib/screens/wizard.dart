import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/core_providers.dart';
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
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) => switch (next) {
        WizardStep.beard => const BeardStep(),
        WizardStep.glasses => const GlassesStep(),
        WizardStep.hair => const HairStep(),
        WizardStep.styles => const StylesStep(),
      },
    ),
  );
}
