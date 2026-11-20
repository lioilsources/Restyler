#!/usr/bin/env python3
"""Draws the app icon: a red-haired woman with blue eyes, behind the booth curtain.

The background is BoothColors.curtain from lib/theme.dart. Writes every iOS and
Android size in place; needs Pillow only.

Android also gets an adaptive icon (API 26+, mipmap-anydpi-v26/ic_launcher.xml):
the curtain colour as background, the portrait without the curtain as foreground
on the 108 dp canvas (the 1024 art spans ART_DP of it, so the face sits inside the
66 dp safe zone and the launcher mask never shows an empty ring), and a
monochrome layer for Android 13 themed icons.
"""
import json
from pathlib import Path

from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parent.parent
CURTAIN, DEEP = (14, 74, 79), (10, 56, 60)
HAIR, HAIR_DARK, HAIR_LIGHT = (214, 84, 28), (168, 56, 18), (240, 128, 52)
SKIN, BLUSH, FRECKLE = (250, 218, 196), (246, 176, 156), (222, 150, 112)
IRIS, IRIS_DARK, PUPIL = (46, 134, 222), (24, 84, 164), (24, 26, 36)
LIPS, WHITE, LASH = (200, 62, 66), (255, 255, 255), (96, 40, 24)
SS = 4
SIZE = 1024 * SS
ART_DP = 76  # how many of the adaptive icon's 108 dp the 1024 art spans
ADAPTIVE = round(1024 * 108 / ART_DP)  # adaptive canvas in art units
OFF = 0.0  # art origin inside the current canvas, in art units

# Themed (monochrome) icon: alpha per colour. The hair frames the face, which is a
# cut-out showing the eyes, brows, freckles and smile.
MONO = {DEEP: 0, HAIR: 255, HAIR_DARK: 255, HAIR_LIGHT: 255, SKIN: 0, BLUSH: 0,
        FRECKLE: 170, IRIS: 255, IRIS_DARK: 255, PUPIL: 0, LIPS: 255, WHITE: 0, LASH: 255}


def s(v: float) -> int:
    return round(v * SS)


def box(cx: float, cy: float, rx: float, ry: float) -> list[int]:
    return [s(OFF + cx - rx), s(OFF + cy - ry), s(OFF + cx + rx), s(OFF + cy + ry)]


class Paint(ImageDraw.ImageDraw):
    """ImageDraw that maps the palette through `paint` (colour -> RGBA fill)."""

    def __init__(self, im: Image.Image, paint) -> None:
        super().__init__(im)
        self.paint = paint

    def _p(self, kw: dict) -> dict:
        return {k: self.paint(v) if k == "fill" else v for k, v in kw.items()}

    def ellipse(self, xy, **kw): super().ellipse(xy, **self._p(kw))
    def rectangle(self, xy, **kw): super().rectangle(xy, **self._p(kw))
    def rounded_rectangle(self, xy, radius=0, **kw): super().rounded_rectangle(xy, radius, **self._p(kw))
    def pieslice(self, xy, start, end, **kw): super().pieslice(xy, start, end, **self._p(kw))
    def chord(self, xy, start, end, **kw): super().chord(xy, start, end, **self._p(kw))
    def arc(self, xy, start, end, **kw): super().arc(xy, start, end, **self._p(kw))


def eye(d: ImageDraw.ImageDraw, cx: float, cy: float) -> None:
    d.ellipse(box(cx, cy, 92, 62), fill=WHITE)
    d.ellipse(box(cx, cy, 60, 60), fill=IRIS_DARK)
    d.ellipse(box(cx, cy, 50, 50), fill=IRIS)
    d.ellipse(box(cx, cy, 24, 24), fill=PUPIL)
    d.ellipse(box(cx + 18, cy - 20, 12, 12), fill=WHITE)
    d.arc(box(cx, cy, 96, 66), 195, 345, fill=LASH, width=s(15))  # upper lid
    d.arc(box(cx, cy - 92, 102, 44), 200, 340, fill=HAIR_DARK, width=s(15))  # brow


