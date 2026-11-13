import 'package:flutter_test/flutter_test.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

void main() {
  test('catalog: 318 styles, unique ids, every one in a known section', () {
    expect(kRestyleStyles, hasLength(318));
    expect(kRestyleStyles.map((s) => s.id).toSet(), hasLength(318));
    for (final s in kRestyleStyles) {
      expect(kRestyleGroups, contains(s.group), reason: s.id);
      expect(s.block.trim(), isNotEmpty, reason: s.id);
    }
    expect(restyleStylesIn(kRestyleGroupMedia), hasLength(110));
  });

  test('the first 24 the picker shows without a query did not change', () {
    expect(kRestyleStyles.take(8).map((s) => s.group).toSet(), {
      kRestyleGroupPopular,
    });
    expect(kRestyleStyles.take(24).map((s) => s.id), contains('botticelli'));
  });

  test('search ignores case and diacritics and reads the id', () {
    final watercolor = restyleStyleById('watercolor-wet')!;
    expect(watercolor.label, isNot(contains('atercolor')));
    expect(restyleStyleMatchesQuery(watercolor, 'watercolor'), isTrue);
    final cave = restyleStyleById('cave-painting')!;
    expect(restyleStyleMatchesQuery(cave, 'jeskynni'), isTrue);
    expect(restyleStyleMatchesQuery(cave, 'JESKYNNÍ'), isTrue);
    expect(restyleStyleMatchesQuery(cave, 'cave painting'), isTrue);
    expect(restyleStyleMatchesQuery(cave, 'baroko'), isFalse);
  });
}
