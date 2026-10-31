import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

enum SelfieSource { camera, gallery }

abstract interface class PhotoSource {
  /// Null when the user backed out.
  Future<Uint8List?> pick(SelfieSource source);
}

class PickerPhotoSource implements PhotoSource {
  final _picker = ImagePicker();

  /// The size limit is what makes the iOS picker hand over a JPEG instead of
  /// HEIC, which `package:image` cannot read; the real ≤1536 step comes after.
  @override
  Future<Uint8List?> pick(SelfieSource source) async {
    final file = await _picker.pickImage(
      source: source == SelfieSource.camera
          ? ImageSource.camera
          : ImageSource.gallery,
      preferredCameraDevice: CameraDevice.front,
      maxWidth: 3072,
      maxHeight: 3072,
      imageQuality: 95,
    );
    return file?.readAsBytes();
  }
}
