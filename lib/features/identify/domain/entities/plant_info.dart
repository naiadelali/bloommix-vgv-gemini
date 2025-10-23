import 'package:equatable/equatable.dart';

class PlantInfo extends Equatable {
  const PlantInfo({
    required this.name,
    required this.scientificName,
    required this.confidence,
    required this.watering,
    required this.light,
    required this.tips,
    required this.identifiedAt,
    this.imagePath,
  });

  final String name;
  final String scientificName;
  final double confidence;
  final String watering;
  final String light;
  final String tips;
  final DateTime identifiedAt;
  final String? imagePath;

  @override
  List<Object?> get props => [
    name,
    scientificName,
    confidence,
    watering,
    light,
    tips,
    identifiedAt,
    imagePath,
  ];

  PlantInfo copyWith({
    String? name,
    String? scientificName,
    double? confidence,
    String? watering,
    String? light,
    String? tips,
    DateTime? identifiedAt,
    String? imagePath,
  }) {
    return PlantInfo(
      name: name ?? this.name,
      scientificName: scientificName ?? this.scientificName,
      confidence: confidence ?? this.confidence,
      watering: watering ?? this.watering,
      light: light ?? this.light,
      tips: tips ?? this.tips,
      identifiedAt: identifiedAt ?? this.identifiedAt,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
