import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/sizing.dart';
import '../tokens/typography.dart';

/// Tema do Bloomix Design System
class BloomixTheme {
  BloomixTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      textTheme: _textTheme,
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
      cardTheme: _cardThemeData,
      inputDecorationTheme: _inputDecorationTheme,
      floatingActionButtonTheme: _floatingActionButtonTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      textTheme: _textTheme,
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
      cardTheme: _cardThemeData,
      inputDecorationTheme: _inputDecorationTheme,
      floatingActionButtonTheme: _floatingActionButtonTheme,
    );
  }

  static ColorScheme get _lightColorScheme {
    return const ColorScheme.light(
      primary: BloomixColors.primary500,
      onPrimary: BloomixColors.textOnPrimary,
      secondary: BloomixColors.secondary500,
      onSecondary: BloomixColors.textOnSecondary,
      surface: BloomixColors.surface,
      onSurface: BloomixColors.textPrimary,
      error: BloomixColors.error,
      onError: BloomixColors.textOnPrimary,
    );
  }

  static ColorScheme get _darkColorScheme {
    return const ColorScheme.dark(
      primary: BloomixColors.primary400,
      onPrimary: BloomixColors.textOnPrimary,
      secondary: BloomixColors.secondary400,
      onSecondary: BloomixColors.textOnSecondary,
      surface: BloomixColors.neutral800,
      onSurface: BloomixColors.neutral100,
      error: BloomixColors.error,
      onError: BloomixColors.textOnPrimary,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: BloomixTypography.displayLarge,
      displayMedium: BloomixTypography.displayMedium,
      displaySmall: BloomixTypography.displaySmall,
      headlineLarge: BloomixTypography.headlineLarge,
      headlineMedium: BloomixTypography.headlineMedium,
      headlineSmall: BloomixTypography.headlineSmall,
      titleLarge: BloomixTypography.titleLarge,
      titleMedium: BloomixTypography.titleMedium,
      titleSmall: BloomixTypography.titleSmall,
      bodyLarge: BloomixTypography.bodyLarge,
      bodyMedium: BloomixTypography.bodyMedium,
      bodySmall: BloomixTypography.bodySmall,
      labelLarge: BloomixTypography.labelLarge,
      labelMedium: BloomixTypography.labelMedium,
      labelSmall: BloomixTypography.labelSmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      backgroundColor: BloomixColors.background,
      foregroundColor: BloomixColors.textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: BloomixColors.textPrimary,
      ),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: BloomixColors.primary500,
        foregroundColor: BloomixColors.textOnPrimary,
        elevation: BloomixSizing.elevationSm,
        shadowColor: BloomixColors.primary500.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: BloomixColors.primary500,
        side: const BorderSide(
          color: BloomixColors.primary500,
          width: BloomixSizing.borderSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
      ),
    );
  }

  static TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: BloomixColors.primary500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
      ),
    );
  }

  static CardThemeData get _cardThemeData {
    return CardThemeData(
      color: BloomixColors.surface,
      elevation: BloomixSizing.elevationMd,
      shadowColor: BloomixColors.neutral900.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BloomixSizing.radiusLg),
      ),
      margin: const EdgeInsets.all(4),
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: BloomixColors.neutral50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
        borderSide: const BorderSide(
          color: BloomixColors.border,
          width: BloomixSizing.borderSm,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
        borderSide: const BorderSide(
          color: BloomixColors.border,
          width: BloomixSizing.borderSm,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
        borderSide: const BorderSide(
          color: BloomixColors.primary500,
          width: BloomixSizing.borderMd,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
        borderSide: const BorderSide(
          color: BloomixColors.error,
          width: BloomixSizing.borderSm,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
    );
  }

  static FloatingActionButtonThemeData get _floatingActionButtonTheme {
    return const FloatingActionButtonThemeData(
      backgroundColor: BloomixColors.primary500,
      foregroundColor: BloomixColors.textOnPrimary,
      elevation: BloomixSizing.elevationMd,
    );
  }
}
