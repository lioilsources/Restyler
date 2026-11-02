import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../config.dart';
import '../services/face_parser.dart';
import '../services/photo_source.dart';
import '../services/onnx_face_parser.dart';
import '../services/project_files.dart';
import '../services/project_store.dart';
import '../services/render_service.dart';
import '../services/worker.dart';

final configProvider = Provider<AppConfig>((_) => AppConfig.fromEnvironment());

final renderServiceProvider = Provider<RenderService>((ref) {
  final config = ref.watch(configProvider);
  final client = BackendClient(baseUrl: config.apiUrl, auth: config.auth);
  ref.onDispose(client.close);
  return RenderService(client);
});

final faceParserProvider = Provider<FaceParser>(
  (_) => OnnxFaceParser(),
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

final photoSourceProvider = Provider<PhotoSource>((_) => PickerPhotoSource());
