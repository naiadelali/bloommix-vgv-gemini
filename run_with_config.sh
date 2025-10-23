#!/bin/bash

# Script para executar o app Flutter com configurações seguras
# Este script lê o config.json e passa as variáveis para o dart-define

# Verifica se o arquivo config.json existe
if [ ! -f "config.json" ]; then
    echo "❌ Arquivo config.json não encontrado!"
    echo "📝 Copie o config.example.json para config.json e configure suas chaves:"
    echo "   cp config.example.json config.json"
    exit 1
fi

# Extrai as variáveis do JSON e executa o Flutter
echo "🚀 Executando Bloomix com configurações seguras..."

# Para desenvolvimento (debug)
if [ "$1" = "debug" ] || [ "$1" = "" ]; then
    echo "📱 Modo: Debug"
    flutter run \
        --dart-define=GEMINI_API_KEY="$(jq -r '.geminiApiKey' config.json)" \
        --dart-define=TEST_BANNER_AD_UNIT_ID="$(jq -r '.testBannerAdUnitId' config.json)" \
        --dart-define=TEST_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.testInterstitialAdUnitId' config.json)" \
        --dart-define=PRODUCTION_ANDROID_BANNER_AD_UNIT_ID="$(jq -r '.productionAndroidBannerAdUnitId' config.json)" \
        --dart-define=PRODUCTION_ANDROID_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.productionAndroidInterstitialAdUnitId' config.json)" \
        --dart-define=PRODUCTION_IOS_BANNER_AD_UNIT_ID="$(jq -r '.productionIOSBannerAdUnitId' config.json)" \
        --dart-define=PRODUCTION_IOS_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.productionIOSInterstitialAdUnitId' config.json)"
fi

# Para profile
if [ "$1" = "profile" ]; then
    echo "📱 Modo: Profile"
    flutter run --profile \
        --dart-define=GEMINI_API_KEY="$(jq -r '.geminiApiKey' config.json)" \
        --dart-define=TEST_BANNER_AD_UNIT_ID="$(jq -r '.testBannerAdUnitId' config.json)" \
        --dart-define=TEST_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.testInterstitialAdUnitId' config.json)" \
        --dart-define=PRODUCTION_ANDROID_BANNER_AD_UNIT_ID="$(jq -r '.productionAndroidBannerAdUnitId' config.json)" \
        --dart-define=PRODUCTION_ANDROID_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.productionAndroidInterstitialAdUnitId' config.json)" \
        --dart-define=PRODUCTION_IOS_BANNER_AD_UNIT_ID="$(jq -r '.productionIOSBannerAdUnitId' config.json)" \
        --dart-define=PRODUCTION_IOS_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.productionIOSInterstitialAdUnitId' config.json)"
fi

# Para release
if [ "$1" = "release" ]; then
    echo "📱 Modo: Release"
    flutter run --release \
        --dart-define=GEMINI_API_KEY="$(jq -r '.geminiApiKey' config.json)" \
        --dart-define=TEST_BANNER_AD_UNIT_ID="$(jq -r '.testBannerAdUnitId' config.json)" \
        --dart-define=TEST_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.testInterstitialAdUnitId' config.json)" \
        --dart-define=PRODUCTION_ANDROID_BANNER_AD_UNIT_ID="$(jq -r '.productionAndroidBannerAdUnitId' config.json)" \
        --dart-define=PRODUCTION_ANDROID_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.productionAndroidInterstitialAdUnitId' config.json)" \
        --dart-define=PRODUCTION_IOS_BANNER_AD_UNIT_ID="$(jq -r '.productionIOSBannerAdUnitId' config.json)" \
        --dart-define=PRODUCTION_IOS_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.productionIOSInterstitialAdUnitId' config.json)"
fi

# Para build APK
if [ "$1" = "build-apk" ]; then
    echo "📱 Build: APK"
    flutter build apk --release \
        --dart-define=GEMINI_API_KEY="$(jq -r '.geminiApiKey' config.json)" \
        --dart-define=TEST_BANNER_AD_UNIT_ID="$(jq -r '.testBannerAdUnitId' config.json)" \
        --dart-define=TEST_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.testInterstitialAdUnitId' config.json)" \
        --dart-define=PRODUCTION_ANDROID_BANNER_AD_UNIT_ID="$(jq -r '.productionAndroidBannerAdUnitId' config.json)" \
        --dart-define=PRODUCTION_ANDROID_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.productionAndroidInterstitialAdUnitId' config.json)" \
        --dart-define=PRODUCTION_IOS_BANNER_AD_UNIT_ID="$(jq -r '.productionIOSBannerAdUnitId' config.json)" \
        --dart-define=PRODUCTION_IOS_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.productionIOSInterstitialAdUnitId' config.json)"
fi

# Para build iOS
if [ "$1" = "build-ios" ]; then
    echo "📱 Build: iOS"
    flutter build ios --release \
        --dart-define=GEMINI_API_KEY="$(jq -r '.geminiApiKey' config.json)" \
        --dart-define=TEST_BANNER_AD_UNIT_ID="$(jq -r '.testBannerAdUnitId' config.json)" \
        --dart-define=TEST_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.testInterstitialAdUnitId' config.json)" \
        --dart-define=PRODUCTION_ANDROID_BANNER_AD_UNIT_ID="$(jq -r '.productionAndroidBannerAdUnitId' config.json)" \
        --dart-define=PRODUCTION_ANDROID_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.productionAndroidInterstitialAdUnitId' config.json)" \
        --dart-define=PRODUCTION_IOS_BANNER_AD_UNIT_ID="$(jq -r '.productionIOSBannerAdUnitId' config.json)" \
        --dart-define=PRODUCTION_IOS_INTERSTITIAL_AD_UNIT_ID="$(jq -r '.productionIOSInterstitialAdUnitId' config.json)"
fi