def draw(size: int = 1024, paint=lambda c: c + (255,), curtain=True) -> Image.Image:
    """The art drawn centred on a `size` (art units) canvas, colours mapped by `paint`."""
    global OFF
    OFF = (size - 1024) / 2
    bg = Image.new("RGBA", (s(size), s(size)), paint(CURTAIN) if curtain else (0, 0, 0, 0))
    d = Paint(bg, paint)
    d.ellipse(box(512, 1120, 430, 300), fill=DEEP)  # shoulders

    d.rounded_rectangle([s(OFF + 120), s(OFF + 70), s(OFF + 904), s(OFF + 1100)], radius=s(370), fill=HAIR)  # hair behind
    d.rectangle(box(512, 860, 92, 130), fill=BLUSH)  # neck
    d.ellipse(box(512, 530, 300, 370), fill=SKIN)  # face

    d.pieslice(box(560, 330, 410, 300), 170, 300, fill=HAIR)  # fringe, swept left
    d.pieslice(box(420, 330, 400, 270), 245, 370, fill=HAIR)
    d.arc(box(420, 420, 300, 330), 205, 285, fill=HAIR_LIGHT, width=s(24))  # strand of light
    d.arc(box(180, 660, 54, 340), 110, 250, fill=HAIR_DARK, width=s(18))
    d.arc(box(844, 660, 54, 340), 290, 70, fill=HAIR_DARK, width=s(18))

    eye(d, 382, 520)
    eye(d, 642, 520)
    for x, y in [(330, 640), (372, 668), (290, 664), (694, 640), (652, 668), (734, 664), (470, 626), (554, 626)]:
        d.ellipse(box(x, y, 9, 9), fill=FRECKLE)  # freckles
    d.arc(box(512, 628, 34, 22), 20, 160, fill=BLUSH, width=s(10))  # nose
    d.chord(box(512, 748, 92, 44), 8, 172, fill=LIPS)  # smile
    d.chord(box(512, 752, 74, 24), 8, 172, fill=WHITE)
    return bg


def adaptive(res: Path) -> None:
    fg = draw(ADAPTIVE, curtain=False).resize((1080, 1080), Image.LANCZOS)
    mono = draw(ADAPTIVE, lambda c: (255, 255, 255, MONO[c]), curtain=False).resize((1080, 1080), Image.LANCZOS)
    for name, px in {"mdpi": 108, "hdpi": 162, "xhdpi": 216, "xxhdpi": 324, "xxxhdpi": 432}.items():
        fg.resize((px, px), Image.LANCZOS).save(res / f"mipmap-{name}/ic_launcher_foreground.png")
        mono.resize((px, px), Image.LANCZOS).save(res / f"mipmap-{name}/ic_launcher_monochrome.png")
    (res / "values/ic_launcher_background.xml").write_text(
        '<?xml version="1.0" encoding="utf-8"?>\n<resources>\n'
        '    <color name="ic_launcher_background">#%02X%02X%02X</color>\n</resources>\n' % CURTAIN)
    (res / "mipmap-anydpi-v26").mkdir(exist_ok=True)
    (res / "mipmap-anydpi-v26/ic_launcher.xml").write_text(
        '<?xml version="1.0" encoding="utf-8"?>\n'
        '<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">\n'
        '    <background android:drawable="@color/ic_launcher_background" />\n'
        '    <foreground android:drawable="@mipmap/ic_launcher_foreground" />\n'
        '    <monochrome android:drawable="@mipmap/ic_launcher_monochrome" />\n'
        '</adaptive-icon>\n')


def main() -> None:
    icon = draw().convert("RGB").resize((1024, 1024), Image.LANCZOS)
    ios = ROOT / "ios/Runner/Assets.xcassets/AppIcon.appiconset"
    for entry in json.loads((ios / "Contents.json").read_text())["images"]:
        px = round(float(entry["size"].split("x")[0]) * int(entry["scale"][:-1]))
        icon.resize((px, px), Image.LANCZOS).save(ios / entry["filename"])
    for name, px in {"mdpi": 48, "hdpi": 72, "xhdpi": 96, "xxhdpi": 144, "xxxhdpi": 192}.items():
        icon.resize((px, px), Image.LANCZOS).save(
            ROOT / f"android/app/src/main/res/mipmap-{name}/ic_launcher.png")
    adaptive(ROOT / "android/app/src/main/res")


if __name__ == "__main__":
    main()
