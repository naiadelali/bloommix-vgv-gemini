# Bloomix - Arquitetura do Projeto

## 🌱 Visão Geral
Bloomix é um aplicativo Flutter que usa IA Gemini para identificar plantas através de fotos. Segue o padrão **Very Good Ventures (VGV)** com **Clean Architecture**.

## 📁 Estrutura de Pastas

```
lib/
├── core/
│   ├── config/
│   │   └── app_config.dart          # Configurações (API keys, Ad IDs)
│   ├── di/
│   │   └── injection.dart           # Dependency Injection (GetIt)
│   ├── utils/
│   │   └── result.dart              # Result pattern (Success/Failure)
│   └── ads/
│       └── ad_manager.dart          # Gerenciamento Google AdMob
│
└── features/
    └── identify/
        ├── data/
        │   ├── datasources/
        │   │   └── gemini_datasource.dart       # API Gemini
        │   ├── models/
        │   │   ├── plant_info_model.dart        # Model JSON
        │   │   └── plant_info_model.g.dart      # Gerado
        │   └── repositories/
        │       └── plant_repository_impl.dart   # Implementação Repository
        │
        ├── domain/
        │   ├── entities/
        │   │   └── plant_info.dart              # Entity PlantInfo
        │   ├── repositories/
        │   │   └── plant_repository.dart        # Interface Repository
        │   └── usecases/
        │       └── identify_plant_usecase.dart  # Use Case
        │
        └── presentation/
            ├── cubit/
            │   ├── identify_cubit.dart          # Cubit + State
            │   └── identify_state.dart
            ├── pages/
            │   ├── home_page.dart               # Tela inicial
            │   ├── camera_page.dart             # Captura foto
            │   └── result_page.dart             # Resultado identificação
            └── widgets/
                └── history_section.dart         # Widget histórico
```

## 🏗️ Clean Architecture (Camadas)

### 1. **Domain Layer** (Núcleo do negócio)
- **Entities**: `PlantInfo` - representa os dados de uma planta
- **Repositories**: Interface abstrata para operações de dados
- **Use Cases**: `IdentifyPlantUsecase` - lógica de identificação

### 2. **Data Layer** (Dados externos)
- **Datasources**: `GeminiDatasource` - comunica com API Gemini
- **Models**: `PlantInfoModel` - serialização JSON
- **Repository Impl**: Implementa interface do Domain

### 3. **Presentation Layer** (UI)
- **Cubit**: Gerencia estado com Bloc pattern
- **Pages**: Telas do app (Home, Camera, Result)
- **Widgets**: Componentes reutilizáveis

## 🔧 Tecnologias

| Tecnologia | Uso |
|------------|-----|
| **flutter_bloc** | State management |
| **get_it** | Dependency injection |
| **google_generative_ai** | Gemini AI (identificação) |
| **google_mobile_ads** | Monetização (Banner + Interstitial) |
| **camera** | Captura de fotos |
| **shared_preferences** | Persistência do histórico |
| **google_fonts** | Tipografia (Poppins + Inter) |
| **equatable** | Comparação de objetos |

## 🎨 Design System

### Paleta de Cores
- **Primary**: `#4CAF50` (Verde vibrante)
- **Secondary**: `#81C784` (Verde claro)
- **Background**: `#F1F8E9` (Verde pastel)
- **Accent**: `#66BB6A`

### Tipografia
- **Headers**: Google Fonts Poppins (Bold)
- **Body**: Google Fonts Inter (Regular/Medium)

## 💰 Monetização

### Google AdMob
- **Banner Ad**: Rodapé da HomePage
- **Interstitial Ad**: A cada 5 identificações
- **Test IDs**: Configurados em `app_config.dart`

## 🧠 Fluxo de Identificação

1. Usuário clica em "Identificar Planta"
2. Abre câmera (`CameraPage`)
3. Captura foto → converte para bytes
4. `IdentifyCubit` chama `IdentifyPlantUsecase`
5. Use case aciona `PlantRepository`
6. Repository usa `GeminiDatasource` para enviar imagem
7. Gemini retorna JSON com dados da planta
8. Cubit atualiza estado para `IdentifySuccess`
9. `ResultPage` exibe informações
10. Histórico salvo em `SharedPreferences` (últimas 3 plantas)

## 📦 Dependency Injection (GetIt)

```dart
setupDependencies() {
  // Gemini AI
  getIt.registerLazySingleton<GenerativeModel>(...)
  
  // Datasource
  getIt.registerLazySingleton<GeminiDatasource>(...)
  
  // Repository
  getIt.registerLazySingleton<PlantRepository>(...)
  
  // Use Case
  getIt.registerLazySingleton<IdentifyPlantUsecase>(...)
  
  // Cubit
  getIt.registerFactory<IdentifyCubit>(...)
}
```

## 🔐 Configuração de Permissões

### Android (`AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.INTERNET"/>
```

### iOS (`Info.plist`)
```xml
<key>NSCameraUsageDescription</key>
<string>Bloomix precisa acessar sua câmera para fotografar e identificar plantas.</string>
```

## 🚀 MVP Features

✅ Identificação de plantas com IA  
✅ Histórico local (últimas 3 plantas)  
✅ Monetização com Google Ads  
✅ UI elegante com gradientes  
✅ Câmera integrada  
✅ Persistência com SharedPreferences  

## 📝 Próximos Passos (Pós-MVP)

- [ ] Internacionalização (pt-BR / en-US)
- [ ] Modo offline (cache de identificações)
- [ ] Compartilhamento de resultados
- [ ] Galeria de plantas identificadas
- [ ] Filtros e pesquisa no histórico

## 🧪 Como Testar

1. Compilar projeto: `flutter pub get`
2. Executar: `flutter run`
3. Fotografar uma planta
4. Verificar identificação retornada pelo Gemini
5. Testar ads (banner aparece, interstitial a cada 5 IDs)
6. Validar histórico persistindo entre sessões

---

**Bloomix** - Your AI plant companion 🌿
