import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../models/booth_project.dart';

/// A ready set of styles. Eight entries each, so every K (4/6/8) can take the
/// first K; the strongest contrast comes first. `mixes_test` pins the ids.
class StyleMix {
  const StyleMix(this.id, this.label, this.frames);

  final String id;
  final String label;
  final List<BoothFrame> frames;
}

const _photo = RestyleMedium.photo;
const _draw = RestyleMedium.illustration;

BoothFrame _f(String id, [RestyleMedium medium = _draw]) =>
    BoothFrame(styleId: id, medium: medium);

final kStyleMixes = <StyleMix>[
  StyleMix('galerie', 'Galerie', [
    _f('vermeer'),
    _f('vangogh-arles'),
    _f('klimt-golden'),
    _f('picasso-blue'),
    _f('monet'),
    _f('lautrec-poster'),
    _f('matisse-cutout'),
    _f('schiele'),
  ]),
  StyleMix('komiks', 'Pop a komiks', [
    _f('popart'),
    _f('anime'),
    _f('comic'),
    _f('lichtenstein'),
    _f('warhol'),
    _f('cyberpunk', _photo),
    _f('noir', _photo),
    _f('haring'),
  ]),
  StyleMix('epochy', 'Cesta epochami', [
    _f('romanfresco'),
    _f('byzantine'),
    _f('illumination'),
    _f('baroque'),
    _f('impressionist'),
    _f('artnouveau'),
    _f('artdeco'),
    _f('constructivist'),
  ]),
  StyleMix('asie', 'Asie', [
    _f('ukiyoe'),
    _f('chineseink'),
    _f('thangka'),
    _f('persian'),
    _f('rinpa'),
    _f('minhwa'),
    _f('indian'),
    _f('papercut'),
  ]),
  StyleMix('cesko', 'Česká stopa', [
    _f('mucha-slav-epic'),
    _f('lada'),
    _f('josef-capek'),
    _f('kubista'),
    _f('secession'),
    _f('woodcut'),
    _f('pencil'),
    _f('watercolor'),
  ]),
];
