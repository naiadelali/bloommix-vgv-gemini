import 'dart:typed_data';
import 'package:bloomix/core/utils/result.dart';
import 'package:bloomix/features/identify/domain/entities/plant_info.dart';
import 'package:bloomix/features/identify/domain/repositories/plant_repository.dart';

class IdentifyPlantUsecase {
  IdentifyPlantUsecase(this._repository);

  final PlantRepository _repository;

  Future<Result<PlantInfo>> call(Uint8List imageBytes) async {
    return _repository.identifyPlant(imageBytes);
  }
}
