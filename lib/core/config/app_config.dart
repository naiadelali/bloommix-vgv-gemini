import 'dart:io';

import 'package:flutter/foundation.dart';

class AppConfig {
  // Chaves protegidas usando dart-define
  static String get geminiApiKey =>
      const String.fromEnvironment('GEMINI_API_KEY',
          defaultValue: 'SUA_CHAVE_DO_GEMINI_AQUI');

  // IDs de teste do AdMob (protegidos)
  static String get _testBannerAdUnitId =>
      const String.fromEnvironment('TEST_BANNER_AD_UNIT_ID',
          defaultValue: 'ca-app-pub-3940256099942544/6300978111');

  static String get _testInterstitialAdUnitId =>
      const String.fromEnvironment('TEST_INTERSTITIAL_AD_UNIT_ID',
          defaultValue: 'ca-app-pub-3940256099942544/1033173712');

  // IDs de produção do Android
  static String get _productionAndroidBannerAdUnitId =>
      const String.fromEnvironment('PRODUCTION_ANDROID_BANNER_AD_UNIT_ID',
          defaultValue: 'ca-app-pub-XXXXXXXXXX/XXXXXXXXXX');

  static String get _productionAndroidInterstitialAdUnitId =>
      const String.fromEnvironment('PRODUCTION_ANDROID_INTERSTITIAL_AD_UNIT_ID',
          defaultValue: 'ca-app-pub-XXXXXXXXXX/XXXXXXXXXX');

  // IDs de produção do iOS
  static String get _productionIOSBannerAdUnitId =>
      const String.fromEnvironment('PRODUCTION_IOS_BANNER_AD_UNIT_ID',
          defaultValue: 'ca-app-pub-7949545254906540/2845763604');

  static String get _productionIOSInterstitialAdUnitId =>
      const String.fromEnvironment('PRODUCTION_IOS_INTERSTITIAL_AD_UNIT_ID',
          defaultValue: 'ca-app-pub-7949545254906540/6334416626');

  // IDs dos anúncios baseados na plataforma
  static String get bannerAdUnitId {
    if (kDebugMode) {
      return _testBannerAdUnitId; // Usa IDs de teste em desenvolvimento
    }

    if (Platform.isAndroid) {
      return _productionAndroidBannerAdUnitId;
    } else if (Platform.isIOS) {
      return _productionIOSBannerAdUnitId;
    }
    return _testBannerAdUnitId;
  }

  static String get interstitialAdUnitId {
    if (kDebugMode) {
      return _testInterstitialAdUnitId; // Usa IDs de teste em desenvolvimento
    }

    if (Platform.isAndroid) {
      return _productionAndroidInterstitialAdUnitId;
    } else if (Platform.isIOS) {
      return _productionIOSInterstitialAdUnitId;
    }
    return _testInterstitialAdUnitId;
  }

  static const int interstitialAdFrequency = 5;

  static const String geminiPrompt = '''
You are a botanist AI. Identify the plant from the image and return ONLY valid JSON following this schema:
{
  "name": "string",
  "scientificName": "string",
  "confidence": 0.0,
  "watering": "string",
  "light": "string",
  "tips": "string"
}
Respond in Portuguese (Brazil).
''';
}
