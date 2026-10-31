import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';
import 'package:uuid/uuid.dart';

import '../models/booth_project.dart';
import '../services/analysis.dart';
import '../services/errors.dart';
import '../services/photo.dart';
import '../services/plan_builder.dart';
import '../services/worker.dart';
import 'core_providers.dart';

const _unset = Object();

/// The wizard in progress. Nothing here is saved or sent: a project starts to
/// exist when the render does.
class BoothDraft {
  const BoothDraft({
    this.photo,
    this.analysis,
    this.analysing = false,
    this.error,
    this.beard,
    this.glasses,
    this.finish,
    this.hair,
    this.hairColour,
    this.beardEdit,
    this.glassesEdit,
    this.hairEdit,
    this.frames = const [],
  });

  final PreparedPhoto? photo;
  final BoothAnalysis? analysis;
  final bool analysing;

  /// Czech; set by the analysis or by the last pick that failed.
  final String? error;
  final Beard? beard;
  final Glasses? glasses;
  final String? finish;
  final Hairstyle? hair;
  final HairColour? hairColour;
  final BuiltEdit? beardEdit;
  final BuiltEdit? glassesEdit;
  final BuiltEdit? hairEdit;
  final List<BoothFrame> frames;

  BoothDraft copyWith({
    Object? photo = _unset,
    Object? analysis = _unset,
    bool? analysing,
    Object? error = _unset,
    Object? beard = _unset,
    Object? glasses = _unset,
    Object? finish = _unset,
    Object? hair = _unset,
    Object? hairColour = _unset,
    Object? beardEdit = _unset,
    Object? glassesEdit = _unset,
    Object? hairEdit = _unset,
    List<BoothFrame>? frames,
  }) => BoothDraft(
    photo: identical(photo, _unset) ? this.photo : photo as PreparedPhoto?,
    analysis: identical(analysis, _unset)
        ? this.analysis
        : analysis as BoothAnalysis?,
    analysing: analysing ?? this.analysing,
    error: identical(error, _unset) ? this.error : error as String?,
    beard: identical(beard, _unset) ? this.beard : beard as Beard?,
    glasses: identical(glasses, _unset) ? this.glasses : glasses as Glasses?,
    finish: identical(finish, _unset) ? this.finish : finish as String?,
    hair: identical(hair, _unset) ? this.hair : hair as Hairstyle?,
    hairColour: identical(hairColour, _unset)
        ? this.hairColour
        : hairColour as HairColour?,
    beardEdit: identical(beardEdit, _unset)
        ? this.beardEdit
        : beardEdit as BuiltEdit?,
    glassesEdit: identical(glassesEdit, _unset)
        ? this.glassesEdit
        : glassesEdit as BuiltEdit?,
    hairEdit: identical(hairEdit, _unset)
        ? this.hairEdit
        : hairEdit as BuiltEdit?,
    frames: frames ?? this.frames,
  );

  RestyleLook get look => RestyleLook.of(
    beard: beard,
    glasses: glasses,
    finish: finish,
    hair: hair,
    hairColour: hair == null
        ? null
        : hairColour?.phrase ?? analysis?.hairColour,
  );

  /// Null while there is nothing to render.
  RenderPlan? get plan {
    final p = photo;
    if (p == null) return null;
    if (beardEdit == null &&
        glassesEdit == null &&
        hairEdit == null &&
        frames.isEmpty) {
      return null;
    }
    return assemblePlan(
      width: p.width,
      height: p.height,
      beard: beardEdit,
      glasses: glassesEdit,
      hair: hairEdit,
      frames: frames,
      look: look,
    );
  }
}

Future<BuiltEdit> _beardEdit(Worker w, BoothAnalysis a, Beard style) =>
    w(() => buildBeardEdit(a, style));

Future<BuiltEdit> _glassesEdit(
  Worker w,
  BoothAnalysis a,
  Glasses style,
  String? finish,
) => w(() => buildGlassesEdit(a, style, finish));

Future<BuiltEdit> _hairEdit(
  Worker w,
  BoothAnalysis a,
  Hairstyle style,
  HairColour? colour,
) => w(() => buildHairEdit(a, style, colour));

Future<Uint8List> _fit(Worker w, Uint8List bytes) =>
    w(() => fitForUpload(bytes));

class DraftNotifier extends Notifier<BoothDraft> {
  @override
  BoothDraft build() => const BoothDraft();

