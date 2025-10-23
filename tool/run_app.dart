#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

/// Script para executar o app Flutter com configurações seguras
/// Este script lê o config.json e passa as variáveis para o dart-define
///
/// Uso:
///   dart run tool/run_app.dart [debug|profile|release|build-apk|build-ios]
///   dart run tool/run_app.dart dev     # alias para debug
///   dart run tool/run_app.dart        # padrão é debug

void main(List<String> arguments) async {
  // Verifica se o usuário pediu ajuda
  if (arguments.contains('--help') || arguments.contains('-h')) {
    _showHelp();
    return;
  }

  final mode = arguments.isNotEmpty ? arguments.first : 'debug';

  // Verifica se o arquivo config.json existe
  final configFile = File('config.json');
  if (!configFile.existsSync()) {
    print('❌ Arquivo config.json não encontrado!');
    print(
      '📝 Copie o config.example.json para config.json e configure suas chaves:',
    );
    print('   cp config.example.json config.json');
    exit(1);
  }

  // Lê o arquivo de configuração
  final configContent = await configFile.readAsString();
  final config = jsonDecode(configContent) as Map<String, dynamic>;

  // Extrai as variáveis do JSON
  final dartDefines = [
    'GEMINI_API_KEY=${config['geminiApiKey']}',
    'TEST_BANNER_AD_UNIT_ID=${config['testBannerAdUnitId']}',
    'TEST_INTERSTITIAL_AD_UNIT_ID=${config['testInterstitialAdUnitId']}',
    'PRODUCTION_ANDROID_BANNER_AD_UNIT_ID=${config['productionAndroidBannerAdUnitId']}',
    'PRODUCTION_ANDROID_INTERSTITIAL_AD_UNIT_ID=${config['productionAndroidInterstitialAdUnitId']}',
    'PRODUCTION_IOS_BANNER_AD_UNIT_ID=${config['productionIOSBannerAdUnitId']}',
    'PRODUCTION_IOS_INTERSTITIAL_AD_UNIT_ID=${config['productionIOSInterstitialAdUnitId']}',
  ];

  // Constrói o comando Flutter
  final flutterArgs = <String>[];

  switch (mode) {
    case 'debug':
    case 'dev':
      print('📱 Modo: Debug');
      flutterArgs.addAll(['run']);
    case 'profile':
      print('📱 Modo: Profile');
      flutterArgs.addAll(['run', '--profile']);
    case 'release':
      print('📱 Modo: Release');
      flutterArgs.addAll(['run', '--release']);
    case 'build-apk':
      print('📱 Build: APK');
      flutterArgs.addAll(['build', 'apk', '--release']);
    case 'build-ios':
      print('📱 Build: iOS');
      flutterArgs.addAll(['build', 'ios', '--release']);
    default:
      print('❌ Modo inválido: $mode');
      print(
        'Modos disponíveis: debug, dev, profile, release, build-apk, build-ios',
      );
      exit(1);
  }

  // Adiciona as definições Dart
  for (final define in dartDefines) {
    flutterArgs.add('--dart-define=$define');
  }

  print('🚀 Executando Bloomix com configurações seguras...');
  print('Comando: flutter ${flutterArgs.join(' ')}');

  // Executa o comando Flutter
  final process = await Process.start('flutter', flutterArgs);

  // Redireciona stdout e stderr
  process.stdout.listen((data) => stdout.add(data));
  process.stderr.listen((data) => stderr.add(data));

  final exitCode = await process.exitCode;
  exit(exitCode);
}

void _showHelp() {
  print('''
🚀 Script de Execução do Bloomix

Este script executa o app Flutter com configurações seguras carregadas do config.json.

USO:
  dart run tool/run_app.dart [MODO]

MODOS DISPONÍVEIS:
  debug, dev    Executar em modo debug (padrão)
  profile       Executar em modo profile
  release       Executar em modo release
  build-apk     Build APK para Android
  build-ios     Build para iOS

EXEMPLOS:
  dart run tool/run_app.dart              # debug (padrão)
  dart run tool/run_app.dart dev          # debug
  dart run tool/run_app.dart profile      # profile
  dart run tool/run_app.dart build-apk    # build APK

PRÉ-REQUISITOS:
  - Arquivo config.json deve existir
  - Execute: cp config.example.json config.json
  - Configure suas chaves no config.json

OPÇÕES:
  --help, -h    Mostra esta ajuda
''');
}
