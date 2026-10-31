import 'package:tsumiki_shared/tsumiki_shared.dart';

/// starting → running → done | partial | failed; rejected = the server refused
/// the POST; lost = the server no longer knows the job. Rejected, failed and
/// lost can run again from the saved plan.
enum RunStatus {
  starting,
  running,
  done,
  partial,
  failed,
  rejected,
  lost;

  bool get canRetry => this == failed || this == rejected || this == lost;
  bool get active => this == starting || this == running;
}

const kMainRun = 'main';
const kSelfieKey = 'selfie';

const _unset = Object();

/// One submitted plan: the booth itself ([kMainRun]) or a clip. Holds all that
/// is needed to run it again: the plan and which saved file was its source.
class BoothRun {
  const BoothRun({
    required this.id,
    required this.plan,
    required this.sourcePath,
    required this.status,
    this.jobId,
    this.failed = const [],
    this.error,
    this.frameKey,
    this.motionId,
  });

  final String id;

  /// `RenderPlan.toJson()`; masks included, so nothing is recomputed.
  final List<Object?> plan;
  final String sourcePath;
  final RunStatus status;
  final String? jobId;
  final List<String> failed;
  final String? error;

  /// Clips: the frame it animates and the preset.
  final String? frameKey;
  final String? motionId;

  List<String> get stepIds => [
    for (final s in plan) (s as Map)['id'] as String,
  ];

  BoothRun copyWith({
    RunStatus? status,
    Object? jobId = _unset,
    List<String>? failed,
    Object? error = _unset,
  }) => BoothRun(
    id: id,
    plan: plan,
    sourcePath: sourcePath,
    status: status ?? this.status,
    jobId: identical(jobId, _unset) ? this.jobId : jobId as String?,
    failed: failed ?? this.failed,
    error: identical(error, _unset) ? this.error : error as String?,
    frameKey: frameKey,
    motionId: motionId,
  );

  Map<String, Object?> toJson() => {
    'id': id,
    'plan': plan,
    'sourcePath': sourcePath,
    'status': status.name,
    'jobId': jobId,
    'failed': failed,
    'error': error,
    'frameKey': frameKey,
    'motionId': motionId,
  };

  factory BoothRun.fromJson(Map<String, dynamic> json) => BoothRun(
    id: json['id'] as String,
    plan: json['plan'] as List<dynamic>,
    sourcePath: json['sourcePath'] as String,
    status: RunStatus.values.byName(json['status'] as String),
    jobId: json['jobId'] as String?,
    failed: (json['failed'] as List).cast<String>(),
    error: json['error'] as String?,
    frameKey: json['frameKey'] as String?,
    motionId: json['motionId'] as String?,
  );
}

/// A rendered style of the booth.
class BoothFrame {
  const BoothFrame({required this.styleId, required this.medium});

  final String styleId;
  final RestyleMedium medium;

  Map<String, Object?> toJson() => {'styleId': styleId, 'medium': medium.wire};

  factory BoothFrame.fromJson(Map<String, dynamic> json) => BoothFrame(
    styleId: json['styleId'] as String,
    medium: RestyleMedium.values.firstWhere((m) => m.wire == json['medium']),
  );
}

/// What a tile of the booth shows. [key] is a step id or [kSelfieKey].
class BoothTile {
  const BoothTile({required this.key, required this.label});

  final String key;
  final String label;
}

class BoothProject {
  const BoothProject({
    required this.id,
    required this.createdAt,
    required this.selfiePath,
    required this.run,
    this.parsePath,
    this.beardId,
    this.glassesId,
    this.glassesFinish,
    this.hairStyleId,
    this.hairColourId,
    this.frames = const [],
    this.stepPaths = const {},
    this.clips = const [],
  });

  final String id;
  final DateTime createdAt;

  /// Paths are relative to the app's files root: iOS moves the container on
  /// updates, so an absolute path would die with the next version.
  final String selfiePath;
  final String? parsePath;
  final String? beardId;
  final String? glassesId;
  final String? glassesFinish;
  final String? hairStyleId;
  final String? hairColourId;
  final List<BoothFrame> frames;
  final BoothRun run;