  void reset() => state = const BoothDraft();

  /// Selfie → analysis, right away and with no network beyond the first model
  /// download. Returns whether the wizard can go on.
  Future<bool> analyse(Uint8List raw) async {
    state = const BoothDraft(analysing: true);
    try {
      final (photo, analysis) = await analyseSelfie(
        raw,
        ref.read(faceParserProvider),
        ref.read(workerProvider),
      );
      state = BoothDraft(photo: photo, analysis: analysis);
      return true;
    } catch (e) {
      state = BoothDraft(error: analysisErrorText(e));
    }
    return false;
  }

  /// Null clears the pick ("Nechat").
  Future<void> chooseBeard(Beard? style) async {
    final a = state.analysis!;
    if (style == null) {
      state = state.copyWith(beard: null, beardEdit: null, error: null);
      return;
    }
    try {
      final edit = await _beardEdit(ref.read(workerProvider), a, style);
      state = state.copyWith(beard: style, beardEdit: edit, error: null);
    } on HairMaskException catch (e) {
      state = state.copyWith(
        beard: null,
        beardEdit: null,
        error: maskErrorText(e, MaskStep.beard),
      );
    }
  }

  Future<void> chooseGlasses(Glasses? style, [String? finish]) async {
    final a = state.analysis!;
    if (style == null) {
      state = state.copyWith(
        glasses: null,
        finish: null,
        glassesEdit: null,
        error: null,
      );
      return;
    }
    try {
      final edit = await _glassesEdit(
        ref.read(workerProvider),
        a,
        style,
        finish,
      );
      state = state.copyWith(
        glasses: style,
        finish: finish,
        glassesEdit: edit,
        error: null,
      );
    } on HairMaskException catch (e) {
      state = state.copyWith(
        glasses: null,
        finish: null,
        glassesEdit: null,
        error: maskErrorText(e, MaskStep.glasses),
      );
    }
  }

  Future<void> chooseHair(Hairstyle? style, HairColour? colour) async {
    final a = state.analysis!;
    // Same cut with no new colour would ask the model for nothing.
    if (style == null || (style.id == kKeepCutId && colour == null)) {
      state = state.copyWith(
        hair: style,
        hairColour: colour,
        hairEdit: null,
        error: null,
      );
      return;
    }
    try {
      final edit = await _hairEdit(ref.read(workerProvider), a, style, colour);
      state = state.copyWith(
        hair: style,
        hairColour: colour,
        hairEdit: edit,
        error: null,
      );
    } on HairMaskException catch (e) {
      state = state.copyWith(
        hair: null,
        hairColour: null,
        hairEdit: null,
        error: maskErrorText(e),
      );
    }
  }

  void setFrames(List<BoothFrame> frames) =>
      state = state.copyWith(frames: frames);
}

final draftProvider = NotifierProvider<DraftNotifier, BoothDraft>(
  DraftNotifier.new,
);

class BoothState {
  const BoothState({
    this.projects = const [],
    this.live = const {},
    this.connection = const {},
  });

  final List<BoothProject> projects;

  /// Last poll per `projectId/runId`, for the stage banner.
  final Map<String, RenderJobStatus> live;

  /// Why polling is retrying, per `projectId/runId`.
  final Map<String, String> connection;

  BoothProject? byId(String id) {
    for (final p in projects) {
      if (p.id == id) return p;
    }
    return null;
  }
}

class BoothNotifier extends Notifier<BoothState> {
  final _tracking = <String>{};

  /// Runs with a POST in flight: not to be taken for ones the app died in.
  final _posting = <String>{};

  @override
  BoothState build() =>
      BoothState(projects: ref.read(projectStoreProvider).all());

  String _key(String projectId, String runId) => '$projectId/$runId';

  /// After an await the notifier may be gone: polling outlives anything.
  BoothProject? _alive(String id) => ref.mounted ? state.byId(id) : null;

  Future<void> _put(BoothProject project) async {
    if (!ref.mounted) return;
    await ref.read(projectStoreProvider).save(project);
    if (!ref.mounted) return;
    final known = state.byId(project.id) != null;
    state = BoothState(
      projects: known
          ? [
              for (final p in state.projects)
                p.id == project.id ? project : p,
            ]
          : [project, ...state.projects],
      live: state.live,
      connection: state.connection,
    );
  }

