import 'restyle_styles.dart';

/// How the style picker sorts the catalog: by epoch, by artist or by medium.
enum RestyleSection { epoch, artist, medium }

/// Popular styles that are a technique, not a period.
const _popularMedia = {'watercolor', 'oilportrait', 'pencil'};

RestyleSection restyleSectionOf(RestyleStyle s) {
  if (s.group == kRestyleGroupPainters) return RestyleSection.artist;
  if (s.group == kRestyleGroupMedia || _popularMedia.contains(s.id)) {
    return RestyleSection.medium;
  }
  return RestyleSection.epoch;
}

/// Approximate year of the look: for an epoch its heyday, for an artist the
/// period the style names (else their mature work). Negative = BCE. Only
/// used for sorting epochs and artists; media sort by name.
const kRestyleStyleYear = <String, int>{
  // Popular
  'anime': 1963, 'comic': 1938, 'popart': 1956, 'cyberpunk': 1982,
  'noir': 1941,
  // Asia
  'ukiyoe': 1760, 'chineseink': 1100, 'persian': 1530, 'indian': 1600,
  'burmese': 1150, 'thangka': 1400, 'rinpa': 1620, 'dunhuang': 700,
  'minhwa': 1800, 'papercut': 1500, 'filipino': 1700, 'tang-sancai': 720,
  'yamato-e': 1130, 'pattachitra': 1200, 'kano-screen': 1580,
  'nianhua': 1750, 'kamasan-bali': 1700, 'enso-zen': 1650,
  'madhubani': 1960, 'peking-opera-mask': 1800, 'nihonga': 1900,
  'warli': 1970,
  // Europe
  'cave-painting': -17000, 'minoan': -1600, 'greek-vase-black': -550,
  'etruscan-tomb': -480, 'scythian-gold': -400, 'romanfresco': -50,
  'roman-mosaic': 100, 'byzantine': 600, 'kells': 800, 'urnes-viking': 1070,
  'bayeux': 1075, 'romanesque-fresco': 1120, 'illumination': 1250,
  'stainedglass': 1250, 'gothic-altarpiece': 1350, 'pskov-icon': 1400,
  'danse-macabre': 1450, 'baroque': 1630, 'flemish-still-life': 1640,
  'rococo': 1740, 'neoclassicism': 1790, 'romanticism-storm': 1820,
  'orientalism': 1850, 'prerafael': 1850, 'victorian-fairy': 1860,
  'arts-and-crafts': 1880, 'impressionist': 1874, 'symbolism': 1886,
  'nabis': 1890, 'artnouveau': 1895, 'secession': 1898, 'woodcut': 1910,
  'expressionism-painting': 1910, 'dada-collage': 1918,
  'constructivist': 1920, 'de-stijl': 1920, 'bauhaus-poster': 1925,
  'artdeco': 1928, 'socialist-realism': 1940, 'polish-poster': 1960,
  'memphis-80s': 1981,
  // Americas & Oceania
  'aboriginal': 1971, 'maya': 750, 'aztec': 1500, 'inca': 1480,
  'nazca': 300, 'moche': 400, 'haida-formline': 1850, 'ledger': 1870,
  'huichol': 1960, 'polynesian': 1700, 'hudson-river': 1850,
  'navajo-sand': 1930, 'precisionism': 1925, 'inuit-printmaking': 1959,
  'psychedelic-poster': 1967,
  // Africa & Near East
  'san-rock-art': -2000, 'egyptian': -1350, 'mesopotamian': -2300,
  'assyrian': -700, 'hebrew': -800, 'arabian': 300,
  'armenian-manuscript': 1270, 'benin-bronze': 1550, 'ashanti': 1800,
  'dogon': 1900, 'kuba-cloth': 1900, 'maasai': 1950, 'ndebele': 1950,
  'tingatinga': 1970,
  // Painters
  'van-eyck': 1434, 'bosch': 1500, 'davinci': 1503, 'durer-engraving': 1514,
  'bruegel': 1565, 'elgreco': 1600, 'caravaggio': 1600, 'velazquez': 1656,
  'vermeer': 1665, 'fragonard': 1767, 'goya-caprichos': 1799,
  'blake': 1795, 'hokusai': 1814, 'goya-black': 1820, 'friedrich': 1818,
  'turner': 1840, 'hiroshige': 1857, 'kuniyoshi': 1845, 'dore': 1866,
  'whistler': 1875, 'monet': 1872, 'yoshitoshi': 1885, 'cassatt': 1890,
  'repin': 1880, 'seurat': 1884, 'cezanne': 1890, 'vangogh-arles': 1888,
  'vangogh-saintremy': 1889, 'gauguin': 1892, 'lautrec-cabaret': 1892,
  'lautrec-poster': 1893, 'beardsley': 1894, 'munch': 1893,
  'rousseau': 1908, 'ales': 1890, 'larsson': 1899, 'malczewski': 1902,
  'sargent': 1890, 'vrubel': 1900, 'ensor': 1889, 'sorolla': 1909,
  'hammershoi': 1905, 'rackham': 1907, 'wyspianski': 1902,
  'kupka-early': 1912, 'preisler': 1905, 'bilibin': 1902,
  'picasso-blue': 1902, 'picasso-rose': 1905, 'klimt-golden': 1907,
  'kandinsky-early': 1907, 'matisse-fauve': 1905, 'kirchner': 1910,
  'marc': 1911, 'kubista': 1912, 'picasso-cubist': 1910,
  'josef-capek': 1920, 'leger': 1920, 'de-chirico': 1914,
  'mucha-slav-epic': 1920, 'chagall': 1915, 'klee': 1922, 'rivera': 1930,
  'lempicka': 1929, 'magritte': 1929, 'grant-wood': 1930, 'miro': 1940,
  'lada': 1930, 'toyen': 1937, 'dali': 1931, 'hopper': 1942,
  'kahlo': 1940, 'burian': 1950, 'trnka': 1950, 'jacob-lawrence': 1941,
  'wyeth': 1948, 'matisse-cutout': 1952, 'bearden': 1964,
  'warhol': 1962, 'lichtenstein': 1963, 'kusama': 1965,
  'hockney-pool': 1967, 'born': 1970, 'moebius': 1975, 'giger': 1979,
  'beksinski': 1980, 'basquiat': 1982, 'haring': 1985, 'murakami': 2000,
  'kehinde-wiley': 2010,
};

/// [styles] of [section], epochs and artists by year then [name], media by
/// [name] (the shown, localised name), ignoring case and diacritics.
List<RestyleStyle> restyleSectionStyles(
  RestyleSection section,
  String Function(RestyleStyle) name, {
  Iterable<RestyleStyle> styles = kRestyleStyles,
}) {
  int byName(RestyleStyle a, RestyleStyle b) =>
      foldDiacritics(name(a)).compareTo(foldDiacritics(name(b)));
  final list = styles.where((s) => restyleSectionOf(s) == section).toList();
  if (section == RestyleSection.medium) return list..sort(byName);
  return list..sort((a, b) {
    final y = (kRestyleStyleYear[a.id] ?? 0).compareTo(
      kRestyleStyleYear[b.id] ?? 0,
    );
    return y != 0 ? y : byName(a, b);
  });
}