  /// Step id → downloaded file, for the booth and all its clips.
  final Map<String, String> stepPaths;
  final List<BoothRun> clips;

  RunStatus get status => run.status;
  String? get jobId => run.jobId;
  List<String> get failed => run.failed;
  String? get error => run.error;

  BoothRun? runById(String id) {
    if (id == kMainRun) return run;
    for (final c in clips) {
      if (c.id == id) return c;
    }
    return null;
  }

  List<BoothRun> get runs => [run, ...clips];

  /// Frame 0: the last edit step that was in the plan, else the selfie.
  String get frameZeroKey {
    String? last;
    for (final s in run.plan) {
      final step = s as Map;
      if (step['graph'] == RenderGraph.kontextEdit.wire) {
        last = step['id'] as String;
      }
    }
    return last ?? kSelfieKey;
  }

  /// Frame 0, then the styles. A step id `sN` is frame N.
  List<BoothTile> tiles() => [
    BoothTile(
      key: frameZeroKey,
      label: frameZeroKey == kSelfieKey ? 'Selfie' : 'Nový vzhled',
    ),
    for (final (i, f) in frames.indexed)
      BoothTile(
        key: styleStepId(i + 1),
        label: restyleStyleById(f.styleId)?.label ?? f.styleId,
      ),
  ];

  /// The file of a tile, null until it is here.
  String? pathOf(String key) =>
      key == kSelfieKey ? selfiePath : stepPaths[key];

  /// Clip step ids are `m1`, `m2`, …; never reused, so an old file stays put.
  String nextClipId() {
    var top = 0;
    for (final c in clips) {
      top = [top, int.parse(c.id.substring(1))].reduce((a, b) => a > b ? a : b);
    }
    return 'm${top + 1}';
  }

  BoothProject copyWith({
    BoothRun? run,
    Map<String, String>? stepPaths,
    List<BoothRun>? clips,
  }) => BoothProject(
    id: id,
    createdAt: createdAt,
    selfiePath: selfiePath,
    parsePath: parsePath,
    beardId: beardId,
    glassesId: glassesId,
    glassesFinish: glassesFinish,
    hairStyleId: hairStyleId,
    hairColourId: hairColourId,
    frames: frames,
    run: run ?? this.run,
    stepPaths: stepPaths ?? this.stepPaths,
    clips: clips ?? this.clips,
  );

  BoothProject withRun(BoothRun updated) => updated.id == kMainRun
      ? copyWith(run: updated)
      : copyWith(
          clips: [for (final c in clips) c.id == updated.id ? updated : c],
        );

  Map<String, Object?> toJson() => {
    'id': id,
    'createdAt': createdAt.toIso8601String(),
    'selfiePath': selfiePath,
    'parsePath': parsePath,
    'beardId': beardId,
    'glassesId': glassesId,
    'glassesFinish': glassesFinish,
    'hairStyleId': hairStyleId,
    'hairColourId': hairColourId,
    'frames': [for (final f in frames) f.toJson()],
    'run': run.toJson(),
    'stepPaths': stepPaths,
    'clips': [for (final c in clips) c.toJson()],
  };

  factory BoothProject.fromJson(Map<String, dynamic> json) => BoothProject(
    id: json['id'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    selfiePath: json['selfiePath'] as String,
    parsePath: json['parsePath'] as String?,
    beardId: json['beardId'] as String?,
    glassesId: json['glassesId'] as String?,
    glassesFinish: json['glassesFinish'] as String?,
    hairStyleId: json['hairStyleId'] as String?,
    hairColourId: json['hairColourId'] as String?,
    frames: [
      for (final f in json['frames'] as List)
        BoothFrame.fromJson((f as Map).cast()),
    ],
    run: BoothRun.fromJson((json['run'] as Map).cast()),
    stepPaths: (json['stepPaths'] as Map).cast<String, String>(),
    clips: [
      for (final c in json['clips'] as List)
        BoothRun.fromJson((c as Map).cast()),
    ],
  );
}

String styleStepId(int frame) => 's$frame';
