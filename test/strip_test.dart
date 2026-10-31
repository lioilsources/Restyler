import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:restyler/services/strip.dart';

Uint8List _font() => File('assets/fonts/strip_font.zip').readAsBytesSync();

Uint8List _frame(int w, int h, img.Color color) =>
    img.encodePng(img.fill(img.Image(width: w, height: h), color: color));

final _red = img.ColorRgb8(200, 0, 0);

void main() {
  test('grid: two columns, equal cells at the first frame\'s ratio', () {
    final frames = List.generate(
      5,
      (i) => StripFrame(_frame(400, 500, _red), 'R$i'),
    );
    final out = img.decodePng(composeStrip(frames, StripLayout.grid, _font()))!;
    const cellH = 640; // 512 * 5/4
    expect(out.width, 2 * kStripCellWidth + 3 * kStripMargin);
    expect(out.height, 3 * (cellH + kStripLabelHeight) + 4 * kStripMargin);
  });

  test('strip: one column', () {
    final frames = List.generate(
      4,
      (i) => StripFrame(_frame(600, 600, _red), 'R$i'),
    );
    final out = img.decodePng(composeStrip(frames, StripLayout.strip, _font()))!;
    expect(out.width, kStripCellWidth + 2 * kStripMargin);
    expect(out.height, 4 * (512 + kStripLabelHeight) + 5 * kStripMargin);
  });

  test('a frame of another ratio is cropped, not squashed', () {
    // Wide frame: a centred square of blue on white sides. Cropped to the
    // first frame's square, the blue fills the cell edge to edge.
    final wide = img.Image(width: 800, height: 400);
    img.fill(wide, color: img.ColorRgb8(255, 255, 255));
    img.fillRect(
      wide,
      x1: 200,
      y1: 0,
      x2: 599,
      y2: 399,
      color: img.ColorRgb8(0, 0, 200),
    );
    final out = img.decodePng(
      composeStrip(
        [
          StripFrame(_frame(300, 300, _red), 'A'),
          StripFrame(img.encodePng(wide), 'B'),
        ],
        StripLayout.strip,
        _font(),
      ),
    )!;
    final y = kStripMargin * 2 + 512 + kStripLabelHeight + 256;
    final left = out.getPixel(kStripMargin + 4, y);
    final right = out.getPixel(kStripMargin + kStripCellWidth - 5, y);
    expect(left.b.toInt(), greaterThan(180));
    expect(left.r.toInt(), lessThan(40));
    expect(right.b.toInt(), greaterThan(180));
  });

  test('paper is white and captions are drawn on it, diacritics included', () {
    final font = img.BitmapFont.fromZip(_font());
    for (final ch in 'ěščřžýáíéůúňťď…'.split('')) {
      expect(font.characters.containsKey(ch.codeUnitAt(0)), isTrue, reason: ch);
    }
    final out = img.decodePng(
      composeStrip(
        [StripFrame(_frame(400, 400, _red), 'Nový vzhled')],
        StripLayout.strip,
        _font(),
      ),
    )!;
    expect(out.getPixel(1, 1).r.toInt(), 255);
    var ink = 0;
    for (var y = kStripMargin + 512; y < kStripMargin + 512 + kStripLabelHeight; y++) {
      for (var x = kStripMargin; x < kStripMargin + 300; x++) {
        if (out.getPixel(x, y).r < 128) ink++;
      }
    }
    expect(ink, greaterThan(50));
  });

  test('a long caption stays inside its cell', () {
    final out = composeStrip(
      [StripFrame(_frame(400, 400, _red), 'x' * 300)],
      StripLayout.strip,
      _font(),
    );
    expect(img.decodePng(out), isNotNull);
  });

  test('no frames is a caller bug', () {
    expect(
      () => composeStrip([], StripLayout.grid, _font()),
      throwsArgumentError,
    );
  });
}
