import 'dart:typed_data';
import 'package:bloomix/core/utils/result.dart';
import 'package:bloomix/features/identify/data/datasources/gemini_datasource.dart';
import 'package:bloomix/features/identify/domain/entities/plant_info.dart';
import 'package:bloomix/features/identify/domain/repositories/plant_repository.dart';

class PlantRepositoryImpl implements PlantRepository {
  PlantRepositoryImpl(this._datasource);

  final GeminiDatasource _datasource;

  @override
  Future<Result<PlantInfo>> identifyPlant(Uint8List imageBytes) async {
    try {
      final model = await _datasource.identifyPlant(imageBytes);
      final entity = model.toEntity();
      return Success(entity);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
