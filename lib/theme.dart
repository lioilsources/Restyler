import 'package:flutter/material.dart';

/// The booth: a curtain to sit behind, white paper for what comes out of it,
/// and the yellow of the flash for the one thing to press.
abstract final class BoothColors {
  static const curtain = Color(0xFF0E4A4F);
  static const curtainDeep = Color(0xFF0A383C);
  static const paper = Color(0xFFFFFFFF);
  static const ink = Color(0xFF1E2224);
  static const flash = Color(0xFFFFC83D);
  static const haze = Color(0xFFBFD8D6);
  static const alert = Color(0xFFFFB4A2);
}

ThemeData boothTheme() {
  final scheme =
      ColorScheme.fromSeed(
        seedColor: BoothColors.curtain,
        brightness: Brightness.dark,
      ).copyWith(
        primary: BoothColors.flash,
        onPrimary: BoothColors.ink,
        surface: BoothColors.curtain,
        onSurface: BoothColors.paper,
        onSurfaceVariant: BoothColors.haze,
        surfaceContainerHighest: BoothColors.curtainDeep,
        outlineVariant: const Color(0xFF3B7377),
        error: BoothColors.alert,
      );
  return ThemeData(
    colorScheme: scheme,
    scaffoldBackgroundColor: BoothColors.curtain,
    splashFactory: InkRipple.splashFactory,
    appBarTheme: const AppBarTheme(
      backgroundColor: BoothColors.curtain,
      foregroundColor: BoothColors.paper,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
  );
}
