import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../config.dart';
import '../services/face_parser.dart';
import '../services/model_store.dart';
import '../services/photo_source.dart';
import '../services/onnx_face_parser.dart';
import '../services/project_files.dart';
import '../services/project_store.dart';
import '../services/render_service.dart';
import '../services/worker.dart';

const _backup = MethodChannel('com.ol1n.restyler/backup');

/// iOS only; Android has `allowBackup="false"`.
Future<void> excludeFromBackup(String path) async {
  if (!Platform.isIOS) return;
  await _backup.invokeMethod<void>('exclude', path);
}

final configProvider = Provider<AppConfig>((_) => AppConfig.fromEnvironment());

final renderServiceProvider = Provider<RenderService>((ref) {
  final config = ref.watch(configProvider);
  final client = BackendClient(baseUrl: config.apiUrl, auth: config.auth);
  ref.onDispose(client.close);
  return RenderService(client);
});

final modelStoreProvider = Provider<ModelStore>((ref) {
  final config = ref.watch(configProvider);
  final client = http.Client();
  ref.onDispose(client.close);
  return ModelStore(
    client: client,
    baseUrl: config.apiUrl,
    headers: config.cfHeaders,
    directory: () async =>
        '${(await getApplicationSupportDirectory()).path}/models',
    excludeFromBackup: excludeFromBackup,
  );
});

final faceParserProvider = Provider<FaceParser>(
  (ref) => OnnxFaceParser(ref.watch(modelStoreProvider)),
);

final workerProvider = Provider<Worker>((_) => isolateWorker);

/// Overridden in `main` once the directories are known.
final projectFilesProvider = Provider<ProjectFiles>(
  (_) => throw UnimplementedError('projectFilesProvider'),
);
final projectStoreProvider = Provider<ProjectStore>(
  (_) => throw UnimplementedError('projectStoreProvider'),
);

/// What the gate has let through. Empty lists hide their step: a provider, so
/// tests can run with full catalogs before the bench fills the real ones.
@immutable
class BoothCatalog {
  const BoothCatalog({
    this.beards = kBeards,
    this.glasses = kGlasses,
    this.motions = kMotions,
  });

  final List<Beard> beards;
  final List<Glasses> glasses;
  final List<Motion> motions;
}

final catalogProvider = Provider<BoothCatalog>((_) => const BoothCatalog());

/// `/api/me`; offline it fails and the screens just leave the quota out.
final accountProvider = FutureProvider.autoDispose<Account>(
  (ref) => ref.watch(renderServiceProvider).account(),
  retry: (_, _) => null,
);

enum ModelStage { checking, downloading, ready, failed }

class ModelState {
  const ModelState(this.stage, {this.progress = 0, this.error});

  final ModelStage stage;
  final double progress;
  final String? error;
}

class ModelNotifier extends Notifier<ModelState> {
  @override
  ModelState build() => const ModelState(ModelStage.checking);

  Future<void> ensure() async {
    if (state.stage == ModelStage.downloading) return;
    final store = ref.read(modelStoreProvider);
    state = const ModelState(ModelStage.downloading);
    try {
      await store.ensure(
        onProgress: (p) => state = ModelState(ModelStage.downloading, progress: p),
      );
      state = const ModelState(ModelStage.ready);
    } on ModelException catch (e) {
      state = ModelState(ModelStage.failed, error: e.message);
    }
  }
}

final modelProvider = NotifierProvider<ModelNotifier, ModelState>(
  ModelNotifier.new,
);

final photoSourceProvider = Provider<PhotoSource>((_) => PickerPhotoSource());
