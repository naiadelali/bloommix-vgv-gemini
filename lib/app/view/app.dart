import 'package:bloomix/features/identify/identify.dart';
import 'package:bloomix/l10n/l10n.dart';
import 'package:bloomix_ds/bloomix_ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IdentifyCubit>(
          create: (_) => GetIt.instance<IdentifyCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Bloomix',
        theme: BloomixTheme.lightTheme,
        darkTheme: BloomixTheme.darkTheme,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          for (final supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
          }
          return const Locale('pt', 'BR');
        },
        home: const HomePage(),
      ),
    );
  }
}
