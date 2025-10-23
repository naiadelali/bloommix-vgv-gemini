import 'dart:convert';
import 'dart:typed_data';

import 'package:bloomix/core/utils/result.dart';
import 'package:bloomix/features/identify/data/models/plant_info_model.dart';
import 'package:bloomix/features/identify/domain/entities/plant_info.dart';
import 'package:bloomix/features/identify/domain/usecases/identify_plant_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'identify_state.dart';

class IdentifyCubit extends Cubit<IdentifyState> {
  IdentifyCubit(this._identifyPlantUsecase) : super(const IdentifyInitial()) {
    _loadHistory();
  }

  final IdentifyPlantUsecase _identifyPlantUsecase;
  int _identificationCount = 0;

  Future<void> _loadHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyJson = prefs.getString('plant_history');

      if (historyJson != null) {
        final decoded = json.decode(historyJson) as List<dynamic>;
        final history = decoded
            .map(
              (e) =>
                  PlantInfoModel.fromJson(e as Map<String, dynamic>).toEntity(),
            )
            .toList();

        emit(IdentifyInitial(history: history));
      }
    } catch (e) {
      // Ignore loading errors
    }
  }

  Future<void> _saveHistory(List<PlantInfo> history) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyJson = json.encode(
        history.map((e) => PlantInfoModel.fromEntity(e).toJson()).toList(),
      );
      await prefs.setString('plant_history', historyJson);
    } catch (e) {
      // Ignore saving errors
    }
  }

  Future<void> identifyPlant(Uint8List imageBytes, String? imagePath) async {
    emit(const IdentifyLoading());

    final result = await _identifyPlantUsecase(imageBytes);

    if (result is Success<PlantInfo>) {
      final plantInfo = result.data.copyWith(imagePath: imagePath);

      _identificationCount++;

      final updatedHistory = [
        plantInfo,
        ...state.history.where((p) => p.name != plantInfo.name).take(2),
      ];

      await _saveHistory(updatedHistory);

      emit(
        IdentifySuccess(
          plantInfo: plantInfo,
          history: updatedHistory,
          shouldShowAd: _identificationCount % 5 == 0,
        ),
      );
    } else if (result is Failure<PlantInfo>) {
      emit(
        IdentifyError(
          message: result.message,
          history: state.history,
        ),
      );
    }
  }

  void reset() {
    emit(IdentifyInitial(history: state.history));
  }
}
