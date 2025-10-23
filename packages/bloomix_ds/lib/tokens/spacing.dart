/// Tokens de Spacing do Bloomix Design System
class BloomixSpacing {
  BloomixSpacing._();

  // Base spacing unit (8px)
  static const double _baseUnit = 8.0;

  // Micro spacing (2px, 4px)
  static const double xs = 2.0;
  static const double sm = 4.0;

  // Small spacing (8px, 12px, 16px)
  static const double md = _baseUnit; // 8px
  static const double lg = 12.0;
  static const double xl = 16.0;

  // Medium spacing (20px, 24px, 32px)
  static const double xxl = 20.0;
  static const double xxxl = 24.0;
  static const double huge = 32.0;

  // Large spacing (40px, 48px, 64px)
  static const double massive = 40.0;
  static const double enormous = 48.0;
  static const double gigantic = 64.0;

  // Extra large spacing (80px, 96px)
  static const double colossal = 80.0;
  static const double titanic = 96.0;

  // Zero spacing
  static const double none = 0.0;

  // Custom spacing methods
  static double custom(double multiplier) => _baseUnit * multiplier;
}
