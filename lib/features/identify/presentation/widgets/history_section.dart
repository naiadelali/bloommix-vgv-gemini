import 'package:bloomix/features/identify/domain/entities/plant_info.dart';
import 'package:bloomix_ds/bloomix_ds.dart';
import 'package:flutter/material.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({required this.plants, super.key});

  final List<PlantInfo> plants;

  @override
  Widget build(BuildContext context) {
    if (plants.isEmpty) {
      return _buildEmptyState();
    }

    return Column(
      children: plants.map((plant) => _buildHistoryCard(plant)).toList(),
    );
  }

  Widget _buildHistoryCard(PlantInfo plant) {
    return Padding(
      padding: EdgeInsets.only(bottom: BloomixSpacing.xl),
      child: BloomixPlantCard(
        plantName: plant.name,
        scientificName: plant.scientificName,
        confidence: plant.confidence,
        identifiedAt: plant.identifiedAt,
        onTap: () {
          // TODO: Navegar para detalhes da planta
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: EdgeInsets.all(BloomixSpacing.huge),
      child: Column(
        children: [
          Icon(
            Icons.history,
            size: BloomixSizing.iconHuge,
            color: BloomixColors.neutral400,
          ),
          SizedBox(height: BloomixSpacing.xl),
          Text(
            'Nenhuma planta identificada ainda',
            style: BloomixTypography.titleMedium.copyWith(
              color: BloomixColors.textSecondary,
            ),
          ),
          SizedBox(height: BloomixSpacing.sm),
          Text(
            'Use a câmera para identificar sua primeira planta!',
            style: BloomixTypography.bodyMedium.copyWith(
              color: BloomixColors.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
