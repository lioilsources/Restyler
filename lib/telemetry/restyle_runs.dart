import 'package:ol1n_telemetry/ol1n_telemetry.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../models/booth_project.dart';
import 'telemetry_dictionary.dart';

class _Run {
  _Run(this.started);

  final DateTime started;
  late final TelemetryFlow flow;
  String stage = 'upload';
  int framesOk = 0;

  Map<String, Object> props() => {
    'stage': stage,
    'wait_secs': DateTime.now().difference(started).inSeconds.clamp(0, 86400),
    'frames_ok': framesOk.clamp(0, 100),
  };
}

/// The `restyle` flow of every render the app is waiting for, per
/// `projectId/runId`. Lives only in memory: a job picked up again after the
/// process died has no flow (its end went out parked as `background`).
/// Measuring never steers the booth: nothing here is read back.
class RestyleRuns {
  final _runs = <String, _Run>{};

  void start(
    String key, {
    required String kind,
    required RenderPlan plan,
    required BoothProject project,
    String? motionId,
  }) {
    _runs.remove(key)?.flow.end('cancel');
    final clip = motionId != null;
    final run = _Run(DateTime.now());
    run.flow = Telemetry.flow('restyle', {
      'kind': kind,
      'steps': plan.steps.length.clamp(0, 100),
      'cost': plan.cost.clamp(0, 10000),
      'beard': !clip && project.beardId != null,
      'glasses': !clip && project.glassesId != null,
      'hair': !clip && project.hairStyleId != null,
      'motion': catalogValue(motionId, kTelemetryMotionIds),
    }, run.props);
    _runs[key] = run;
  }

  /// The server took the job: from now on the wait is the GPU's.
  void accepted(String key) => _runs[key]?.stage = 'queue';

  void progress(String key, RenderJobStatus status) {
    final run = _runs[key];
    if (run == null) return;
    run.stage = status.steps.values.any((s) => s.status != 'queued')
        ? 'render'
        : 'queue';
    run.framesOk = status.steps.values.where((s) => s.status == 'done').length;
  }

  void end(String key, String result, {String? stage, int? framesOk}) {
    final run = _runs.remove(key);
    if (run == null) return;
    if (stage != null) run.stage = stage;
    if (framesOk != null) run.framesOk = framesOk;
    run.flow.end(result, run.props());
  }

  /// The project was deleted while it rendered.
  void cancelProject(String projectId) {
    for (final key in [..._runs.keys]) {
      if (key.startsWith('$projectId/')) end(key, 'cancel');
    }
  }
}
