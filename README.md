# 🌱 Bloomix - AI Plant Identification App

**Desenvolvido por Lalli Bloom**

[![Very Good Ventures][very_good_ventures_badge]][very_good_ventures_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Flutter][flutter_badge]][flutter_link]

<div align="center">
  <img src="assets/icons/bloomix_icon.png" width="120" alt="Bloomix Logo" />
  <p><strong>Your AI-powered plant identification companion</strong></p>
</div>

## 🚀 Overview

Bloomix is a cutting-edge Flutter application that leverages Google's Gemini AI to identify plants from photos. Built with Very Good Ventures architecture principles, it provides a professional, scalable, and maintainable codebase perfect for showcasing advanced Flutter development skills.

## 📱 App Demo

<div align="center">
  <video width="300" controls>
    <source src="video/Bloommix.mp4" type="video/mp4">
    Seu navegador não suporta o elemento de vídeo.
  </video>
  <p><em>Demonstração do Bloomix em funcionamento</em></p>
</div>

### ✨ Key Features

- 🤖 **AI-Powered Plant Identification** using Google Gemini API
- 📱 **Cross-Platform Support** (iOS, Android)
- 🌍 **Multi-Language Support** (Portuguese, English, Spanish, French)
- 🎨 **Modern Design System** with custom components
- 📊 **Plant History Tracking** with confidence scores
- 🔒 **Secure Configuration** with environment variables
- 📈 **Google Mobile Ads Integration**
- 🧪 **Comprehensive Testing** (Unit, Widget, Integration)

## 🏗️ Architecture

This project follows **Very Good Ventures** architecture patterns:

```
lib/
├── app/                    # App configuration
│   ├── app.dart           # Main app export
│   └── view/
│       └── app.dart       # MaterialApp setup
├── features/              # Feature modules
│   └── identify/          # Plant identification feature
│       ├── data/          # Data layer
│       ├── domain/        # Domain layer
│       └── presentation/  # Presentation layer
├── core/                  # Core utilities
│   ├── config/           # App configuration
│   ├── di/               # Dependency injection
│   └── utils/            # Utilities
├── l10n/                 # Internationalization
└── main_[env].dart       # Environment-specific entry points
```

### 🧩 Design Patterns Used

- **Clean Architecture** with clear separation of concerns
- **BLoC Pattern** for state management
- **Repository Pattern** for data abstraction
- **Dependency Injection** with GetIt
- **Feature-based Architecture** for scalability

## 🛠️ Tech Stack

### Core Technologies

- **Flutter** 3.35.x
- **Dart** 3.9.x
- **BLoC** for state management
- **GetIt** for dependency injection

### AI & APIs

- **Google Gemini API** for plant identification
- **Google Mobile Ads** for monetization

### Development Tools

- **Very Good CLI** for project scaffolding
- **Very Good Analysis** for linting
- **Mocktail** for testing
- **BlocTest** for BLoC testing

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.35.x or higher)
- Dart SDK (3.9.x or higher)
- iOS/Android development environment
- Google Gemini API key

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/bloomix.git
   cd bloomix
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure environment variables**

   ```bash
   cp config.example.json config.json
   # Edit config.json with your API keys
   ```

4. **Run the app**

   ```bash
   ./run_with_config.sh debug
   ```

### Environment Configuration

Create a `config.json` file with your API keys:

```json
{
  "geminiApiKey": "your_gemini_api_key",
  "testBannerAdUnitId": "ca-app-pub-3940256099942544/6300978111",
  "testInterstitialAdUnitId": "ca-app-pub-3940256099942544/1033173712",
  "productionAndroidBannerAdUnitId": "your_android_banner_id",
  "productionAndroidInterstitialAdUnitId": "your_android_interstitial_id",
  "productionIOSBannerAdUnitId": "your_ios_banner_id",
  "productionIOSInterstitialAdUnitId": "your_ios_interstitial_id"
}
```

## 🧪 Testing

The project includes comprehensive testing:

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test files
flutter test test/features/identify/cubit/identify_cubit_test.dart
```

### Test Structure

- **Unit Tests** for business logic
- **Widget Tests** for UI components
- **Integration Tests** for end-to-end flows
- **BLoC Tests** for state management

## 📱 Build & Deploy

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

### Environment-specific builds

```bash
# Development
flutter run --dart-define-from-file=config.json

# Staging
flutter run -t lib/main_staging.dart --dart-define-from-file=config.json

# Production
flutter run -t lib/main_production.dart --dart-define-from-file=config.json
```

## 🎨 Design System

Bloomix includes a comprehensive design system (`bloomix_ds` package):

- **Typography** with consistent font scales
- **Colors** with semantic naming
- **Spacing** with 8pt grid system
- **Components** like buttons, cards, and plant displays
- **Themes** for light and dark modes

## 🌍 Internationalization

The app supports multiple languages:

- 🇧🇷 Portuguese (Brazil)
- 🇺🇸 English (US)
- 🇪🇸 Spanish
- 🇫🇷 French

Automatic locale detection based on device settings.

## 📊 Analytics & Monetization

- **Google Mobile Ads** integration
- **Banner Ads** for non-intrusive monetization
- **Interstitial Ads** for natural breakpoints
- **Test Ad Units** for development

## 🔒 Security

- **Environment Variables** for sensitive data
- **Gitignore** configuration for secrets
- **Secure API Key Management**
- **No hardcoded credentials**

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow [Very Good Ventures][very_good_ventures_link] architecture patterns
- Write comprehensive tests
- Use semantic commit messages
- Follow Flutter/Dart style guidelines

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Very Good Ventures][very_good_ventures_link] for architecture patterns
- [Google Gemini AI][gemini_link] for plant identification
- [Flutter Team][flutter_link] for the amazing framework

## 📞 Contact

**Lalli Bloom** - Desenvolvedora Flutter

Project Link: [https://github.com/lallibloom/bloomix](https://github.com/lallibloom/bloomix)

---

<div align="center">
  <p>Desenvolvido com ❤️ por <strong>Lalli Bloom</strong> usando Flutter e arquitetura Very Good Ventures</p>
  <p>Perfeito para demonstrar habilidades avançadas de desenvolvimento Flutter!</p>
</div>

<!-- Badges -->
[very_good_ventures_badge]: https://img.shields.io/badge/Very%20Good%20Ventures-Architecture-blue
[very_good_ventures_link]: https://verygood.ventures
[license_badge]: https://img.shields.io/badge/License-MIT-yellow.svg
[license_link]: https://opensource.org/licenses/MIT
[flutter_badge]: https://img.shields.io/badge/Powered%20by-Flutter-blue
[flutter_link]: https://flutter.dev
[gemini_link]: https://ai.google.dev/gemini-api
