import 'dart:math' as math;
import 'dart:typed_data';

import 'package:image/image.dart' as img;

import 'onnx_face_parser.dart' show pilBilinearResize;

/// Long side of everything that leaves or analyses the photo.
const kMaxPhotoSide = 1536;

/// `MAX_RESTYLE_IMAGE_B64_CHARS` (6 M) as bytes, with a margin.
const kMaxUploadBytes = 4400000;

const _jpegQuality = 92;

class PhotoException implements Exception {
  const PhotoException(this.message);

  final String message;

  @override
  String toString() => message;
}

/// The photo the whole pipeline works on: upright, ≤ [kMaxPhotoSide], no
/// metadata. Parser, masks and the server all read exactly these bytes, which
/// is why a mask always fits the source.
class PreparedPhoto {
  const PreparedPhoto(this.bytes, this.width, this.height);

  final Uint8List bytes;
  final int width;
  final int height;
}

img.Image _decode(Uint8List data) {
  img.Image? image;
  try {
    image = img.decodeImage(data);
  } catch (_) {
    image = null;
  }
  if (image == null) {
    throw const PhotoException(
      'Fotku se nepodařilo přečíst. Použij JPEG nebo PNG.',
    );
  }
  return image;
}

Uint8List _jpeg(img.Image image) {
  final flat = image.convert(format: img.Format.uint8, numChannels: 3)
    ..exif = img.ExifData();
  return img.encodeJpg(flat, quality: _jpegQuality);
}

/// The filter the parser path was measured on, never `copyResize`.
img.Image _shrink(img.Image image, double scale) {
  final src = image.convert(format: img.Format.uint8, numChannels: 3);
  final w = math.max(1, (src.width * scale).round());
  final h = math.max(1, (src.height * scale).round());
  final rgb = Uint8List(src.width * src.height * 3);
  var o = 0;
  for (final p in src) {
    rgb[o++] = p.r.toInt();
    rgb[o++] = p.g.toInt();
    rgb[o++] = p.b.toInt();
  }
  return img.Image.fromBytes(
    width: w,
    height: h,
    bytes: pilBilinearResize(rgb, src.width, src.height, w, h).buffer,
    numChannels: 3,
  );
}

/// Bakes the EXIF orientation in, scales down, drops metadata (a phone JPEG
/// carries GPS). A plain PNG that already fits passes through byte for byte; a
/// JPEG is always re-encoded.
PreparedPhoto normalisePhoto(Uint8List data) {
  final decoded = _decode(data);
  final hasExif = !decoded.exif.isEmpty;
  final isPng = img.findFormatForData(data) == img.ImageFormat.png;
  final upright = hasExif ? img.bakeOrientation(decoded) : decoded;
  final side = math.max(upright.width, upright.height);
  if (isPng &&
      !hasExif &&
      side <= kMaxPhotoSide &&
      data.length <= kMaxUploadBytes) {
    return PreparedPhoto(data, upright.width, upright.height);
  }
  final fitted = side <= kMaxPhotoSide
      ? upright
      : _shrink(upright, kMaxPhotoSide / side);
  return PreparedPhoto(_jpeg(fitted), fitted.width, fitted.height);
}

/// A frame as an Oživit source: rendered PNGs can outgrow the server's limit.
Uint8List fitForUpload(Uint8List data) =>
    data.length <= kMaxUploadBytes ? data : _jpeg(_decode(data));
