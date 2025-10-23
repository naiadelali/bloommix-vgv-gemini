import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import '../tokens/sizing.dart';
import '../tokens/spacing.dart';
import 'buttons.dart';

/// Componente de Card do Bloomix Design System
class BloomixCard extends StatelessWidget {
  const BloomixCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation = BloomixCardElevation.medium,
    this.variant = BloomixCardVariant.defaultCard,
    this.onTap,
    this.borderRadius,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BloomixCardElevation elevation;
  final BloomixCardVariant variant;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final cardWidget = Container(
      margin: margin ?? EdgeInsets.all(BloomixSpacing.none),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius:
            borderRadius ?? BorderRadius.circular(BloomixSizing.radiusLg),
        border: _getBorder(),
        boxShadow: _getBoxShadow(),
      ),
      child: ClipRRect(
        borderRadius:
            borderRadius ?? BorderRadius.circular(BloomixSizing.radiusLg),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius:
                borderRadius ?? BorderRadius.circular(BloomixSizing.radiusLg),
            child: Padding(
              padding: padding ?? EdgeInsets.all(BloomixSpacing.xl),
              child: child,
            ),
          ),
        ),
      ),
    );

    return cardWidget;
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case BloomixCardVariant.defaultCard:
        return BloomixColors.surface;
      case BloomixCardVariant.outlined:
        return BloomixColors.surface;
      case BloomixCardVariant.elevated:
        return BloomixColors.surface;
      case BloomixCardVariant.filled:
        return BloomixColors.neutral50;
    }
  }

  Border? _getBorder() {
    switch (variant) {
      case BloomixCardVariant.defaultCard:
        return null;
      case BloomixCardVariant.outlined:
        return Border.all(
          color: BloomixColors.border,
          width: BloomixSizing.borderSm,
        );
      case BloomixCardVariant.elevated:
        return null;
      case BloomixCardVariant.filled:
        return null;
    }
  }

  List<BoxShadow> _getBoxShadow() {
    switch (elevation) {
      case BloomixCardElevation.none:
        return [];
      case BloomixCardElevation.small:
        return [
          BoxShadow(
            color: BloomixColors.neutral900.withValues(alpha: 0.05),
            blurRadius: BloomixSizing.elevationSm,
            offset: const Offset(0, 2),
          ),
        ];
      case BloomixCardElevation.medium:
        return [
          BoxShadow(
            color: BloomixColors.neutral900.withValues(alpha: 0.08),
            blurRadius: BloomixSizing.elevationMd,
            offset: const Offset(0, 4),
          ),
        ];
      case BloomixCardElevation.large:
        return [
          BoxShadow(
            color: BloomixColors.neutral900.withValues(alpha: 0.12),
            blurRadius: BloomixSizing.elevationLg,
            offset: const Offset(0, 8),
          ),
        ];
    }
  }
}

/// Card de Plant Info específico para o Bloomix
class BloomixPlantCard extends StatelessWidget {
  const BloomixPlantCard({
    super.key,
    required this.plantName,
    required this.scientificName,
    required this.confidence,
    required this.identifiedAt,
    this.onTap,
    this.icon = Icons.local_florist,
  });

  final String plantName;
  final String scientificName;
  final double confidence;
  final DateTime identifiedAt;
  final VoidCallback? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return BloomixCard(
      onTap: onTap,
      elevation: BloomixCardElevation.medium,
      child: Row(
        children: [
          // Icon container
          Container(
            width: BloomixSizing.avatarMd,
            height: BloomixSizing.avatarMd,
            decoration: BoxDecoration(
              color: BloomixColors.primary50,
              borderRadius: BorderRadius.circular(BloomixSizing.radiusLg),
            ),
            child: Icon(
              icon,
              color: BloomixColors.primary500,
              size: BloomixSizing.iconLg,
            ),
          ),

          SizedBox(width: BloomixSpacing.xl),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plantName,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: BloomixColors.textPrimary,
                  ),
                ),
                SizedBox(height: BloomixSpacing.xs),
                Text(
                  scientificName,
                  style: const TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: BloomixColors.textSecondary,
                  ),
                ),
                SizedBox(height: BloomixSpacing.sm),
                Text(
                  _formatDate(identifiedAt),
                  style: const TextStyle(
                    fontSize: 12,
                    color: BloomixColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),

          // Confidence badge
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: BloomixSpacing.md,
              vertical: BloomixSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: BloomixColors.primary50,
              borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
            ),
            child: Text(
              '${(confidence * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: BloomixColors.primary500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year} ${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }
}

/// Card de resultado de identificação
class BloomixResultCard extends StatelessWidget {
  const BloomixResultCard({
    super.key,
    required this.plantName,
    required this.scientificName,
    required this.confidence,
    required this.watering,
    required this.light,
    required this.tips,
    this.onSave,
    this.onShare,
  });

  final String plantName;
  final String scientificName;
  final double confidence;
  final String watering;
  final String light;
  final String tips;
  final VoidCallback? onSave;
  final VoidCallback? onShare;

  @override
  Widget build(BuildContext context) {
    return BloomixCard(
      elevation: BloomixCardElevation.large,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: BloomixSizing.avatarLg,
                height: BloomixSizing.avatarLg,
                decoration: BoxDecoration(
                  color: BloomixColors.primary100,
                  borderRadius: BorderRadius.circular(BloomixSizing.radiusXl),
                ),
                child: Icon(
                  Icons.local_florist,
                  color: BloomixColors.primary600,
                  size: BloomixSizing.iconXl,
                ),
              ),
              SizedBox(width: BloomixSpacing.xl),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plantName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: BloomixColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: BloomixSpacing.xs),
                    Text(
                      scientificName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: BloomixColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: BloomixSpacing.md,
                  vertical: BloomixSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: BloomixColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
                ),
                child: Text(
                  '${(confidence * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: BloomixColors.success,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: BloomixSpacing.xl),

          // Care instructions
          _buildCareSection('💧 Regagem', watering),
          SizedBox(height: BloomixSpacing.lg),
          _buildCareSection('☀️ Luz', light),
          SizedBox(height: BloomixSpacing.lg),
          _buildCareSection('💡 Dicas', tips),

          SizedBox(height: BloomixSpacing.xl),

          // Action buttons
          Row(
            children: [
              Expanded(
                child: BloomixButton(
                  text: 'Salvar',
                  onPressed: onSave,
                  variant: BloomixButtonVariant.outline,
                  size: BloomixButtonSize.medium,
                  icon: Icons.bookmark_outline,
                ),
              ),
              SizedBox(width: BloomixSpacing.md),
              Expanded(
                child: BloomixButton(
                  text: 'Compartilhar',
                  onPressed: onShare,
                  variant: BloomixButtonVariant.primary,
                  size: BloomixButtonSize.medium,
                  icon: Icons.share,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCareSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: BloomixColors.textPrimary,
          ),
        ),
        SizedBox(height: BloomixSpacing.xs),
        Text(
          content,
          style: const TextStyle(
            fontSize: 14,
            color: BloomixColors.textSecondary,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

/// Variantes de card
enum BloomixCardVariant {
  defaultCard,
  outlined,
  elevated,
  filled,
}

/// Elevações de card
enum BloomixCardElevation {
  none,
  small,
  medium,
  large,
}
