import 'dart:typed_data';
import 'package:bloomix/core/utils/result.dart';
import 'package:bloomix/features/identify/domain/entities/plant_info.dart';

abstract class PlantRepository {
  Future<Result<PlantInfo>> identifyPlant(Uint8List imageBytes);
}
