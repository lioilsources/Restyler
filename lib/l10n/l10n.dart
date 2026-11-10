import 'dart:ui' show Locale, PlatformDispatcher;

import 'package:flutter/widgets.dart';

import 'app_localizations.dart';

export 'app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Picks the best supported locale for the system locales, falling back to English
/// (Flutter would otherwise fall back to the first supported locale alphabetically).
Locale resolveLocale(List<Locale>? locales, Iterable<Locale> supported) {
  final wanted = [
    for (final l in locales ?? const <Locale>[])
      if (l.languageCode == 'no')
        Locale.fromSubtags(languageCode: 'nb', scriptCode: l.scriptCode, countryCode: l.countryCode)
      else
        l,
  ];
  final r = basicLocaleListResolution(wanted, supported);
  return wanted.any((l) => l.languageCode == r.languageCode) ? r : const Locale('en');
}

/// Tests pin the language here.
Locale? debugLocale;

/// Localizations for code that has no BuildContext (providers, services).
/// Resolves against the device locales the same way MaterialApp does; messages
/// stored in a project keep the language they were written in.
AppLocalizations get deviceL10n => lookupAppLocalizations(
  debugLocale ??
      resolveLocale(PlatformDispatcher.instance.locales, AppLocalizations.supportedLocales),
);

/// Catalog names come in Czech (`cs`) and English (`label`) only.
String catalogName(BuildContext context, String cs, String en) =>
    Localizations.localeOf(context).languageCode == 'cs' ? cs : en;
