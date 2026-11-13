import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../l10n/app_localizations.dart';
import '../l10n/style_names.dart';
import '../models/booth_project.dart';
import '../providers/booth_provider.dart';
import '../providers/core_providers.dart';
import '../services/strip.dart';
import '../services/worker.dart';
import '../theme.dart';
import '../widgets/frame_tile.dart';
import '../widgets/motion_sheet.dart';
import '../widgets/stage_banner.dart';
import 'clip_screen.dart';

Future<Uint8List> _compose(
  Worker worker,
  List<StripFrame> frames,
  StripLayout layout,
  Uint8List font,
) => worker(() => composeStrip(frames, layout, font));

class BoothScreen extends ConsumerStatefulWidget {
  const BoothScreen({super.key, required this.projectId});

  final String projectId;

  @override
  ConsumerState<BoothScreen> createState() => _BoothScreenState();
}

class _BoothScreenState extends ConsumerState<BoothScreen> {
  StripLayout _layout = StripLayout.grid;
  bool _working = false;

  void _say(String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  Future<void> _animate(BoothProject project, BoothTile tile) async {
    final catalog = ref.read(catalogProvider);
    final motion = await MotionSheet.show(
      context,
      catalog.motions,
      project.nextClipId(),
    );
    if (motion == null || !mounted) return;
    final error = await ref
        .read(boothProvider.notifier)
        .startClip(project.id, tile.key, motion);
    if (error != null && mounted) _say(error);
  }

  void _play(BoothRun clip, BoothProject project) {
    final path = project.stepPaths[clip.id]!;
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ClipScreen(
          path: ref.read(projectFilesProvider).absolute(path),
          title: motionById(clip.motionId)?.cs ?? 'Klip',
        ),
      ),
    );
  }

  /// The sheet of what is here; a frame still rendering or failed stays out.
  Future<String?> _writeStrip(BoothProject project) async {
    final files = ref.read(projectFilesProvider);
    final l10n = AppLocalizations.of(context);
    final frames = <StripFrame>[];
    for (final tile in project.tiles(styleName: (id) => styleName(l10n, id))) {
      final path = project.pathOf(tile.key);
      if (path != null) {
        frames.add(StripFrame(await files.read(path), tile.label));
      }
    }
    if (frames.isEmpty) return null;
    final font = await rootBundle.load('assets/fonts/strip_font.zip');
    final png = await _compose(
      ref.read(workerProvider),
      frames,
      _layout,
      font.buffer.asUint8List(),
    );
    final out = 'projects/${project.id}/strip-${_layout.name}.png';
    await files.write(out, png);
    return files.absolute(out);
  }

  Future<void> _export(
    BoothProject project,
    Future<void> Function(String path) use,
  ) async {
    setState(() => _working = true);
    try {
      final path = await _writeStrip(project);
      if (path == null) {
        _say('Zatím není hotový žádný rámeček.');
      } else {
        await use(path);
      }
    } on GalException {
      _say('Pás se nepodařilo uložit do Fotek.');
    } finally {
      if (mounted) setState(() => _working = false);
    }
  }

  TileState _stateOf(BoothProject project, BoothTile tile) {
    if (project.pathOf(tile.key) != null) return TileState.ready;
    final run = project.run;
    return run.status.active ? TileState.waiting : TileState.failed;
  }

  @override
  Widget build(BuildContext context) {
    final booth = ref.watch(boothProvider);
    final project = booth.byId(widget.projectId);
    if (project == null) return const Scaffold();
    final catalog = ref.watch(catalogProvider);
    final notifier = ref.read(boothProvider.notifier);
    final run = project.run;
    final key = '${project.id}/$kMainRun';
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final tiles = project.tiles(styleName: (id) => styleName(l10n, id));

    return Scaffold(
      appBar: AppBar(title: const Text('Fotobuňka')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (run.status.active)
              StageBanner(
                text: stageText(project, booth.live[key]),
                problem: booth.connection[key],
              ),
            if (run.error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(run.error!, style: TextStyle(color: scheme.error)),
              ),
            if (run.status == RunStatus.partial)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Některé rámečky se nepovedly. Generace za ně jsou vrácené.',
                  style: TextStyle(color: scheme.error),
                ),
              ),
            if (run.status.canRetry)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: FilledButton(
                  onPressed: () => notifier.retry(project.id, kMainRun),
                  child: Text(
                    'Spustit znovu (${RenderPlan.fromJson(run.plan).cost})',
                  ),
                ),
              ),
            Container(
              color: BoothColors.paper,
              padding: const EdgeInsets.all(6),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: catalog.motions.isEmpty ? 0.78 : 0.68,
                children: [
                  for (final tile in tiles) _tile(project, tile, catalog),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SegmentedButton<StripLayout>(
              segments: const [
                ButtonSegment(value: StripLayout.grid, label: Text('Mřížka')),
                ButtonSegment(value: StripLayout.strip, label: Text('Pás')),
              ],
              selected: {_layout},
              onSelectionChanged: (s) => setState(() => _layout = s.first),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _working
                        ? null
                        : () => _export(project, (path) async {
                            await Gal.putImage(path);
                            _say('Pás je ve Fotkách.');
                          }),
                    child: const Text('Uložit do Fotek'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _working
                        ? null
                        : () => _export(
                            project,
                            (path) => SharePlus.instance
                                .share(ShareParams(files: [XFile(path)]))
                                .then((_) {}),
                          ),
                    child: const Text('Sdílet'),
                  ),
                ),
              ],
            ),
            for (final clip in project.clips) ...[
              const SizedBox(height: 8),
              _clipRow(project, clip, booth),
            ],
          ],
        ),
      ),
    );
  }

  Widget _tile(BoothProject project, BoothTile tile, BoothCatalog catalog) {
    final path = project.pathOf(tile.key);
    final finished = project.clips.where(
      (c) => c.frameKey == tile.key && project.stepPaths.containsKey(c.id),
    );
    return FrameTile(
      label: tile.label,
      state: _stateOf(project, tile),
      file: path == null ? null : ref.read(projectFilesProvider).absolute(path),
      onAnimate: catalog.motions.isEmpty || path == null
          ? null
          : () => _animate(project, tile),
      hasClip: finished.isNotEmpty,
      onPlay: finished.isEmpty ? null : () => _play(finished.last, project),
    );
  }

  Widget _clipRow(BoothProject project, BoothRun clip, BoothState booth) {
    final name = motionById(clip.motionId)?.cs ?? clip.motionId ?? 'Klip';
    final ready = project.stepPaths.containsKey(clip.id);
    final problem = booth.connection['${project.id}/${clip.id}'];
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(name),
      subtitle: Text(
        problem ??
            clip.error ??
            (clip.status.active
                ? 'Oživuji…'
                : ready
                ? 'Hotovo'
                : 'Nepovedlo se. Generace jsou vrácené.'),
      ),
      trailing: ready
          ? IconButton(
              tooltip: 'Přehrát klip',
              icon: const Icon(Icons.play_arrow),
              onPressed: () => _play(clip, project),
            )
          : clip.status.canRetry
          ? TextButton(
              onPressed: () =>
                  ref.read(boothProvider.notifier).retry(project.id, clip.id),
              child: const Text('Spustit znovu'),
            )
          : null,
    );
  }
}
