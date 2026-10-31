import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/booth_project.dart';
import '../providers/booth_provider.dart';
import '../providers/core_providers.dart';
import '../theme.dart';
import 'booth_screen.dart';
import 'selfie_step.dart';

String _statusText(BoothProject p) => switch (p.status) {
  RunStatus.starting || RunStatus.running => 'Probíhá',
  RunStatus.done => '${p.tiles().length} rámečků',
  RunStatus.partial => 'Část se nepovedla',
  RunStatus.failed => 'Nepovedlo se',
  RunStatus.rejected => 'Nespuštěno',
  RunStatus.lost => 'Ztraceno na serveru',
};

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(boothProvider).projects;
    final config = ref.watch(configProvider);
    final files = ref.watch(projectFilesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Restyler')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!config.configured)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Tenhle build nemá token serveru (make run, .env.local). '
                  'Analýza funguje, render ne.',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            Expanded(
              child: projects.isEmpty
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          'Zatím tu nic není. Začni selfie.',
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
                          title: Text(_statusText(p)),
                          subtitle: Text(
                            '${p.createdAt.day}. ${p.createdAt.month}. '
                            '${p.createdAt.year}',
                          ),
                          trailing: IconButton(
                            tooltip: 'Smazat',
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
                child: const Text('Nová fotobuňka'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
