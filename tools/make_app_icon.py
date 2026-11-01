#!/usr/bin/env python3
"""Draws the app icon: a photo booth strip with one face and three looks.

Colours are BoothColors from lib/theme.dart. Writes every iOS and Android size
in place; needs Pillow only.
"""
import json
from pathlib import Path

from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parent.parent
CURTAIN, DEEP = (14, 74, 79), (10, 56, 60)
PAPER, INK, FLASH, HAZE = (255, 255, 255), (30, 34, 36), (255, 200, 61), (191, 216, 214)
SS = 4
SIZE = 1024 * SS


def s(v: float) -> int:
    return round(v * SS)


def head(d: ImageDraw.ImageDraw, cx: float, cy: float, r: float, look: str) -> None:
    """A head of radius r on shoulders; every look has to read at 60 px."""
    box = lambda x0, y0, x1, y1: [s(cx + x0 * r), s(cy + y0 * r), s(cx + x1 * r), s(cy + y1 * r)]
    d.ellipse(box(-1.75, 1.05, 1.75, 3.2), fill=INK)  # shoulders
    if look == "long":
        d.rounded_rectangle(box(-1.28, -1.25, 1.28, 1.35), radius=s(r * 1.05), fill=FLASH)
    d.ellipse(box(-0.9, -1.0, 0.9, 1.15), fill=HAZE)  # face
    if look == "beard":
        d.chord(box(-0.9, -0.7, 0.9, 1.3), 5, 175, fill=INK)
        d.pieslice(box(-0.95, -1.12, 0.95, 0.0), 180, 360, fill=INK)
        d.ellipse(box(-0.28, 0.42, 0.28, 0.62), fill=HAZE)  # mouth
    if look == "long":
        d.pieslice(box(-0.95, -1.2, 0.95, 0.35), 180, 360, fill=FLASH)
    if look == "glasses":
        d.pieslice(box(-1.0, -1.42, 1.0, 0.6), 180, 360, fill=INK)
        d.rectangle(box(-0.82, -0.2, 0.82, -0.05), fill=INK)
        d.ellipse(box(-0.8, -0.42, -0.08, 0.3), fill=FLASH, outline=INK, width=s(r * 0.15))
        d.ellipse(box(0.08, -0.42, 0.8, 0.3), fill=FLASH, outline=INK, width=s(r * 0.15))


def draw() -> Image.Image:
    bg = Image.new("RGB", (SIZE, SIZE), CURTAIN)
    d = ImageDraw.Draw(bg)
    d.rectangle([0, s(880), SIZE, SIZE], fill=DEEP)  # booth floor

    W, H = 470, 940
    strip = Image.new("RGBA", (s(W), s(H)), (0, 0, 0, 0))
    p = ImageDraw.Draw(strip)
    p.rounded_rectangle([0, 0, s(W) - 1, s(H) - 1], radius=s(22), fill=PAPER)
    frame_h = (H - 4 * 26) / 3
    for i, look in enumerate(["beard", "glasses", "long"]):
        y0 = 26 + i * (frame_h + 26)
        frame = Image.new("RGB", (s(W - 52), s(frame_h)), (36, 120, 124))
        head(ImageDraw.Draw(frame), (W - 52) / 2, frame_h * 0.46, 72, look)
        strip.paste(frame, (s(26), s(y0)))

    strip = strip.rotate(-7, expand=True, resample=Image.BICUBIC)
    bg.paste(strip, ((SIZE - strip.width) // 2, (SIZE - strip.height) // 2), strip)
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
