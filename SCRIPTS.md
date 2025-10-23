# 🚀 Scripts de Execução do Bloomix

Este projeto inclui scripts personalizados para executar o app Flutter com configurações seguras, carregando automaticamente as variáveis de ambiente do arquivo `config.json`.

## 📋 Pré-requisitos

1. **Arquivo de configuração**: Certifique-se de que o arquivo `config.json` existe

   ```bash
   cp config.example.json config.json
   ```

2. **Dependências**: Instale as dependências do projeto

   ```bash
   flutter pub get
   ```

## 🛠️ Como Usar

### Script Dart (Recomendado)

Use o script Dart que funciona em qualquer plataforma:

```bash
# Executar em modo debug (padrão)
dart run tool/run_app.dart
dart run tool/run_app.dart debug
dart run tool/run_app.dart dev

# Executar em modo profile
dart run tool/run_app.dart profile

# Executar em modo release
dart run tool/run_app.dart release

# Build APK
dart run tool/run_app.dart build-apk

# Build iOS
dart run tool/run_app.dart build-ios
```

### Script Bash (Alternativo)

Se preferir usar o script bash original:

```bash
# Executar em modo debug
bash run_with_config.sh debug

# Executar em modo profile
bash run_with_config.sh profile

# Executar em modo release
bash run_with_config.sh release

# Build APK
bash run_with_config.sh build-apk

# Build iOS
bash run_with_config.sh build-ios
```

## 🔧 Configuração

O script lê automaticamente as seguintes variáveis do arquivo `config.json`:

- `geminiApiKey` → `GEMINI_API_KEY`
- `testBannerAdUnitId` → `TEST_BANNER_AD_UNIT_ID`
- `testInterstitialAdUnitId` → `TEST_INTERSTITIAL_AD_UNIT_ID`
- `productionAndroidBannerAdUnitId` → `PRODUCTION_ANDROID_BANNER_AD_UNIT_ID`
- `productionAndroidInterstitialAdUnitId` → `PRODUCTION_ANDROID_INTERSTITIAL_AD_UNIT_ID`
- `productionIOSBannerAdUnitId` → `PRODUCTION_IOS_BANNER_AD_UNIT_ID`
- `productionIOSInterstitialAdUnitId` → `PRODUCTION_IOS_INTERSTITIAL_AD_UNIT_ID`

## 📱 Modos de Execução

| Modo | Descrição | Comando Flutter |
|------|-----------|-----------------|
| `debug`/`dev` | Modo de desenvolvimento com hot reload | `flutter run` |
| `profile` | Modo de perfil para análise de performance | `flutter run --profile` |
| `release` | Modo de produção | `flutter run --release` |
| `build-apk` | Build APK para Android | `flutter build apk --release` |
| `build-ios` | Build para iOS | `flutter build ios --release` |

## 🔒 Segurança

- ✅ As chaves sensíveis ficam no arquivo `config.json` (não versionado)
- ✅ O arquivo `config.json` está no `.gitignore`
- ✅ As variáveis são passadas via `--dart-define` para o Flutter
- ✅ Não há hardcoding de chaves no código

## 🐛 Troubleshooting

### Erro: "Arquivo config.json não encontrado"

```bash
cp config.example.json config.json
# Edite o config.json com suas chaves reais
```

### Erro: "Could not find package"

Certifique-se de estar no diretório raiz do projeto e execute:

```bash
flutter pub get
```

### Erro de permissão no script bash

```bash
chmod +x run_with_config.sh
```
