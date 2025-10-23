import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('pt', 'BR'),
    Locale('en', 'US'),
    Locale('es', 'ES'),
    Locale('fr', 'FR'),
  ];

  // Plant identification strings
  String get plantIdentification => _getString('plant_identification');
  String get takePhoto => _getString('take_photo');
  String get selectFromGallery => _getString('select_from_gallery');
  String get identifying => _getString('identifying');
  String get plantName => _getString('plant_name');
  String get scientificName => _getString('scientific_name');
  String get confidence => _getString('confidence');
  String get identifiedAt => _getString('identified_at');
  String get history => _getString('history');
  String get noHistoryYet => _getString('no_history_yet');
  String get error => _getString('error');
  String get tryAgain => _getString('try_again');

  // App branding
  String get appName => _getString('app_name');
  String get appTagline => _getString('app_tagline');
  String get appDescription => _getString('app_description');

  // Home page
  String get identifyPlant => _getString('identify_plant');
  String get noPlantsIdentifiedYet => _getString('no_plants_identified_yet');
  String get startPhotographing => _getString('start_photographing');
  String get recentHistory => _getString('recent_history');

  // Camera page
  String get positionPlantCenter => _getString('position_plant_center');

  // Result page
  String get analyzingPlant => _getString('analyzing_plant');
  String get thisMayTakeSeconds => _getString('this_may_take_seconds');
  String get somethingWentWrong => _getString('something_went_wrong');
  String get result => _getString('result');
  String get confidencePercentage => _getString('confidence_percentage');
  String get backToHome => _getString('back_to_home');

  // Plant care info
  String get watering => _getString('watering');
  String get light => _getString('light');
  String get tips => _getString('tips');

  String _getString(String key) {
    switch (locale.languageCode) {
      case 'en':
        return _enStrings[key] ?? key;
      case 'es':
        return _esStrings[key] ?? _enStrings[key] ?? key;
      case 'fr':
        return _frStrings[key] ?? _enStrings[key] ?? key;
      case 'pt':
      default:
        return _ptStrings[key] ?? key;
    }
  }

  static const Map<String, String> _ptStrings = {
    'plant_identification': 'Identificação de Plantas',
    'take_photo': 'Tirar Foto',
    'select_from_gallery': 'Selecionar da Galeria',
    'identifying': 'Identificando...',
    'plant_name': 'Nome da Planta',
    'scientific_name': 'Nome Científico',
    'confidence': 'Confiança',
    'identified_at': 'Identificado em',
    'history': 'Histórico',
    'no_history_yet': 'Nenhum histórico ainda',
    'error': 'Erro',
    'try_again': 'Tentar Novamente',

    // App branding
    'app_name': 'Bloomix',
    'app_tagline': 'Seu companheiro de plantas com IA',
    'app_description':
        'Descubra o mundo botânico através da inteligência artificial',

    // Home page
    'identify_plant': 'Identificar Planta',
    'no_plants_identified_yet': 'Nenhuma planta identificada ainda',
    'start_photographing': 'Comece fotografando uma planta',
    'recent_history': 'Histórico Recente',

    // Camera page
    'position_plant_center': 'Posicione a planta no centro',

    // Result page
    'analyzing_plant': 'Analisando planta...',
    'this_may_take_seconds': 'Isso pode levar alguns segundos',
    'something_went_wrong': 'Ops! Algo deu errado',
    'result': 'Resultado',
    'confidence_percentage': '% confiança',
    'back_to_home': 'Voltar ao Início',

    // Plant care info
    'watering': 'Rega',
    'light': 'Luz',
    'tips': 'Dicas',
  };

  static const Map<String, String> _enStrings = {
    'plant_identification': 'Plant Identification',
    'take_photo': 'Take Photo',
    'select_from_gallery': 'Select from Gallery',
    'identifying': 'Identifying...',
    'plant_name': 'Plant Name',
    'scientific_name': 'Scientific Name',
    'confidence': 'Confidence',
    'identified_at': 'Identified at',
    'history': 'History',
    'no_history_yet': 'No history yet',
    'error': 'Error',
    'try_again': 'Try Again',

    // App branding
    'app_name': 'Bloomix',
    'app_tagline': 'Your AI plant companion',
    'app_description':
        'Discover the botanical world through artificial intelligence',

    // Home page
    'identify_plant': 'Identify Plant',
    'no_plants_identified_yet': 'No plants identified yet',
    'start_photographing': 'Start by photographing a plant',
    'recent_history': 'Recent History',

    // Camera page
    'position_plant_center': 'Position the plant in the center',

    // Result page
    'analyzing_plant': 'Analyzing plant...',
    'this_may_take_seconds': 'This may take a few seconds',
    'something_went_wrong': 'Oops! Something went wrong',
    'result': 'Result',
    'confidence_percentage': '% confidence',
    'back_to_home': 'Back to Home',

    // Plant care info
    'watering': 'Watering',
    'light': 'Light',
    'tips': 'Tips',
  };

  static const Map<String, String> _esStrings = {
    'plant_identification': 'Identificación de Plantas',
    'take_photo': 'Tomar Foto',
    'select_from_gallery': 'Seleccionar de Galería',
    'identifying': 'Identificando...',
    'plant_name': 'Nombre de la Planta',
    'scientific_name': 'Nombre Científico',
    'confidence': 'Confianza',
    'identified_at': 'Identificado en',
    'history': 'Historial',
    'no_history_yet': 'Sin historial aún',
    'error': 'Error',
    'try_again': 'Intentar de Nuevo',

    // App branding
    'app_name': 'Bloomix',
    'app_tagline': 'Tu compañero de plantas con IA',
    'app_description':
        'Descubre el mundo botánico a través de la inteligencia artificial',

    // Home page
    'identify_plant': 'Identificar Planta',
    'no_plants_identified_yet': 'Aún no se han identificado plantas',
    'start_photographing': 'Comienza fotografiando una planta',
    'recent_history': 'Historial Reciente',

    // Camera page
    'position_plant_center': 'Posiciona la planta en el centro',

    // Result page
    'analyzing_plant': 'Analizando planta...',
    'this_may_take_seconds': 'Esto puede tomar unos segundos',
    'something_went_wrong': '¡Ups! Algo salió mal',
    'result': 'Resultado',
    'confidence_percentage': '% confianza',
    'back_to_home': 'Volver al Inicio',

    // Plant care info
    'watering': 'Riego',
    'light': 'Luz',
    'tips': 'Consejos',
  };

  static const Map<String, String> _frStrings = {
    'plant_identification': 'Identification de Plantes',
    'take_photo': 'Prendre une Photo',
    'select_from_gallery': 'Sélectionner de la Galerie',
    'identifying': 'Identification...',
    'plant_name': 'Nom de la Plante',
    'scientific_name': 'Nom Scientifique',
    'confidence': 'Confiance',
    'identified_at': 'Identifié à',
    'history': 'Historique',
    'no_history_yet': 'Aucun historique encore',
    'error': 'Erreur',
    'try_again': 'Réessayer',

    // App branding
    'app_name': 'Bloomix',
    'app_tagline': 'Votre compagnon de plantes IA',
    'app_description':
        "Découvrez le monde botanique grâce à l'intelligence artificielle",

    // Home page
    'identify_plant': 'Identifier Plante',
    'no_plants_identified_yet': 'Aucune plante identifiée encore',
    'start_photographing': 'Commencez par photographier une plante',
    'recent_history': 'Historique Récent',

    // Camera page
    'position_plant_center': 'Positionnez la plante au centre',

    // Result page
    'analyzing_plant': 'Analyse de la plante...',
    'this_may_take_seconds': 'Cela peut prendre quelques secondes',
    'something_went_wrong': "Oups ! Quelque chose s'est mal passé",
    'result': 'Résultat',
    'confidence_percentage': '% confiance',
    'back_to_home': "Retour à l'Accueil",

    // Plant care info
    'watering': 'Arrosage',
    'light': 'Lumière',
    'tips': 'Conseils',
  };
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.any(
      (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
    );
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
