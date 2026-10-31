// The ONNX face parser, all of it: swapping the runtime or following the spike
// (`MangaPrompts/tools/ondevice`) touches this file and `make models`.
//
// Path, exactly as `tools/ondevice/README.md` measured it: 8-bit RGB after EXIF
// → Pillow BILINEAR to 512×512, no ratio, no pad → v/255, ImageNet normalise →
// `pixel_values` float32 NCHW → `logits` 1×C×128×128 → bilinear upsample of the
// LOGITS to the photo, `align_corners=False` → argmax.
//
// `pilBilinearResize` and `upsampleArgmax` are `parser_preprocess.dart`; the
// test pins them to it. Two shortcuts that look equivalent and are not: `copyResize`
// instead of the port (eyes IoU 0.88–0.95, the port 1.0000), and argmax first
// with `FaceParse.resized` after (eyes 0.81–0.95). The parser returns class maps
// at the size of the photo for that reason.

import 'dart:isolate';
import 'dart:typed_data';

import 'package:flutter_onnxruntime/flutter_onnxruntime.dart';
import 'package:image/image.dart' as img;
import 'package:tsumiki_shared/tsumiki_shared.dart';

import 'face_parser.dart';

// fp16 for both, never int8: under the CoreML EP its output is wrong
// (`MangaPrompts/docs/ondevice-parity.md`). A new export is a new digest in the
// name; the names are in `Makefile` too, with the full sha256.
const kFaceModelAsset = 'assets/models/face_b5.fp16.46e77905.onnx';
const kClothesModelAsset = 'assets/models/clothes_b2.fp16.bd5f9568.onnx';

const kParserSize = 512;
const kFaceClasses = 19;
const kClothesClasses = 18;

/// Graph names from `export_parser.py`.
const kParserInputNode = 'pixel_values';
const kParserOutputNode = 'logits';

/// CPU: phones were not measured (CoreML gave correct fp16 output on the Mac,
/// what it does on an iPhone is unknown; NNAPI was not tried).
const _providers = [OrtProvider.CPU];

const _mean = [0.485, 0.456, 0.406];
const _std = [0.229, 0.224, 0.225];
const _precisionBits = 32 - 8 - 2; // Pillow Resample.c

class _Coeffs {
  _Coeffs(this.bounds, this.k, this.ksize);
  final Int32List bounds; // xmin, count per output sample
  final Int32List k; // fixed point weights, ksize per output sample
  final int ksize;
}

_Coeffs _coeffs(int inSize, int outSize) {
  final scale = inSize / outSize;
  final filterscale = scale < 1.0 ? 1.0 : scale;
  final support = filterscale;
  final ksize = support.ceil() * 2 + 1;
  final bounds = Int32List(outSize * 2);
  final k = Int32List(outSize * ksize);
  final w = Float64List(ksize);
  for (var xx = 0; xx < outSize; xx++) {
    final center = (xx + 0.5) * scale;
    var xmin = (center - support + 0.5).truncate();
    if (xmin < 0) xmin = 0;
    var xmax = (center + support + 0.5).truncate();
    if (xmax > inSize) xmax = inSize;
    final n = xmax - xmin;
    var ww = 0.0;
    for (var x = 0; x < n; x++) {
      final d = ((x + xmin - center + 0.5) / filterscale).abs();
      final v = d < 1.0 ? 1.0 - d : 0.0;
      w[x] = v;
      ww += v;
    }
    for (var x = 0; x < n; x++) {
      final v = w[x] / ww * (1 << _precisionBits);
      k[xx * ksize + x] = v < 0 ? (-0.5 + v).truncate() : (0.5 + v).truncate();
    }
    bounds[xx * 2] = xmin;
    bounds[xx * 2 + 1] = n;
  }
  return _Coeffs(bounds, k, ksize);
}

int _clip8(int v) {
  final s = v >> _precisionBits;
  return s < 0 ? 0 : (s > 255 ? 255 : s);
}

/// Pillow `resize(BILINEAR)` of interleaved 8-bit RGB: an antialiased triangle
/// filter, horizontal pass first, rounded to 8 bits between passes.
Uint8List pilBilinearResize(
  Uint8List rgb,
  int width,
  int height,
  int outW,
  int outH,
) {
  final h = _coeffs(width, outW);
  final v = _coeffs(height, outH);
  final half = 1 << (_precisionBits - 1);
  final tmp = Uint8List(outW * height * 3);
  for (var y = 0; y < height; y++) {
    final row = y * width * 3;
    var o = y * outW * 3;
    for (var xx = 0; xx < outW; xx++) {
      final xmin = h.bounds[xx * 2], n = h.bounds[xx * 2 + 1];
      final base = xx * h.ksize;
      var r = half, g = half, b = half;
      for (var x = 0; x < n; x++) {
        final c = h.k[base + x];
        final p = row + (xmin + x) * 3;
        r += rgb[p] * c;
        g += rgb[p + 1] * c;
        b += rgb[p + 2] * c;
      }
      tmp[o++] = _clip8(r);
      tmp[o++] = _clip8(g);
      tmp[o++] = _clip8(b);
    }
  }
  final out = Uint8List(outW * outH * 3);
  final stride = outW * 3;
  for (var yy = 0; yy < outH; yy++) {
    final ymin = v.bounds[yy * 2], n = v.bounds[yy * 2 + 1];
    final base = yy * v.ksize;
    var o = yy * stride;
    for (var i = 0; i < stride; i++) {
      var s = half;
      for (var y = 0; y < n; y++) {
        s += tmp[(ymin + y) * stride + i] * v.k[base + y];
      }
      out[o++] = _clip8(s);
    }
  }
  return out;
}

