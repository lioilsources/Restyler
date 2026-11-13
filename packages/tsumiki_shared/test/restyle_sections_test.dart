import 'package:flutter_test/flutter_test.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

void main() {
  test('the three sections cover every style exactly once', () {
    final all = [
      for (final s in RestyleSection.values)
        ...restyleSectionStyles(s, (s) => s.label),
    ];
    expect(
      all.map((s) => s.id).toSet(),
      kRestyleStyles.map((s) => s.id).toSet(),
    );
    expect(all, hasLength(kRestyleStyles.length));
  });

  test('every epoch and artist has a year, no stray years', () {
    final dated = kRestyleStyles
        .where((s) => restyleSectionOf(s) != RestyleSection.medium)
        .map((s) => s.id)
        .toSet();
    expect(dated.difference(kRestyleStyleYear.keys.toSet()), isEmpty);
    expect(kRestyleStyleYear.keys.toSet().difference(dated), isEmpty);
  });

  test('epochs and artists by year, media by folded name', () {
    final epochs = restyleSectionStyles(RestyleSection.epoch, (s) => s.label);
    expect(epochs.first.id, 'cave-painting');
    final years = [for (final s in epochs) kRestyleStyleYear[s.id]!];
    expect(years, [...years]..sort());

    final artists = restyleSectionStyles(RestyleSection.artist, (s) => s.label);
    expect(artists.first.id, 'van-eyck');
    expect(artists.last.id, 'kehinde-wiley');

    final media = restyleSectionStyles(RestyleSection.medium, (s) => s.label);
    final names = [for (final s in media) foldDiacritics(s.label)];
    expect(names, [...names]..sort());
  });
}
