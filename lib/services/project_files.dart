import 'dart:io';
import 'dart:typed_data';

/// Files of the projects, addressed relative to one root (see
/// `BoothProject.selfiePath`).
abstract interface class ProjectFiles {
  String absolute(String relative);
  Future<void> write(String relative, Uint8List bytes);
  Future<Uint8List> read(String relative);
  Future<void> deleteProject(String projectId);
}

class IoProjectFiles implements ProjectFiles {
  IoProjectFiles(this.root);

  final String root;

  @override
  String absolute(String relative) => '$root/$relative';

  /// Through a temp file: a half-written PNG must never look finished.
  @override
  Future<void> write(String relative, Uint8List bytes) async {
    final file = File(absolute(relative));
    await file.parent.create(recursive: true);
    final tmp = File('${file.path}.tmp');
    await tmp.writeAsBytes(bytes, flush: true);
    await tmp.rename(file.path);
  }

  @override
  Future<Uint8List> read(String relative) =>
      File(absolute(relative)).readAsBytes();

  @override
  Future<void> deleteProject(String projectId) async {
    final dir = Directory(absolute('projects/$projectId'));
    if (await dir.exists()) await dir.delete(recursive: true);
  }
}
