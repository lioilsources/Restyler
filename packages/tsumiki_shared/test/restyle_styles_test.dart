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

  test('labels are the English names', () {
    expect(restyleStyleById('cave-painting')!.label, 'Cave painting (Lascaux)');
    expect(restyleStyleById('comic')!.label, 'Comic book');
  });

  test(
    'search ignores case and diacritics, reads the id and the shown name',
    () {
      final watercolor = restyleStyleById('watercolor-wet')!;
      expect(restyleStyleMatchesQuery(watercolor, 'watercolor'), isTrue);
      final cave = restyleStyleById('cave-painting')!;
      const shown = 'Jeskynní malba (Lascaux)';
      expect(restyleStyleMatchesQuery(cave, 'jeskynni'), isFalse);
      expect(restyleStyleMatchesQuery(cave, 'jeskynni', shown: shown), isTrue);
      expect(restyleStyleMatchesQuery(cave, 'JESKYNNÍ', shown: shown), isTrue);
      expect(restyleStyleMatchesQuery(cave, 'cave painting'), isTrue);
      expect(restyleStyleMatchesQuery(cave, 'baroko', shown: shown), isFalse);
    },
  );
}
