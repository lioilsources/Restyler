import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/core_providers.dart';

/// First start: the parser download, its progress and how to get past a
/// failure. Nothing once the models are here.
class ModelBanner extends ConsumerWidget {
  const ModelBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(modelProvider);
    final scheme = Theme.of(context).colorScheme;
    return switch (model.stage) {
      ModelStage.ready => const SizedBox.shrink(),
      ModelStage.checking => const LinearProgressIndicator(),
      ModelStage.downloading => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Stahuji model pro analýzu tváře, '
            '${(model.progress * 100).round()} %',
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: model.progress),
        ],
      ),
      ModelStage.failed => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.error ?? '', style: TextStyle(color: scheme.error)),
          TextButton(
            onPressed: () => ref.read(modelProvider.notifier).ensure(),
            child: const Text('Stáhnout znovu'),
          ),
        ],
      ),
    };
  }
}
