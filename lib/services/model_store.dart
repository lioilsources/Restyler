import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

/// A model on `/models/`: the name carries the version, the digest proves the
/// bytes. fp16 for both, never int8: under the CoreML EP its output is wrong
/// (`MangaPrompts/docs/ondevice-parity.md`).
class ModelFile {
  const ModelFile(this.stem, this.sha256);

  final String stem;

  /// Lowercase hex. Empty until the file is published: such a build refuses to
  /// download rather than trust unverified weights.
  final String sha256;

  bool get pinned => sha256.length == 64;

  /// `face_b5.fp16.<sha8>.onnx`.
  String get name => '$stem.${sha256.substring(0, 8)}.onnx';
}

// 170.5 MB and 95.2 MB; digests of the spike's export.
const kFaceModel = ModelFile(
  'face_b5.fp16',
  '46e77905e5914992243628132ec12635bfc224bcd903a0de3fa122f0e0e5c4d9',
);
const kClothesModel = ModelFile(
  'clothes_b2.fp16',
  'bd5f9568081ef0d297e4bbc15106e8a8d6130bebbc87b9a496d256417c6a2e55',
);
const kParserModels = [kFaceModel, kClothesModel];

/// Smaller than this is an error page, not a model.
const _minModelBytes = 1 << 20;

class ModelException implements Exception {
  const ModelException(this.message);

  final String message;

  @override
  String toString() => message;
}

const kModelOfflineText =
    'Model pro analýzu tváře ještě není stažený a telefon je offline. '
    'Připoj se k internetu a zkus to znovu.';

/// Downloads the parser models on first start (over 50 MB, so not bundled) and
/// keeps them in the app support directory.
class ModelStore {
  ModelStore({
    required this.client,
    required String baseUrl,
    required this.headers,
    required this.directory,
    this.files = kParserModels,
    this.excludeFromBackup,
    this.stallTimeout = const Duration(seconds: 60),
  }) : _base = baseUrl.endsWith('/')
           ? baseUrl.substring(0, baseUrl.length - 1)
           : baseUrl;

  final http.Client client;
  final String _base;
  final Map<String, String> headers;
  final Future<String> Function() directory;
  final List<ModelFile> files;

  /// The models are hundreds of MB of re-downloadable data.
  final Future<void> Function(String path)? excludeFromBackup;
  final Duration stallTimeout;

  Future<String> pathOf(ModelFile file) async =>
      '${await directory()}/${file.name}';

  Future<bool> get ready async {
    for (final file in files) {
      if (!file.pinned || !await File(await pathOf(file)).exists()) return false;
    }
    return true;
  }

  /// Fetches what is missing. [onProgress] gets 0..1 over all files. Throws
  /// [ModelException] with a Czech text.
  Future<void> ensure({void Function(double)? onProgress}) async {
    if (!files.every((f) => f.pinned)) {
      throw const ModelException(
        'Tenhle build nemá otisky modelů. Bez nich se modely nestahují.',
      );
    }
    for (final (i, file) in files.indexed) {
      final path = await pathOf(file);
      if (await File(path).exists()) continue;
      await _download(
        file,
        path,
        (f) => onProgress?.call((i + f) / files.length),
      );
      await excludeFromBackup?.call(path);
    }
    await _dropOldVersions();
    onProgress?.call(1);
  }

  /// A new digest is a new name; the old file would stay for good otherwise.
  Future<void> _dropOldVersions() async {
    final keep = {for (final f in files) f.name};
    await for (final entry in Directory(await directory()).list()) {
      final name = entry.uri.pathSegments.last;
      if (entry is File && name.endsWith('.onnx') && !keep.contains(name)) {
        await entry.delete();
      }
    }
  }

  Future<void> _download(
    ModelFile file,
    String path,
    void Function(double) progress,
  ) async {
    final part = File('$path.part');
    await part.parent.create(recursive: true);
    final http.StreamedResponse resp;
    try {
      final req = http.Request('GET', Uri.parse('$_base/models/${file.name}'))
        ..headers.addAll(headers);
      resp = await client.send(req).timeout(stallTimeout);
    } on Exception catch (e) {
      throw _network(e);
    }
    if (resp.statusCode != 200) {
      await resp.stream.drain<void>();
      throw ModelException(
        'Model se nepodařilo stáhnout (server vrátil ${resp.statusCode}).',
      );
    }
    // Access answers an unauthorised request with its login page and a 200.
    if ((resp.headers['content-type'] ?? '').startsWith('text/html')) {
      await resp.stream.drain<void>();
      throw const ModelException(
        'Server místo modelu vrátil přihlašovací stránku. Tenhle build má '
        'špatný Cloudflare token.',
      );
    }
    final total = resp.contentLength;
    final sink = part.openWrite();
    var received = 0;
    try {
      await for (final chunk in resp.stream.timeout(stallTimeout)) {
        sink.add(chunk);
        received += chunk.length;
        if (total != null && total > 0) progress(received / total);
      }
      await sink.close();
    } on Exception catch (e) {
      await sink.close();
      await part.delete();
      throw _network(e);
    }
    if ((total != null && received != total) || received < _minModelBytes) {
      await part.delete();
      throw const ModelException(
        'Model se stáhl neúplný. Zkus to znovu na lepším připojení.',
      );
    }
    final digest = await _sha256(part.path);
    if (digest != file.sha256) {
      await part.delete();
      throw const ModelException(
        'Stažený model nesedí na otisk. Zkus to znovu.',
      );
    }
    await part.rename(path);
  }

  ModelException _network(Exception e) {
    if (e is SocketException ||
        e is TimeoutException ||
        e is http.ClientException) {
      return const ModelException(kModelOfflineText);
    }
    return ModelException('Model se nepodařilo stáhnout: $e');
  }
}

/// Off the UI isolate: hashing 170 MB takes seconds on a phone.
Future<String> _sha256(String path) => Isolate.run(
  () async => (await sha256.bind(File(path).openRead()).first).toString(),
);
