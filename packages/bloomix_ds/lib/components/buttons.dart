import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/sizing.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Componente de Botão Primário do Bloomix Design System
class BloomixButton extends StatelessWidget {
  const BloomixButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = BloomixButtonVariant.primary,
    this.size = BloomixButtonSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.fullWidth = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final BloomixButtonVariant variant;
  final BloomixButtonSize size;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = isDisabled || onPressed == null;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: isLoading || isButtonDisabled ? null : onPressed,
        style: _getButtonStyle(variant, isButtonDisabled),
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (isLoading) {
      return SizedBox(
        height: _getIconSize(),
        width: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            _getTextColor(),
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: _getIconSize(), color: _getTextColor()),
          SizedBox(width: BloomixSpacing.sm),
          Text(text, style: _getTextStyle()),
        ],
      );
    }

    return Text(text, style: _getTextStyle());
  }

  double _getHeight() {
    switch (size) {
      case BloomixButtonSize.small:
        return BloomixSizing.buttonSm;
      case BloomixButtonSize.medium:
        return BloomixSizing.buttonMd;
      case BloomixButtonSize.large:
        return BloomixSizing.buttonLg;
    }
  }

  double _getIconSize() {
    switch (size) {
      case BloomixButtonSize.small:
        return BloomixSizing.iconSm;
      case BloomixButtonSize.medium:
        return BloomixSizing.iconMd;
      case BloomixButtonSize.large:
        return BloomixSizing.iconLg;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case BloomixButtonSize.small:
        return BloomixTypography.buttonSmall.copyWith(color: _getTextColor());
      case BloomixButtonSize.medium:
        return BloomixTypography.buttonMedium.copyWith(color: _getTextColor());
      case BloomixButtonSize.large:
        return BloomixTypography.buttonLarge.copyWith(color: _getTextColor());
    }
  }

  Color _getTextColor() {
    if (variant == BloomixButtonVariant.primary) {
      return BloomixColors.textOnPrimary;
    }
    return BloomixColors.primary500;
  }

  ButtonStyle _getButtonStyle(BloomixButtonVariant variant, bool isDisabled) {
    switch (variant) {
      case BloomixButtonVariant.primary:
        return _getPrimaryStyle(isDisabled);
      case BloomixButtonVariant.secondary:
        return _getSecondaryStyle(isDisabled);
      case BloomixButtonVariant.outline:
        return _getOutlineStyle(isDisabled);
      case BloomixButtonVariant.ghost:
        return _getGhostStyle(isDisabled);
    }
  }

  ButtonStyle _getPrimaryStyle(bool isDisabled) {
    return ElevatedButton.styleFrom(
      backgroundColor:
          isDisabled ? BloomixColors.neutral300 : BloomixColors.primary500,
      foregroundColor:
          isDisabled ? BloomixColors.neutral500 : BloomixColors.textOnPrimary,
      elevation: isDisabled ? 0 : BloomixSizing.elevationSm,
      shadowColor: BloomixColors.primary500.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: BloomixSpacing.xl,
        vertical: BloomixSpacing.md,
      ),
    );
  }

  ButtonStyle _getSecondaryStyle(bool isDisabled) {
    return ElevatedButton.styleFrom(
      backgroundColor:
          isDisabled ? BloomixColors.neutral200 : BloomixColors.secondary500,
      foregroundColor:
          isDisabled ? BloomixColors.neutral500 : BloomixColors.textOnSecondary,
      elevation: isDisabled ? 0 : BloomixSizing.elevationSm,
      shadowColor: BloomixColors.secondary500.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: BloomixSpacing.xl,
        vertical: BloomixSpacing.md,
      ),
    );
  }

  ButtonStyle _getOutlineStyle(bool isDisabled) {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor:
          isDisabled ? BloomixColors.neutral400 : BloomixColors.primary500,
      elevation: 0,
      side: BorderSide(
        color: isDisabled ? BloomixColors.neutral300 : BloomixColors.primary500,
        width: BloomixSizing.borderSm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: BloomixSpacing.xl,
        vertical: BloomixSpacing.md,
      ),
    );
  }

  ButtonStyle _getGhostStyle(bool isDisabled) {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor:
          isDisabled ? BloomixColors.neutral400 : BloomixColors.primary500,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: BloomixSpacing.xl,
        vertical: BloomixSpacing.md,
      ),
    );
  }
}

/// Variantes de botão
enum BloomixButtonVariant {
  primary,
  secondary,
  outline,
  ghost,
}

/// Tamanhos de botão
enum BloomixButtonSize {
  small,
  medium,
  large,
}

/// Botão de Ação Flutuante (FAB)
class BloomixFab extends StatelessWidget {
  const BloomixFab({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.size = BloomixFabSize.medium,
    this.variant = BloomixFabVariant.primary,
    this.isExtended = false,
    this.label,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final BloomixFabSize size;
  final BloomixFabVariant variant;
  final bool isExtended;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;

    if (isExtended && label != null) {
      return FloatingActionButton.extended(
        onPressed: isDisabled ? null : onPressed,
        backgroundColor: _getBackgroundColor(isDisabled),
        foregroundColor: _getForegroundColor(isDisabled),
        elevation: BloomixSizing.elevationMd,
        icon: Icon(icon, size: _getIconSize()),
        label: Text(label!, style: BloomixTypography.buttonMedium),
      );
    }

    return FloatingActionButton(
      onPressed: isDisabled ? null : onPressed,
      backgroundColor: _getBackgroundColor(isDisabled),
      foregroundColor: _getForegroundColor(isDisabled),
      elevation: BloomixSizing.elevationMd,
      child: Icon(icon, size: _getIconSize()),
    );
  }

  double _getIconSize() {
    switch (size) {
      case BloomixFabSize.small:
        return BloomixSizing.iconMd;
      case BloomixFabSize.medium:
        return BloomixSizing.iconLg;
      case BloomixFabSize.large:
        return BloomixSizing.iconXl;
    }
  }

  Color _getBackgroundColor(bool isDisabled) {
    if (isDisabled) return BloomixColors.neutral300;

    switch (variant) {
      case BloomixFabVariant.primary:
        return BloomixColors.primary500;
      case BloomixFabVariant.secondary:
        return BloomixColors.secondary500;
    }
  }

  Color _getForegroundColor(bool isDisabled) {
    if (isDisabled) return BloomixColors.neutral500;
    return BloomixColors.textOnPrimary;
  }
}

/// Variantes de FAB
enum BloomixFabVariant {
  primary,
  secondary,
}

/// Tamanhos de FAB
enum BloomixFabSize {
  small,
  medium,
  large,
}
