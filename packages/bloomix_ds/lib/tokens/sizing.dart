/// Tokens de Sizing do Bloomix Design System
class BloomixSizing {
  BloomixSizing._();

  // Base sizing unit (4px)
  static const double _baseUnit = 4.0;

  // Icon sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 20.0;
  static const double iconLg = 24.0;
  static const double iconXl = 28.0;
  static const double iconXxl = 32.0;
  static const double iconXxxl = 40.0;
  static const double iconHuge = 48.0;

  // Avatar sizes
  static const double avatarXs = 24.0;
  static const double avatarSm = 32.0;
  static const double avatarMd = 40.0;
  static const double avatarLg = 48.0;
  static const double avatarXl = 56.0;
  static const double avatarXxl = 64.0;
  static const double avatarXxxl = 80.0;
  static const double avatarHuge = 96.0;

  // Button heights
  static const double buttonXs = 28.0;
  static const double buttonSm = 32.0;
  static const double buttonMd = 40.0;
  static const double buttonLg = 48.0;
  static const double buttonXl = 56.0;

  // Input heights
  static const double inputSm = 36.0;
  static const double inputMd = 44.0;
  static const double inputLg = 52.0;

  // Border radius
  static const double radiusXs = 2.0;
  static const double radiusSm = 4.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 12.0;
  static const double radiusXl = 16.0;
  static const double radiusXxl = 20.0;
  static const double radiusXxxl = 24.0;
  static const double radiusHuge = 32.0;
  static const double radiusRound = 999.0;

  // Border width
  static const double borderXs = 0.5;
  static const double borderSm = 1.0;
  static const double borderMd = 1.5;
  static const double borderLg = 2.0;
  static const double borderXl = 3.0;

  // Elevation (shadows)
  static const double elevationXs = 1.0;
  static const double elevationSm = 2.0;
  static const double elevationMd = 4.0;
  static const double elevationLg = 8.0;
  static const double elevationXl = 12.0;
  static const double elevationXxl = 16.0;
  static const double elevationXxxl = 24.0;

  // Custom sizing methods
  static double custom(double multiplier) => _baseUnit * multiplier;
}