  void _setLive(String key, RenderJobStatus? status, {String? connection}) {
    if (!ref.mounted) return;
    final live = {...state.live};
    if (status == null) {
      live.remove(key);
    } else {
      live[key] = status;
    }
    final conn = {...state.connection};
    if (connection == null) {
      conn.remove(key);
    } else {
      conn[key] = connection;
    }
    state = BoothState(
      projects: state.projects,
      live: live,
      connection: conn,
    );
  }

  /// Saves the project and posts its plan. Returns the project id.
  Future<String> start(BoothDraft draft) async {
    final photo = draft.photo!;
    final plan = draft.plan!;
    final id = const Uuid().v4();
    final selfie = 'projects/$id/source.jpg';
    await ref.read(projectFilesProvider).write(selfie, photo.bytes);
    final project = BoothProject(
      id: id,
      createdAt: DateTime.now(),
      selfiePath: selfie,
      beardId: draft.beard?.id,
      glassesId: draft.glasses?.id,
      glassesFinish: draft.finish,
      hairStyleId: draft.hair?.id,
      hairColourId: draft.hairColour?.id,
      frames: draft.frames,
      run: BoothRun(
        id: kMainRun,
        plan: plan.toJson(),
        sourcePath: selfie,
        status: RunStatus.starting,
      ),
    );
    _posting.add(_key(id, kMainRun));
    await _put(project);
    await _submit(id, kMainRun);
    return id;
  }

  /// The saved plan on the saved source; nothing is recomputed. The old
  /// outputs go only once the server has taken the job, so a refusal (429, no
  /// quota) leaves the project as it was.
  Future<void> _submit(String projectId, String runId) async {
    try {
      await _post(projectId, runId);
    } finally {
      _posting.remove(_key(projectId, runId));
    }
  }

  Future<void> _post(String projectId, String runId) async {
    final project = state.byId(projectId)!;
    final run = project.runById(runId)!;
    final RenderJob job;
    try {
      final source = await ref.read(projectFilesProvider).read(run.sourcePath);
      job = await ref
          .read(renderServiceProvider)
          .start(
            await _fit(ref.read(workerProvider), source),
            RenderPlan.fromJson(run.plan),
          );
    } on Exception catch (e) {
      final current = state.byId(projectId)!;
      final latest = current.runById(runId)!;
      await _put(
        current.withRun(
          latest.copyWith(
            status: latest.status == RunStatus.starting
                ? RunStatus.rejected
                : latest.status,
            error: backendErrorText(e),
          ),
        ),
      );
      return;
    }
    final current = state.byId(projectId)!;
    final paths = {...current.stepPaths};
    run.stepIds.forEach(paths.remove);
    await _put(
      current
          .copyWith(stepPaths: paths)
          .withRun(
            run.copyWith(
              status: RunStatus.running,
              jobId: job.jobId,
              failed: const [],
              error: null,
            ),
          ),
    );
    ref.invalidate(accountProvider);
    unawaited(_track(projectId, runId, job.jobId));
  }

  /// „Spustit znovu“.
  Future<void> retry(String projectId, String runId) async {
    if (_posting.add(_key(projectId, runId))) await _submit(projectId, runId);
  }

  /// Oživit. Nothing is kept when the server refuses: returns the Czech reason
  /// (the 429 of a running render, typically) and the booth stays as it was.
  Future<String?> startClip(
    String projectId,
    String frameKey,
    Motion motion,
  ) async {
    final project = state.byId(projectId)!;
    final path = project.pathOf(frameKey);
    if (path == null) return 'Tenhle rámeček ještě není hotový.';
    final clipId = project.nextClipId();
    final plan = clipPlan(clipId, motion);
    final RenderJob job;
    try {
      final bytes = await ref.read(projectFilesProvider).read(path);
      job = await ref
          .read(renderServiceProvider)
          .start(await _fit(ref.read(workerProvider), bytes), plan);
    } on Exception catch (e) {
      return backendErrorText(e);
    }
    final current = state.byId(projectId)!;
    await _put(
      current.copyWith(
        clips: [
          ...current.clips,
          BoothRun(
            id: clipId,
            plan: plan.toJson(),
            sourcePath: path,
            status: RunStatus.running,
            jobId: job.jobId,
            frameKey: frameKey,
            motionId: motion.id,
          ),
        ],
      ),
    );
    ref.invalidate(accountProvider);
    unawaited(_track(projectId, clipId, job.jobId));
    return null;
  }

