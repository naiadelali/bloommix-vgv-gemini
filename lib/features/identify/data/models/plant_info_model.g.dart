part of 'plant_info_model.dart';

PlantInfoModel _$PlantInfoModelFromJson(Map<String, dynamic> json) {
  return PlantInfoModel(
    name: json['name'] as String,
    scientificName: json['scientificName'] as String,
    confidence: (json['confidence'] as num).toDouble(),
    watering: json['watering'] as String,
    light: json['light'] as String,
    tips: json['tips'] as String,
    identifiedAt: json['identifiedAt'] as String?,
    imagePath: json['imagePath'] as String?,
  );
}

Map<String, dynamic> _$PlantInfoModelToJson(PlantInfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'scientificName': instance.scientificName,
      'confidence': instance.confidence,
      'watering': instance.watering,
      'light': instance.light,
      'tips': instance.tips,
      'identifiedAt': instance.identifiedAt,
      'imagePath': instance.imagePath,
    };
