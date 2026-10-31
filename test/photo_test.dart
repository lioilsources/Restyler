import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:restyler/services/photo.dart';

/// JPEG stored landscape with EXIF orientation 6 (phone held upright): a red
/// stripe along the left of the *stored* image is the top of the upright photo.
Uint8List _rotatedJpeg(int w, int h) {
  final image = img.Image(width: w, height: h);
  img.fill(image, color: img.ColorRgb8(255, 255, 255));
  img.fillRect(image, x1: 0, y1: 0, x2: w ~/ 8, y2: h - 1, color: img.ColorRgb8(255, 0, 0));
  image.exif.imageIfd.orientation = 6;
  image.exif.gpsIfd['GPSLatitudeRef'] = img.IfdValueAscii('N');
  return img.encodeJpg(image, quality: 95);
}

void main() {
  test('EXIF orientation is baked in and gone from the output', () {
    final p = normalisePhoto(_rotatedJpeg(800, 600));
    expect((p.width, p.height), (600, 800));
    final back = img.decodeJpg(p.bytes)!;
    expect((back.width, back.height), (600, 800));
    expect(back.exif.imageIfd.orientation, anyOf(isNull, 1));
    expect(back.exif.gpsIfd.isEmpty, isTrue);
    // Orientation 6 turns the stored left edge into the top.
    final top = back.getPixel(300, 20), bottom = back.getPixel(300, 780);
    expect(top.r.toInt(), greaterThan(200));
    expect(top.g.toInt(), lessThan(60));
    expect(bottom.g.toInt(), greaterThan(200));
  });

  test('the long side comes down to 1536, after the rotation', () {
    final p = normalisePhoto(_rotatedJpeg(4000, 3000));
    expect((p.width, p.height), (1152, 1536));
    final back = img.decodeJpg(p.bytes)!;
    expect((back.width, back.height), (p.width, p.height));
  });

  test('a photo that fits keeps its size', () {
    final jpeg = img.encodeJpg(img.Image(width: 1536, height: 900));
    final p = normalisePhoto(jpeg);
    expect((p.width, p.height), (1536, 900));
  });

  test('a plain PNG that fits passes through byte for byte', () {
    final png = img.encodePng(img.Image(width: 100, height: 200));
    final p = normalisePhoto(png);
    expect(identical(p.bytes, png), isTrue);
    expect((p.width, p.height), (100, 200));
  });

  test('a PNG that is too big comes back as a smaller JPEG', () {
    final png = img.encodePng(img.Image(width: 2000, height: 1000));
    final p = normalisePhoto(png);
    expect((p.width, p.height), (1536, 768));
    expect(img.findFormatForData(p.bytes), img.ImageFormat.jpg);
  });

  test('what cannot be read is a Czech error', () {
    expect(
      () => normalisePhoto(Uint8List.fromList([1, 2, 3, 4])),
      throwsA(
        isA<PhotoException>().having((e) => e.message, 'message', contains('přečíst')),
      ),
    );
  });

  test('a frame over the upload limit is re-encoded, one under it is not', () {
    final small = img.encodePng(img.Image(width: 10, height: 10));
    expect(identical(fitForUpload(small), small), isTrue);

    final noise = img.Image(width: 1536, height: 1536);
    var seed = 1;
    for (final p in noise) {
      seed = (seed * 1103515245 + 12345) & 0x7fffffff;
      p
        ..r = seed & 255
        ..g = (seed >> 8) & 255
        ..b = (seed >> 16) & 255;
    }
    final big = img.encodePng(noise, level: 0);
    expect(big.length, greaterThan(kMaxUploadBytes));
    final fitted = fitForUpload(big);
    expect(fitted.length, lessThan(big.length));
    expect(img.findFormatForData(fitted), img.ImageFormat.jpg);
  });
}
