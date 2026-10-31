import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';
import 'package:tsumiki_shared/ui.dart';

import '../data/mixes.dart';
import '../models/booth_project.dart';
import '../providers/booth_provider.dart';
import '../providers/core_providers.dart';
import 'booth_screen.dart';

const kFrameCounts = [4, 6, 8];

class StylesStep extends ConsumerStatefulWidget {
  const StylesStep({super.key});

  @override
  ConsumerState<StylesStep> createState() => _StylesStepState();
}

class _StylesStepState extends ConsumerState<StylesStep> {
  int _count = 4;
  String? _mixId;
  String _query = '';
  bool _starting = false;
  RestyleMedium _medium = RestyleMedium.illustration;

  void _applyMix(StyleMix mix, int count) {
    setState(() {
      _mixId = mix.id;
      _count = count;
    });
    ref
        .read(draftProvider.notifier)
        .setFrames(mix.frames.take(count).toList(growable: false));
  }

  void _setCount(int count) {
    final mix = kStyleMixes.where((m) => m.id == _mixId);
    if (mix.isNotEmpty) {
      _applyMix(mix.first, count);
      return;
    }
    setState(() => _count = count);
    final frames = ref.read(draftProvider).frames;
    if (frames.length > count) {
      ref.read(draftProvider.notifier).setFrames(frames.take(count).toList());
    }
  }

  void _toggle(RestyleStyle style) {
    final frames = ref.read(draftProvider).frames;
    final has = frames.any((f) => f.styleId == style.id);
    if (!has && frames.length >= _count) return;
    setState(() => _mixId = null);
    ref
        .read(draftProvider.notifier)
        .setFrames(
          has
              ? frames.where((f) => f.styleId != style.id).toList()
              : [...frames, BoothFrame(styleId: style.id, medium: _medium)],
        );
  }

  Future<void> _start() async {
    setState(() => _starting = true);
    final draft = ref.read(draftProvider);
    final id = await ref.read(boothProvider.notifier).start(draft);
    if (!mounted) return;
    ref.read(draftProvider.notifier).reset();
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(builder: (_) => BoothScreen(projectId: id)),
      (route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(draftProvider);
    final plan = draft.plan;
    final account = ref.watch(accountProvider).value;
    final text = Theme.of(context).textTheme;
    final matches = kRestyleStyles
        .where((s) => restyleStyleMatchesQuery(s, _query))
        .take(_query.isEmpty ? 24 : 96);
    return Scaffold(
      appBar: AppBar(title: const Text('Styly')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text('Kolik rámečků', style: text.titleSmall),
                  const SizedBox(height: 8),
                  SegmentedButton<int>(
                    segments: [
                      for (final k in kFrameCounts)
                        ButtonSegment(value: k, label: Text('$k')),
                    ],
                    selected: {_count},
                    onSelectionChanged: (s) => _setCount(s.first),
                  ),
                  const SizedBox(height: 16),
                  Text('Hotové mixy', style: text.titleSmall),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      for (final mix in kStyleMixes)
                        ChoiceChip(
                          label: Text(mix.label),
                          selected: _mixId == mix.id,
                          onSelected: (_) => _applyMix(mix, _count),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Vybráno ${draft.frames.length} z $_count',
                    style: text.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  SegmentedButton<RestyleMedium>(
                    segments: const [
                      ButtonSegment(
                        value: RestyleMedium.illustration,
                        label: Text('Malba'),
                      ),
                      ButtonSegment(
                        value: RestyleMedium.photo,
                        label: Text('Fotka'),
                      ),
                    ],
                    selected: {_medium},
                    onSelectionChanged: (s) =>
                        setState(() => _medium = s.first),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Hledat styl',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (v) => setState(() => _query = v),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      for (final s in matches)
                        FilterChip(
                          label: Text(s.label),
                          selected: draft.frames.any((f) => f.styleId == s.id),
                          onSelected: (_) => _toggle(s),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (plan != null)
                    TextButton(
                      onPressed: account == null
                          ? null
                          : () => QuotaSheet.show(
                              context,
                              account,
                              cost: plan.cost,
                            ),
                      child: Text(
                        account == null
                            ? 'Stojí ${plan.cost} generací'
                            : 'Stojí ${plan.cost} generací, zbývá '
                                  '${account.totalRemaining}',
                      ),
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Vyber aspoň jednu úpravu nebo styl.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  FilledButton(
                    onPressed: plan == null || _starting ? null : _start,
                    child: const Text('Spustit fotobuňku'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
