import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../data/mixes.dart';
import '../l10n/app_localizations.dart';
import '../l10n/style_names.dart';
import '../models/booth_project.dart';
import '../providers/booth_provider.dart';
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
    if (_mixId != null) Telemetry.feature('mix');
    final draft = ref.read(draftProvider);
    if (draft.frames.any((f) => f.medium == RestyleMedium.photo)) {
      Telemetry.feature('photo_medium');
    }
    final id = await ref.read(boothProvider.notifier).start(draft);
    if (!mounted) return;
    ref.read(draftProvider.notifier).reset();
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(
        settings: const RouteSettings(name: '/booth'),
        builder: (_) => BoothScreen(projectId: id),
      ),
      (route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(draftProvider);
    final plan = draft.plan;
    final text = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);
    final matches = kRestyleStyles
        .where(
          (s) =>
              restyleStyleMatchesQuery(s, _query, shown: styleName(l10n, s.id)),
        )
        .take(96);
    String sectionTitle(RestyleSection section) {
      final title = switch (section) {
        RestyleSection.epoch => l10n.sectionEpoch,
        RestyleSection.artist => l10n.sectionArtist,
        RestyleSection.medium => l10n.sectionMedium,
      };
      final n = kRestyleStyles
          .where((s) => restyleSectionOf(s) == section)
          .length;
      return '$title ($n)';
    }

    Widget chips(Iterable<RestyleStyle> styles) => Wrap(
      spacing: 8,
      children: [
        for (final s in styles)
          FilterChip(
            label: Text(styleName(l10n, s.id)),
            selected: draft.frames.any((f) => f.styleId == s.id),
            onSelected: (_) => _toggle(s),
          ),
      ],
    );
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
                    onChanged: (v) {
                      if (v.isNotEmpty) Telemetry.feature('search');
                      setState(() => _query = v);
                    },
                  ),
                  const SizedBox(height: 8),
                  if (_query.isNotEmpty)
                    chips(matches)
                  else
                    // Every style, in three collapsible sections: epochs and
                    // artists by year, media by name.
                    for (final section in RestyleSection.values)
                      ExpansionTile(
                        key: PageStorageKey('style-section-${section.name}'),
                        tilePadding: EdgeInsets.zero,
                        childrenPadding: const EdgeInsets.only(bottom: 8),
                        expandedAlignment: Alignment.centerLeft,
                        initiallyExpanded: section == RestyleSection.epoch,
                        title: Text(sectionTitle(section)),
                        children: [
                          chips(
                            restyleSectionStyles(
                              section,
                              (s) => styleName(l10n, s.id),
                            ),
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
                  if (plan == null)
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
