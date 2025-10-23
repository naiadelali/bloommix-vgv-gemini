import 'dart:convert';
import 'dart:typed_data';

import 'package:bloomix/core/config/app_config.dart';
import 'package:bloomix/features/identify/data/models/plant_info_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class GeminiDatasource {
  Future<PlantInfoModel> identifyPlant(Uint8List imageBytes);
}

class GeminiDatasourceImpl implements GeminiDatasource {
  GeminiDatasourceImpl(this._model);

  final GenerativeModel _model;

  @override
  Future<PlantInfoModel> identifyPlant(Uint8List imageBytes) async {
    try {
      final prompt = TextPart(AppConfig.geminiPrompt);
      final imagePart = DataPart('image/jpeg', imageBytes);

      final response = await _model.generateContent([
        Content.multi([prompt, imagePart]),
      ]);

      if (response.text == null) {
        throw Exception('No response from Gemini AI');
      }

      var jsonString = response.text!.trim();

      if (jsonString.startsWith('```json')) {
        jsonString = jsonString.substring(7);
      }
      if (jsonString.startsWith('```')) {
        jsonString = jsonString.substring(3);
      }
      if (jsonString.endsWith('```')) {
        jsonString = jsonString.substring(0, jsonString.length - 3);
      }
      jsonString = jsonString.trim();

      final jsonData = json.decode(jsonString) as Map<String, dynamic>;

      return PlantInfoModel.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to identify plant: $e');
    }
  }
}
