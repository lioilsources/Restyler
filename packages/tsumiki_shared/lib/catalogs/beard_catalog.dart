// Generated from MangaPrompts tgbot/tools/bench/candidates/beards.json.
// All 21 candidates by the user's pick; the previews are reference
// portraits of each style (txt2img), not bench edits. Do not edit by hand.

import 'beards.dart';

const kBeards = <Beard>[
  Beard(
    id: 'clean-shaven',
    label: 'Clean shaven',
    cs: 'hladce oholený',
    section: 'Shave',
    block: '',
    region: BeardRegion(BeardRegionKind.full, belowChin: 0.1),
  ),
  Beard(
    id: 'light-stubble',
    label: 'Light stubble',
    cs: 'lehké strniště',
    section: 'Stubble',
    block: 'light five o\'clock shadow stubble, very short even facial hair',
    region: BeardRegion(BeardRegionKind.full),
  ),
  Beard(
    id: 'heavy-stubble',
    label: 'Heavy stubble',
    cs: 'husté strniště',
    section: 'Stubble',
    block: 'heavy stubble, 3–5 mm even facial hair over cheeks, jaw and chin',
    region: BeardRegion(BeardRegionKind.full),
  ),
  Beard(
    id: 'short-boxed',
    label: 'Short boxed beard',
    cs: 'krátký zastřižený plnovous',
    section: 'Short',
    block:
        'short boxed beard, neatly trimmed full beard with clean sharp cheek and neck lines',
    region: BeardRegion(BeardRegionKind.full, belowChin: 0.1),
  ),
  Beard(
    id: 'corporate',
    label: 'Corporate beard',
    cs: 'upravené krátké vousy',
    section: 'Short',
    block: 'corporate beard, short tidy full beard about 1 cm, well groomed',
    region: BeardRegion(BeardRegionKind.full, belowChin: 0.1),
  ),
  Beard(
    id: 'full-beard',
    label: 'Full beard',
    cs: 'plnovous',
    section: 'Full',
    block:
        'full thick beard with moustache, medium length covering cheeks, jaw and chin',
    region: BeardRegion(BeardRegionKind.full, belowChin: 0.25),
  ),
  Beard(
    id: 'long-beard',
    label: 'Long beard',
    cs: 'dlouhý plnovous',
    section: 'Full',
    block: 'long full beard reaching the upper chest, thick moustache',
    region: BeardRegion(BeardRegionKind.full, belowChin: 0.5),
  ),
  Beard(
    id: 'garibaldi',
    label: 'Garibaldi',
    cs: 'garibaldi',
    section: 'Full',
    block:
        'garibaldi beard, wide full rounded beard with an integrated moustache',
    region: BeardRegion(BeardRegionKind.full, belowChin: 0.35),
  ),
  Beard(
    id: 'ducktail',
    label: 'Ducktail beard',
    cs: 'plnovous do špičky',
    section: 'Full',
    block: 'ducktail beard, full beard tapered to a point under the chin',
    region: BeardRegion(BeardRegionKind.full, belowChin: 0.35),
  ),
  Beard(
    id: 'goatee',
    label: 'Goatee',
    cs: 'bradka',
    section: 'Goatee',
    block:
        'goatee, hair on the chin only with a clean-shaven jaw, no moustache',
    region: BeardRegion(BeardRegionKind.chin, belowChin: 0.1),
  ),
  Beard(
    id: 'circle-beard',
    label: 'Circle beard',
    cs: 'kruhová bradka',
    section: 'Goatee',
    block:
        'circle beard, goatee connected to a moustache in a ring around the mouth, shaved cheeks',
    region: BeardRegion(BeardRegionKind.chin, belowChin: 0.1, moustache: true),
  ),
  Beard(
    id: 'van-dyke',
    label: 'Van Dyke',
    cs: 'bradka Van Dyke',
    section: 'Goatee',
    block:
        'van dyke beard, pointed goatee and a separate styled moustache, shaved cheeks',
    region: BeardRegion(BeardRegionKind.chin, belowChin: 0.15, moustache: true),
  ),
  Beard(
    id: 'anchor',
    label: 'Anchor beard',
    cs: 'kotva',
    section: 'Goatee',
    block:
        'anchor beard tracing the jawline to a point under the chin with a pencil moustache',
    region: BeardRegion(BeardRegionKind.jaw, belowChin: 0.1, moustache: true),
  ),
  Beard(
    id: 'chin-strap',
    label: 'Chin strap',
    cs: 'linka podél čelisti',
    section: 'Goatee',
    block:
        'chin strap beard, a thin line of hair along the jawline, no moustache',
    region: BeardRegion(BeardRegionKind.jaw, belowChin: 0.05),
  ),
  Beard(
    id: 'soul-patch',
    label: 'Soul patch',
    cs: 'muška pod rtem',
    section: 'Goatee',
    block:
        'soul patch, a small tuft of hair just below the lower lip, otherwise clean-shaven',
    region: BeardRegion(BeardRegionKind.chin),
  ),
  Beard(
    id: 'mutton-chops',
    label: 'Mutton chops',
    cs: 'licousy',
    section: 'Full',
    block:
        'mutton chops, thick sideburns extending down the cheeks to the jaw, clean chin, no moustache',
    region: BeardRegion(BeardRegionKind.jaw),
  ),
  Beard(
    id: 'chevron',
    label: 'Chevron moustache',
    cs: 'knír chevron',
    section: 'Moustache',
    block:
        'chevron moustache, thick full moustache covering the upper lip, clean-shaven otherwise',
    region: BeardRegion(BeardRegionKind.moustache),
  ),
  Beard(
    id: 'handlebar',
    label: 'Handlebar moustache',
    cs: 'kroucený knír',
    section: 'Moustache',
    block:
        'handlebar moustache with long ends curled upward, clean-shaven otherwise',
    region: BeardRegion(BeardRegionKind.moustache),
  ),
  Beard(
    id: 'pencil',
    label: 'Pencil moustache',
    cs: 'tenký knírek',
    section: 'Moustache',
    block:
        'thin pencil moustache just above the upper lip, clean-shaven otherwise',
    region: BeardRegion(BeardRegionKind.moustache),
  ),
  Beard(
    id: 'walrus',
    label: 'Walrus moustache',
    cs: 'mroží knír',
    section: 'Moustache',
    block: 'walrus moustache, very thick and bushy, hanging over the upper lip',
    region: BeardRegion(BeardRegionKind.moustache),
  ),
  Beard(
    id: 'horseshoe',
    label: 'Horseshoe moustache',
    cs: 'knír podkova',
    section: 'Moustache',
    block:
        'horseshoe moustache running down both sides of the mouth to the jaw',
    region: BeardRegion(BeardRegionKind.moustache, chinSides: true),
  ),
];
