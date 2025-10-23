# 🔐 Configuração Segura - Bloomix

Este documento explica como configurar e usar o sistema de configuração segura do Bloomix.

## 📁 Arquivos de Configuração

### `config.json` (Não versionado - SENSÍVEL)

Contém suas chaves reais e deve ser mantido privado:

```json
{
  "geminiApiKey": "SUA_CHAVE_REAL_DO_GEMINI",
  "testBannerAdUnitId": "ca-app-pub-3940256099942544/6300978111",
  "testInterstitialAdUnitId": "ca-app-pub-3940256099942544/1033173712",
  "productionAndroidBannerAdUnitId": "ca-app-pub-XXXXXXXXXX/XXXXXXXXXX",
  "productionAndroidInterstitialAdUnitId": "ca-app-pub-XXXXXXXXXX/XXXXXXXXXX",
  "productionIOSBannerAdUnitId": "ca-app-pub-XXXXXXXXXX/XXXXXXXXXX",
  "productionIOSInterstitialAdUnitId": "ca-app-pub-XXXXXXXXXX/XXXXXXXXXX"
}
```

### `config.example.json` (Versionado - TEMPLATE)

Template para outros desenvolvedores copiarem e configurarem.

## 🚀 Como Executar o App

### Opção 1: Script Automatizado (Recomendado)

```bash
# Desenvolvimento
./run_with_config.sh

# Profile
./run_with_config.sh profile

# Release
./run_with_config.sh release

# Build APK
./run_with_config.sh build-apk

# Build iOS
./run_with_config.sh build-ios
```

### Opção 2: Comando Manual

```bash
# Desenvolvimento
flutter run --dart-define-from-file=config.json

# Build APK
flutter build apk --release --dart-define-from-file=config.json

# Build iOS
flutter build ios --release --dart-define-from-file=config.json
```

## 🔧 Configuração Inicial

1. **Copie o template:**

   ```bash
   cp config.example.json config.json
   ```

2. **Configure suas chaves no `config.json`**

3. **Execute o app:**

   ```bash
   ./run_with_config.sh
   ```

## 🛡️ Segurança

- ✅ `config.json` está no `.gitignore`
- ✅ Chaves não aparecem no código fonte
- ✅ Cada desenvolvedor tem seu próprio `config.json`
- ✅ Template disponível para novos desenvolvedores

## 📱 Variáveis de Ambiente

O sistema usa as seguintes variáveis:

| Variável | Descrição |
|----------|-----------|
| `GEMINI_API_KEY` | Chave da API do Gemini |
| `TEST_BANNER_AD_UNIT_ID` | ID de teste para Banner Ads |
| `TEST_INTERSTITIAL_AD_UNIT_ID` | ID de teste para Interstitial Ads |
| `PRODUCTION_ANDROID_BANNER_AD_UNIT_ID` | ID de produção Android Banner |
| `PRODUCTION_ANDROID_INTERSTITIAL_AD_UNIT_ID` | ID de produção Android Interstitial |
| `PRODUCTION_IOS_BANNER_AD_UNIT_ID` | ID de produção iOS Banner |
| `PRODUCTION_IOS_INTERSTITIAL_AD_UNIT_ID` | ID de produção iOS Interstitial |

## ⚠️ Importante

- **NUNCA** commite o arquivo `config.json`
- **SEMPRE** use o script `run_with_config.sh` para executar o app
- **MANTENHA** suas chaves seguras e privadas
