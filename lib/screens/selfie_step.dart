import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      appBar: AppBar(title: const Text('Selfie')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Čelní portrét jednoho člověka, obličej dobře vidět.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Spacer(),
              if (draft.analysing)
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 12),
                      Text('Prohlížím fotku…'),
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
                label: const Text('Vyfotit se'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: !draft.analysing
                    ? () => _take(context, ref, SelfieSource.gallery)
                    : null,
                child: const Text('Vybrat z galerie'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