/// Interleaved RGB at [kParserSize]² → `pixel_values`, float32 NCHW.
Float32List toPixelValues(Uint8List rgb) {
  final n = kParserSize * kParserSize;
  final out = Float32List(3 * n);
  for (var i = 0; i < n; i++) {
    for (var c = 0; c < 3; c++) {
      out[c * n + i] = (rgb[i * 3 + c] / 255.0 - _mean[c]) / _std[c];
    }
  }
  return out;
}

/// Logits (1×C×L×L, row-major) → class per pixel at [width]×[height]: bilinear
/// with `align_corners=False`, then argmax, without materialising the
/// upsampled logits.
Uint8List upsampleArgmax(
  Float32List logits,
  int classes,
  int size,
  int width,
  int height,
) {
  final x0 = Int32List(width), x1 = Int32List(width);
  final wx = Float32List(width);
  for (var x = 0; x < width; x++) {
    var s = (x + 0.5) * size / width - 0.5;
    if (s < 0) s = 0;
    final i = s.floor();
    x0[x] = i;
    x1[x] = i + 1 < size ? i + 1 : size - 1;
    wx[x] = s - i;
  }
  final out = Uint8List(width * height);
  final plane = size * size;
  for (var y = 0; y < height; y++) {
    var s = (y + 0.5) * size / height - 0.5;
    if (s < 0) s = 0;
    final i = s.floor();
    final r0 = i * size, r1 = (i + 1 < size ? i + 1 : size - 1) * size;
    final wy = s - i;
    final row = y * width;
    for (var x = 0; x < width; x++) {
      final a = x0[x], b = x1[x], w = wx[x];
      var best = 0;
      var bestV = double.negativeInfinity;
      for (var c = 0; c < classes; c++) {
        final o = c * plane;
        final top = logits[o + r0 + a] * (1 - w) + logits[o + r0 + b] * w;
        final bot = logits[o + r1 + a] * (1 - w) + logits[o + r1 + b] * w;
        final v = top * (1 - wy) + bot * wy;
        if (v > bestV) {
          bestV = v;
          best = c;
        }
      }
      out[row + x] = best;
    }
  }
  return out;
}

class _Input {
  const _Input(this.pixels, this.width, this.height);
  final Float32List pixels;
  final int width;
  final int height;
}

_Input _preprocess(Uint8List bytes) {
  final image = img
      .decodeImage(bytes)!
      .convert(format: img.Format.uint8, numChannels: 3);
  final rgb = Uint8List(image.width * image.height * 3);
  var o = 0;
  for (final p in image) {
    rgb[o++] = p.r.toInt();
    rgb[o++] = p.g.toInt();
    rgb[o++] = p.b.toInt();
  }
  final small = pilBilinearResize(
    rgb,
    image.width,
    image.height,
    kParserSize,
    kParserSize,
  );
  return _Input(toPixelValues(small), image.width, image.height);
}

class _Logits {
  const _Logits(this.values, this.classes, this.size);
  final Float32List values;
  final int classes;
  final int size;
}

/// Parsing is CPU work around a native call: Dart isolates on both sides, and
/// the plugin runs the session on its own background queue.
class OnnxFaceParser implements FaceParser {
  Future<(OrtSession, OrtSession)>? _sessions;

  Future<(OrtSession, OrtSession)> _load() async {
    // The plugin unpacks each asset into the cache dir once, atomically, and
    // unpacks it again if the OS evicts it or the file does not load.
    final options = OrtSessionOptions(providers: _providers);
    final ort = OnnxRuntime();
    return (
      await ort.createSessionFromAsset(kFaceModelAsset, options: options),
      await ort.createSessionFromAsset(kClothesModelAsset, options: options),
    );
  }

  Future<_Logits> _infer(
    OrtSession session,
    Float32List pixels,
    int classes,
  ) async {
    final input = await OrtValue.fromList(pixels, [
      1,
      3,
      kParserSize,
      kParserSize,
    ]);
    try {
      final out = await session.run({kParserInputNode: input});
      final value = out[kParserOutputNode]!;
      try {
        final shape = value.shape;
        if (shape.length != 4 || shape[1] != classes) {
          throw StateError('parser returned $shape, wanted $classes classes');
        }
        final flat = await value.asFlattenedList();
        return _Logits(
          Float32List.fromList(flat.cast<double>()),
          classes,
          shape[2],
        );
      } finally {
        await value.dispose();
      }
    } finally {
      await input.dispose();
    }
  }

  @override
  Future<FaceParse> parse(Uint8List bytes) async {
    final Future<(OrtSession, OrtSession)> pending = _sessions ??= _load();
    final (OrtSession, OrtSession) sessions;
    try {
      sessions = await pending;
    } catch (_) {
      _sessions = null; // the next selfie tries again
      rethrow;
    }
    final input = await Isolate.run(() => _preprocess(bytes));
    final face = await _infer(sessions.$1, input.pixels, kFaceClasses);
    final clothes = await _infer(sessions.$2, input.pixels, kClothesClasses);
    return Isolate.run(
      () => FaceParse(
        face: upsampleArgmax(
          face.values,
          face.classes,
          face.size,
          input.width,
          input.height,
        ),
        clothes: upsampleArgmax(
          clothes.values,
          clothes.classes,
          clothes.size,
          input.width,
          input.height,
        ),
        width: input.width,
        height: input.height,
      ),
    );
  }
}
