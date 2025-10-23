import 'dart:async';

import 'package:bloomix/core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    Logger.debug('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    ErrorTracker.trackError(
      'BLoC Error in ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
      context: {
        'bloc_type': bloc.runtimeType.toString(),
        'state': bloc.state.toString(),
      },
    );
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    Logger.debug('onTransition(${bloc.runtimeType}, $transition)');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    Logger.debug('onEvent(${bloc.runtimeType}, $event)');
  }
}

typedef AppBuilder = Widget Function();

Future<void> bootstrap(
  AppBuilder builder, {
  required String environment,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize error handling
  FlutterError.onError = (details) {
    ErrorTracker.trackError(
      'Flutter Error',
      error: details.exception,
      stackTrace: details.stack,
      context: {
        'library': details.library,
        'context': details.context?.toString(),
      },
    );
  };

  // Initialize BLoC observer
  Bloc.observer = const AppBlocObserver();

  // Initialize locale data
  await initializeDateFormatting('pt_BR');
  await initializeDateFormatting('en_US');
  await initializeDateFormatting('es_ES');
  await initializeDateFormatting('fr_FR');

  // Setup dependencies
  setupDependencies();

  // Log startup
  Logger.info('🚀 Bloomix starting in $environment mode');

  // Track app startup
  ErrorTracker.trackUserAction(
    'app_startup',
    properties: {
      'environment': environment,
      'timestamp': DateTime.now().toIso8601String(),
    },
  );

  runApp(builder());
}
