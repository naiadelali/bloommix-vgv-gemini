import 'package:bloomix/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class PumpApp extends StatelessWidget {
  const PumpApp({
    required this.child, super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    );
  }
}

Future<void> pumpApp(
  WidgetTester tester, {
  required Widget child,
}) {
  return tester.pumpWidget(
    PumpApp(child: child),
  );
}
