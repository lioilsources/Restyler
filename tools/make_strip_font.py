#!/usr/bin/env python3
"""Rasterises Roboto (Apache 2.0, from the Flutter SDK) into the bitmap font the
strip captions use: package:image draws .fnt fonts only, and its built-in ones
stop at ASCII, so Czech labels need this.

    python3 tools/make_strip_font.py <Roboto-Medium.ttf> assets/fonts/strip_font.zip
"""
import io
import sys
import zipfile

from PIL import Image, ImageDraw, ImageFont

SIZE = 30
CHARS = [c for c in range(32, 127)] + [c for c in range(0xA0, 0x180)] + [0x2013, 0x2026]
PAGE = 1024


def main(ttf: str, out: str) -> None:
    font = ImageFont.truetype(ttf, SIZE)
    ascent, descent = font.getmetrics()
    line = ascent + descent
    page = Image.new("RGBA", (PAGE, PAGE), (255, 255, 255, 0))
    draw = ImageDraw.Draw(page)
    x = y = 2
    rows = []
    for code in CHARS:
        ch = chr(code)
        advance = round(font.getlength(ch))
        box = font.getbbox(ch)
        left, right = min(0, box[0]), max(advance, box[2])
        width = max(1, right - left)
        if x + width + 2 > PAGE:
            x, y = 2, y + line + 2
        draw.text((x - left, y), ch, font=font, fill=(255, 255, 255, 255))
        rows.append(f"char id={code} x={x} y={y} width={width} height={line} "
                    f"xoffset={left} yoffset=0 xadvance={advance} page=0 chnl=15")
        x += width + 2
    fnt = "\n".join([
        f'info face="Roboto" size={SIZE} bold=0 italic=0 charset="" unicode=1 stretchH=100 '
        'smooth=1 aa=1 padding=0,0,0,0 spacing=1,1 outline=0',
        f"common lineHeight={line} base={ascent} scaleW={PAGE} scaleH={PAGE} pages=1 packed=0",
        'page id=0 file="strip_font.png"',
        f"chars count={len(rows)}",
        *rows,
    ]) + "\n"
    png = io.BytesIO()
    page.save(png, "PNG")
    with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as z:
        z.writestr("strip_font.fnt", fnt)
        z.writestr("strip_font.png", png.getvalue())


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
