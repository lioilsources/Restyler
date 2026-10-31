import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:restyler/services/onnx_face_parser.dart';

// ignore: avoid_relative_lib_imports
import 'support/parser_preprocess.dart'
    as spike;

/// The Dart half of the parser. The session itself needs a device and a model.
void main() {
  test('pixel values are NCHW with ImageNet normalisation', () {
    final n = kParserSize * kParserSize;
    final rgb = Uint8List(n * 3);
    rgb[0] = 255; // pixel 0 red
    rgb[3 * (n - 1) + 2] = 255; // last pixel blue
    final out = toPixelValues(rgb);
    expect(out.length, 3 * n);
    expect(out[0], closeTo((1 - 0.485) / 0.229, 1e-5));
    expect(out[n], closeTo((0 - 0.456) / 0.224, 1e-5));
    expect(out[2 * n], closeTo((0 - 0.406) / 0.225, 1e-5));
    expect(out[3 * n - 1], closeTo((1 - 0.406) / 0.225, 1e-5));
  });

  test('resize ignores the ratio and keeps a flat colour flat', () {
    const w = 300, h = 100;
    final rgb = Uint8List(w * h * 3);
    for (var i = 0; i < rgb.length; i += 3) {
      rgb[i] = 10;
      rgb[i + 1] = 200;
      rgb[i + 2] = 77;
    }
    final out = pilBilinearResize(rgb, w, h, kParserSize, kParserSize);
    expect(out.length, kParserSize * kParserSize * 3);
    expect(out.sublist(0, 3), [10, 200, 77]);
    expect(out.sublist(out.length - 3), [10, 200, 77]);
  });

  test('resize antialiases: a one-pixel checker averages out', () {
    const w = 1024, h = 1024;
    final rgb = Uint8List(w * h * 3);
    for (var y = 0; y < h; y++) {
      for (var x = 0; x < w; x++) {
        final v = (x + y).isEven ? 255 : 0;
        rgb.fillRange((y * w + x) * 3, (y * w + x + 1) * 3, v);
      }
    }
    final out = pilBilinearResize(rgb, w, h, 512, 512);
    final centre = out[(256 * 512 + 256) * 3];
    expect(centre, inInclusiveRange(120, 135));
  });

  test('argmax picks the class per region after upsampling', () {
    // 3 classes on a 2×2 logit grid: class 1 left, class 2 right.
    const size = 2, classes = 3;
    final logits = Float32List(classes * size * size);
    logits[1 * 4 + 0] = 5; // c1, top left
    logits[1 * 4 + 2] = 5; // c1, bottom left
    logits[2 * 4 + 1] = 5; // c2, top right
    logits[2 * 4 + 3] = 5; // c2, bottom right
    final out = upsampleArgmax(logits, classes, size, 8, 4);
    expect(out.length, 32);
    expect(out[0], 1);
    expect(out[7], 2);
    expect(out[24], 1);
    expect(out[31], 2);
  });

  test('upsampling is bilinear with align_corners=False', () {
    // Class 1 starts at 1 on the left and falls to 0; class 0 is a flat 0.5.
    const size = 2;
    final logits = Float32List(2 * size * size);
    logits.fillRange(0, 4, 0.5);
    logits[4] = 1;
    logits[6] = 1;
    final out = upsampleArgmax(logits, 2, size, 4, 1);
    // Sample positions on the logit grid: clamped 0, 0.25, 0.75, 1.
    expect(out, [1, 1, 0, 0]);
    final tie = upsampleArgmax(logits, 2, size, 2, 1);
    expect(tie, [1, 0]);
  });

  test('stays the spike\'s port, which is byte-identical to Pillow', () {
    const w = 257, h = 391;
    final rgb = Uint8List(w * h * 3);
    var seed = 7;
    for (var i = 0; i < rgb.length; i++) {
      seed = (seed * 1103515245 + 12345) & 0x7fffffff;
      rgb[i] = seed >> 16;
    }
    expect(
      pilBilinearResize(rgb, w, h, 512, 512),
      spike.pilBilinearResize(rgb, w, h, 512, 512),
    );
    expect(
      toPixelValues(pilBilinearResize(rgb, w, h, 512, 512)),
      spike.toPixelValues(spike.pilBilinearResize(rgb, w, h, 512, 512)),
    );
    final logits = Float32List(19 * 128 * 128);
    for (var i = 0; i < logits.length; i++) {
      seed = (seed * 1103515245 + 12345) & 0x7fffffff;
      logits[i] = seed / 0x7fffffff;
    }
    expect(
      upsampleArgmax(logits, 19, 128, 300, 400),
      spike.upsampleArgmax(logits, 19, 128, 300, 400),
    );
  });

  test('the class counts match the two parsers', () {
    expect(kFaceClasses, 19);
    expect(kClothesClasses, 18);
    expect(kParserInputNode, 'pixel_values');
    expect(kParserOutputNode, 'logits');
  });
}
