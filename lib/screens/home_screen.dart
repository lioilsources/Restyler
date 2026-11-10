import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../l10n/l10n.dart';
import '../models/booth_project.dart';
import '../providers/booth_provider.dart';
import '../providers/core_providers.dart';
import '../theme.dart';
import 'booth_screen.dart';
import 'selfie_step.dart';

String _statusText(AppLocalizations l, BoothProject p) => switch (p.status) {
  RunStatus.starting || RunStatus.running => l.statusRunning,
  RunStatus.done => l.statusDone(p.tiles().length),
  RunStatus.partial => l.statusPartial,
  RunStatus.failed => l.statusFailed,
  RunStatus.rejected => l.statusRejected,
  RunStatus.lost => l.statusLost,
};

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(boothProvider).projects;
    final config = ref.watch(configProvider);
    final files = ref.watch(projectFilesProvider);
    final l = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l.appTitle)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!config.configured)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  l.homeNoToken,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            Expanded(
              child: projects.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          l.homeEmpty,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: projects.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemBuilder: (context, i) {
                        final p = projects[i];
                        return ListTile(
                          leading: Container(
                            width: 44,
                            height: 56,
                            color: BoothColors.paper,
                            padding: const EdgeInsets.all(3),
                            child: Image.file(
                              File(files.absolute(p.selfiePath)),
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) =>
                                  const SizedBox.shrink(),
                            ),
                          ),
                          title: Text(_statusText(l, p)),
                          subtitle: Text(
                            DateFormat.yMd(
                              Localizations.localeOf(context).toString(),
                            ).format(p.createdAt),
                          ),
                          trailing: IconButton(
                            tooltip: l.delete,
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () =>
                                ref.read(boothProvider.notifier).delete(p.id),
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => BoothScreen(projectId: p.id),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: () {
                  ref.read(draftProvider.notifier).reset();
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (_) => const SelfieStep()),
                  );
                },
                child: Text(l.homeNew),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
