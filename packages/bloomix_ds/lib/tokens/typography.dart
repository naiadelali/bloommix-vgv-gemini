import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tokens de Typography do Bloomix Design System
class BloomixTypography {
  BloomixTypography._();

  // Font Families (usadas internamente pelo GoogleFonts)
  // static const String _primaryFontFamily = 'Poppins';
  // static const String _secondaryFontFamily = 'Inter';

  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Display Styles
  static TextStyle get displayLarge => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: bold,
        height: 1.2,
        letterSpacing: -0.5,
      );

  static TextStyle get displayMedium => GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: bold,
        height: 1.25,
        letterSpacing: -0.25,
      );

  static TextStyle get displaySmall => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: semiBold,
        height: 1.3,
        letterSpacing: 0,
      );

  // Headline Styles
  static TextStyle get headlineLarge => GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: semiBold,
        height: 1.35,
        letterSpacing: 0,
      );

  static TextStyle get headlineMedium => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: semiBold,
        height: 1.4,
        letterSpacing: 0,
      );

  static TextStyle get headlineSmall => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: medium,
        height: 1.45,
        letterSpacing: 0,
      );

  // Title Styles
  static TextStyle get titleLarge => GoogleFonts.poppins(
        fontSize: 17,
        fontWeight: semiBold,
        height: 1.4,
        letterSpacing: 0,
      );

  static TextStyle get titleMedium => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: medium,
        height: 1.5,
        letterSpacing: 0,
      );

  static TextStyle get titleSmall => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: medium,
        height: 1.5,
        letterSpacing: 0,
      );

  // Body Styles
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: regular,
        height: 1.5,
        letterSpacing: 0,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: regular,
        height: 1.5,
        letterSpacing: 0,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: regular,
        height: 1.5,
        letterSpacing: 0,
      );

  // Label Styles
  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: medium,
        height: 1.4,
        letterSpacing: 0,
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: medium,
        height: 1.4,
        letterSpacing: 0,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: medium,
        height: 1.4,
        letterSpacing: 0,
      );

  // Caption Styles
  static TextStyle get caption => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: regular,
        height: 1.4,
        letterSpacing: 0,
      );

  // Button Styles
  static TextStyle get buttonLarge => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: semiBold,
        height: 1.2,
        letterSpacing: 0,
      );

  static TextStyle get buttonMedium => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: semiBold,
        height: 1.2,
        letterSpacing: 0,
      );

  static TextStyle get buttonSmall => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: semiBold,
        height: 1.2,
        letterSpacing: 0,
      );

  // Overline Styles
  static TextStyle get overline => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: medium,
        height: 1.2,
        letterSpacing: 1.5,
      );
}
