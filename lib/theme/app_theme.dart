import 'package:flutter/material.dart';

/// UPGRIS brand colours plus the neutral tones the interface is built on.
abstract final class AppColors {
  static const navy = Color(0xFF002147);
  static const yellow = Color(0xFFFDC800);
  static const ground = Color(0xFFF6F7F9);
  static const surface = Color(0xFFFFFFFF);
  static const muted = Color(0xFF566274);
  static const active = Color(0xFF2E9E6B);
}

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: AppColors.navy,
    onPrimary: Colors.white,
    secondary: AppColors.yellow,
    onSecondary: AppColors.navy,
    surface: AppColors.surface,
    onSurface: AppColors.navy,
  ),
  scaffoldBackgroundColor: AppColors.ground,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 52,
      height: 1.05,
      fontWeight: FontWeight.w800,
      letterSpacing: -1.5,
    ),
    displayMedium: TextStyle(
      fontSize: 38,
      height: 1.08,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.8,
    ),
    headlineSmall: TextStyle(
      fontSize: 30,
      height: 1.15,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.6,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      height: 1.3,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.1,
    ),
    bodyLarge: TextStyle(fontSize: 16, height: 1.6),
    bodyMedium: TextStyle(fontSize: 15, height: 1.55),
    bodySmall: TextStyle(fontSize: 13, height: 1.5),
    labelLarge: TextStyle(
      fontSize: 15,
      height: 1.2,
      fontWeight: FontWeight.w700,
    ),
  ).apply(bodyColor: AppColors.navy, displayColor: AppColors.navy),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.yellow,
      foregroundColor: AppColors.navy,
      minimumSize: const Size(0, 52),
      padding: const EdgeInsets.symmetric(horizontal: 28),
      shape: const StadiumBorder(),
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.navy,
      minimumSize: const Size(0, 44),
      padding: EdgeInsets.zero,
      shape: const StadiumBorder(),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),
);
