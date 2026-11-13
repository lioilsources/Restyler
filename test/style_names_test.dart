import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:restyler/l10n/app_localizations.dart';
import 'package:restyler/l10n/style_names.dart';
import 'package:restyler/services/strip.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

void main() {
  final cs = lookupAppLocalizations(const Locale('cs'));
  final en = lookupAppLocalizations(const Locale('en'));

  test('every catalog style has a name in every ARB file', () {
    for (final f in Directory('lib/l10n').listSync().whereType<File>()) {
      if (!f.path.endsWith('.arb')) continue;
      final names = jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;
      final styleKeys = names.keys.where((k) => k.startsWith('style'));
      expect(styleKeys, hasLength(kRestyleStyles.length), reason: f.path);
    }
    for (final s in kRestyleStyles) {
      expect(styleName(cs, s.id), isNotEmpty, reason: s.id);
      expect(styleName(en, s.id), s.label, reason: s.id);
    }
  });

  test('Czech names for old and new styles', () {
    expect(styleName(cs, 'comic'), 'Komiks');
    expect(styleName(cs, 'cave-painting'), 'Jeskynní malba (Lascaux)');
    expect(styleName(en, 'cave-painting'), 'Cave painting (Lascaux)');
  });

  test('an unknown id falls back to itself', () {
    expect(styleName(cs, 'no-such-style'), 'no-such-style');
  });

  test('the strip font has no em dash, so the caption gets an en dash', () {
    expect(
      stripText('Turner — rozpuštěné světlo'),
      'Turner – rozpuštěné světlo',
    );
  });
}
