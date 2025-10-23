import 'package:json_annotation/json_annotation.dart';
import 'package:bloomix/features/identify/domain/entities/plant_info.dart';

part 'plant_info_model.g.dart';

@JsonSerializable()
class PlantInfoModel {
  const PlantInfoModel({
    required this.name,
    required this.scientificName,
    required this.confidence,
    required this.watering,
    required this.light,
    required this.tips,
    this.identifiedAt,
    this.imagePath,
  });

  final String name;
  final String scientificName;
  final double confidence;
  final String watering;
  final String light;
  final String tips;
  final String? identifiedAt;
  final String? imagePath;

  factory PlantInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PlantInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlantInfoModelToJson(this);

  PlantInfo toEntity() {
    return PlantInfo(
      name: name,
      scientificName: scientificName,
      confidence: confidence,
      watering: watering,
      light: light,
      tips: tips,
      identifiedAt: identifiedAt != null 
          ? DateTime.parse(identifiedAt!)
          : DateTime.now(),
      imagePath: imagePath,
    );
  }

  factory PlantInfoModel.fromEntity(PlantInfo entity) {
    return PlantInfoModel(
      name: entity.name,
      scientificName: entity.scientificName,
      confidence: entity.confidence,
      watering: entity.watering,
      light: entity.light,
      tips: entity.tips,
      identifiedAt: entity.identifiedAt.toIso8601String(),
      imagePath: entity.imagePath,
    );
  }
}
