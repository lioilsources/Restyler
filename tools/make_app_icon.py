#!/usr/bin/env python3
"""Draws the app icon: a red-haired woman with blue eyes, behind the booth curtain.

The background is BoothColors.curtain from lib/theme.dart. Writes every iOS and
Android size in place; needs Pillow only.
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


def s(v: float) -> int:
    return round(v * SS)


def box(cx: float, cy: float, rx: float, ry: float) -> list[int]:
    return [s(cx - rx), s(cy - ry), s(cx + rx), s(cy + ry)]


def eye(d: ImageDraw.ImageDraw, cx: float, cy: float) -> None:
    d.ellipse(box(cx, cy, 92, 62), fill=WHITE)
    d.ellipse(box(cx, cy, 60, 60), fill=IRIS_DARK)
    d.ellipse(box(cx, cy, 50, 50), fill=IRIS)
    d.ellipse(box(cx, cy, 24, 24), fill=PUPIL)
    d.ellipse(box(cx + 18, cy - 20, 12, 12), fill=WHITE)
    d.arc(box(cx, cy, 96, 66), 195, 345, fill=LASH, width=s(15))  # upper lid
    d.arc(box(cx, cy - 92, 102, 44), 200, 340, fill=HAIR_DARK, width=s(15))  # brow


def draw() -> Image.Image:
    bg = Image.new("RGB", (SIZE, SIZE), CURTAIN)
    d = ImageDraw.Draw(bg)
    d.ellipse(box(512, 1120, 430, 300), fill=DEEP)  # shoulders

    d.rounded_rectangle([s(120), s(70), s(904), s(1100)], radius=s(370), fill=HAIR)  # hair behind
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


def main() -> None:
    icon = draw().resize((1024, 1024), Image.LANCZOS)
    ios = ROOT / "ios/Runner/Assets.xcassets/AppIcon.appiconset"
    for entry in json.loads((ios / "Contents.json").read_text())["images"]:
        px = round(float(entry["size"].split("x")[0]) * int(entry["scale"][:-1]))
        icon.resize((px, px), Image.LANCZOS).save(ios / entry["filename"])
    for name, px in {"mdpi": 48, "hdpi": 72, "xhdpi": 96, "xxhdpi": 144, "xxxhdpi": 192}.items():
        icon.resize((px, px), Image.LANCZOS).save(
            ROOT / f"android/app/src/main/res/mipmap-{name}/ic_launcher.png")


if __name__ == "__main__":
    main()
