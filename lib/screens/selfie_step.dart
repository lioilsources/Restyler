import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/l10n.dart';
import '../providers/booth_provider.dart';
import '../providers/core_providers.dart';
import '../services/errors.dart';
import '../services/photo_source.dart';
import 'wizard.dart';

class SelfieStep extends ConsumerWidget {
  const SelfieStep({super.key});

  Future<void> _take(
    BuildContext context,
    WidgetRef ref,
    SelfieSource source,
  ) async {
    final raw = await ref.read(photoSourceProvider).pick(source);
    if (raw == null || !context.mounted) return;
    final ok = await ref.read(draftProvider.notifier).analyse(raw);
    if (ok && context.mounted) goToNextStep(context, ref, null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(draftProvider);
    final catalog = ref.watch(catalogProvider);
    final scheme = Theme.of(context).colorScheme;
    final a = draft.analysis;
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.selfieTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.l10n.selfieHint,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Spacer(),
              if (draft.analysing)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 12),
                      Text(context.l10n.selfieAnalysing),
                    ],
                  ),
                ),
              if (draft.error != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    draft.error!,
                    style: TextStyle(color: scheme.error),
                  ),
                ),
              if (a?.beardIssue != null && catalog.beards.isNotEmpty)
                Text(maskErrorText(a!.beardIssue!, MaskStep.beard)),
              if (a?.glassesIssue != null && catalog.glasses.isNotEmpty)
                Text(maskErrorText(a!.glassesIssue!, MaskStep.glasses)),
              const Spacer(),
              FilledButton.icon(
                onPressed: !draft.analysing
                    ? () => _take(context, ref, SelfieSource.camera)
                    : null,
                icon: const Icon(Icons.photo_camera),
                label: Text(context.l10n.takePhoto),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: !draft.analysing
                    ? () => _take(context, ref, SelfieSource.gallery)
                    : null,
                child: Text(context.l10n.pickGallery),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
