import 'dart:math' as math;
import 'dart:typed_data';

import 'package:image/image.dart' as img;

enum StripLayout {
  /// Two columns.
  grid(2),

  /// One column, the classic booth strip.
  strip(1);

  const StripLayout(this.columns);

  final int columns;
}

class StripFrame {
  const StripFrame(this.bytes, this.label);

  final Uint8List bytes;
  final String label;
}

const kStripCellWidth = 512;
const kStripMargin = 24;
const kStripLabelHeight = 44;

/// Centre crop to [ratio] (width/height): frames differ by the render bucket,
/// and squashing them to one cell would stretch faces.
img.Image _cropTo(img.Image im, double ratio) {
  final current = im.width / im.height;
  if ((current - ratio).abs() < 0.005) return im;
  if (current > ratio) {
    final w = (im.height * ratio).round();
    return img.copyCrop(
      im,
      x: (im.width - w) ~/ 2,
      y: 0,
      width: w,
      height: im.height,
    );
  }
  final h = (im.width / ratio).round();
  return img.copyCrop(
    im,
    x: 0,
    y: (im.height - h) ~/ 2,
    width: im.width,
    height: h,
  );
}

/// [label] as the strip font can draw it: the font has Latin-1, Latin
/// Extended-A, – and … (tools/make_strip_font.py), so an em dash from a style
/// name becomes an en dash instead of a gap.
String stripText(String label) => label.replaceAll('—', '–');

String _fit(String text, img.BitmapFont font, int width) {
  final label = stripText(text);
  int measure(String s) =>
      s.split('').fold(0, (n, c) => n + font.characterXAdvance(c));
  if (measure(label) <= width) return label;
  var out = label;
  while (out.isNotEmpty && measure('$out…') > width) {
    out = out.substring(0, out.length - 1);
  }
  return '$out…';
}

/// The booth sheet: white paper, equal cells at the first frame's ratio, a
/// caption under each. [fontZip] is `assets/fonts/strip_font.zip`.
Uint8List composeStrip(
  List<StripFrame> frames,
  StripLayout layout,
  Uint8List fontZip,
) {
  if (frames.isEmpty) throw ArgumentError('no frames');
  final font = img.BitmapFont.fromZip(fontZip);
  final images = [
    for (final f in frames)
      img
          .decodeImage(f.bytes)!
          .convert(format: img.Format.uint8, numChannels: 3),
  ];
  final ratio = images.first.width / images.first.height;
  final cellW = kStripCellWidth;
  final cellH = (cellW / ratio).round();
  final columns = layout.columns;
  final rows = (frames.length / columns).ceil();
  final sheet = img.Image(
    width: columns * cellW + (columns + 1) * kStripMargin,
    height: rows * (cellH + kStripLabelHeight) + (rows + 1) * kStripMargin,
  );
  img.fill(sheet, color: img.ColorRgb8(255, 255, 255));
  final ink = img.ColorRgb8(30, 34, 36);
  for (final (i, image) in images.indexed) {
    final col = i % columns, row = i ~/ columns;
    final x = kStripMargin + col * (cellW + kStripMargin);
    final y = kStripMargin + row * (cellH + kStripLabelHeight + kStripMargin);
    final cell = img.copyResize(
      _cropTo(image, ratio),
      width: cellW,
      height: cellH,
      maintainAspect: false,
      interpolation: img.Interpolation.average,
    );
    img.compositeImage(sheet, cell, dstX: x, dstY: y);
    img.drawString(
      sheet,
      _fit(frames[i].label, font, cellW),
      font: font,
      x: x,
      y: y + cellH + math.max(0, (kStripLabelHeight - font.lineHeight) ~/ 2),
      color: ink,
    );
  }
  return img.encodePng(sheet);
}
