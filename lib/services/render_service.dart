import 'dart:typed_data';

import 'package:tsumiki_shared/tsumiki_shared.dart';

/// The one endpoint the app needs. Thin on purpose: retry and resume belong to
/// the provider, which has the project.
class RenderService {
  RenderService(
    this._client, {
    this.pollInterval = const Duration(seconds: 3),
    this.retryBase = const Duration(seconds: 3),
  });

  final BackendClient _client;
  final Duration pollInterval;

  /// First wait after a failed poll; doubles up to a minute.
  final Duration retryBase;

  Future<RenderJob> start(Uint8List source, RenderPlan plan) =>
      _client.startRender(source, plan);

  Duration retryDelay(int failures) {
    final wait = retryBase * (1 << (failures - 1).clamp(0, 5));
    return wait > const Duration(minutes: 1)
        ? const Duration(minutes: 1)
        : wait;
  }

  Stream<RenderJobStatus> status(String jobId) =>
      _client.pollJob(jobId, interval: pollInterval);

  Future<Uint8List> step(String jobId, String stepId) =>
      _client.stepOutput(jobId, stepId);

  Future<Account> account() => _client.account();
}