  /// At start, on resume and after an outage: picks up every job that was
  /// running. A POST the app died in has no job id to pick up.
  Future<void> resumeAll() async {
    for (final project in state.projects) {
      for (final run in project.runs) {
        final jobId = run.jobId;
        if (run.status == RunStatus.running && jobId != null) {
          unawaited(_track(project.id, run.id, jobId));
        } else if (run.status == RunStatus.starting &&
            !_posting.contains(_key(project.id, run.id))) {
          await _put(
            project.withRun(
              run.copyWith(
                status: RunStatus.rejected,
                error: 'Render se nepodařilo spustit.',
              ),
            ),
          );
        }
      }
    }
  }

  Future<void> delete(String projectId) async {
    await ref.read(projectStoreProvider).delete(projectId);
    await ref.read(projectFilesProvider).deleteProject(projectId);
    state = BoothState(
      projects: [
        for (final p in state.projects)
          if (p.id != projectId) p,
      ],
      live: state.live,
      connection: state.connection,
    );
  }

  Future<void> _track(String projectId, String runId, String jobId) async {
    final key = _key(projectId, runId);
    if (!_tracking.add(key)) return;
    final service = ref.read(renderServiceProvider);
    var failures = 0;
    try {
      while (ref.mounted) {
        try {
          await for (final status in service.status(jobId)) {
            failures = 0;
            _setLive(key, status);
            if (_alive(projectId) == null) return; // deleted meanwhile
            await _absorb(projectId, jobId, status);
            if (status.finished) {
              await _finish(projectId, runId, status);
              return;
            }
          }
          return;
        } on BackendException catch (e) {
          if (e.notFound) {
            await _markLost(projectId, runId);
            return;
          }
          failures++;
          _noteProblem(key, e);
        } on Exception catch (e) {
          failures++;
          _noteProblem(key, e);
        }
        await Future<void>.delayed(service.retryDelay(failures));
      }
    } finally {
      _tracking.remove(key);
      _setLive(key, null);
    }
  }

  void _noteProblem(String key, Exception e) {
    if (ref.mounted) {
      _setLive(key, state.live[key], connection: backendErrorText(e));
    }
  }

  /// A finished step goes to a file at once: the server keeps jobs in memory
  /// and may restart at any moment.
  Future<void> _absorb(
    String projectId,
    String jobId,
    RenderJobStatus status,
  ) async {
    for (final entry in status.steps.entries) {
      final project = _alive(projectId);
      if (project == null) return;
      if (entry.value.status != 'done') continue;
      if (project.stepPaths.containsKey(entry.key)) continue;
      final bytes = await ref
          .read(renderServiceProvider)
          .step(jobId, entry.key);
      final ext = entry.value.kind == 'video' ? 'mp4' : 'png';
      final path = 'projects/$projectId/${entry.key}.$ext';
      await ref.read(projectFilesProvider).write(path, bytes);
      final current = _alive(projectId);
      if (current == null) return;
      await _put(
        current.copyWith(stepPaths: {...current.stepPaths, entry.key: path}),
      );
    }
  }

  /// `status` decides, never `done`/`total`: with skipped steps `done` stops
  /// short of `total` for good.
  Future<void> _finish(
    String projectId,
    String runId,
    RenderJobStatus status,
  ) async {
    final project = _alive(projectId);
    if (project == null) return;
    final run = project.runById(runId)!;
    final failed = [
      for (final e in status.steps.entries)
        if (e.value.status == 'error' || e.value.status == 'skipped') e.key,
    ];
    final next = status.status == 'error'
        ? RunStatus.failed
        : failed.isEmpty
        ? RunStatus.done
        : RunStatus.partial;
    await _put(
      project.withRun(
        run.copyWith(
          status: next,
          jobId: null,
          failed: failed,
          error: next == RunStatus.failed
              ? 'Render se nepovedl. Generace jsou vrácené.'
              : null,
        ),
      ),
    );
    if (ref.mounted) ref.invalidate(accountProvider);
  }

  Future<void> _markLost(String projectId, String runId) async {
    final project = _alive(projectId);
    if (project == null) return;
    await _put(
      project.withRun(
        project
            .runById(runId)!
            .copyWith(
              status: RunStatus.lost,
              jobId: null,
              error: 'Server se mezitím restartoval a render ztratil.',
            ),
      ),
    );
  }
}

final boothProvider = NotifierProvider<BoothNotifier, BoothState>(
  BoothNotifier.new,
);
