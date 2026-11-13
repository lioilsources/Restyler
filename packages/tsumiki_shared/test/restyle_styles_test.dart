import 'package:flutter_test/flutter_test.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

void main() {
  test('catalog: 300 styles, unique ids, every one in a known section', () {
    expect(kRestyleStyles, hasLength(300));
    expect(kRestyleStyles.map((s) => s.id).toSet(), hasLength(300));
    for (final s in kRestyleStyles) {
      expect(kRestyleGroups, contains(s.group), reason: s.id);
      expect(s.block.trim(), isNotEmpty, reason: s.id);
    }
    expect(restyleStylesIn(kRestyleGroupMedia), hasLength(110));
  });

  test('retired styles stay out, and no block asks for a bare body', () {
    for (final id in kRetiredRestyleStyleIds) {
      expect(restyleStyleById(id), isNull, reason: id);
    }
    final risky = RegExp(
      r'\b(nude|naked|figure study|minimal clothing|anatomical|muscular anatomy|natural anatomy|flesh\w*|pin-?up)\b',
      caseSensitive: false,
    );
    for (final s in kRestyleStyles) {
      expect(risky.hasMatch(s.block), isFalse, reason: '${s.id}: ${s.block}');
    }
  });

  test('the first page the picker shows without a query starts with Popular', () {
    expect(kRestyleStyles.take(8).map((s) => s.group).toSet(), {
      kRestyleGroupPopular,
    });
    expect(kRestyleStyles.take(24).map((s) => s.id), contains('davinci'));
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
