import 'package:bloomix/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Bloomix Integration Tests', () {
    testWidgets('Complete plant identification flow', (tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Verify home page is displayed
      expect(find.text('Bloomix'), findsOneWidget);
      expect(find.text('Identificar Planta'), findsOneWidget);

      // Tap identify plant button
      await tester.tap(find.text('Identificar Planta'));
      await tester.pumpAndSettle();

      // Verify camera page is displayed
      expect(find.text('Posicione a planta no centro'), findsOneWidget);

      // Go back to home
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Verify we're back on home page
      expect(find.text('Bloomix'), findsOneWidget);
    });

    testWidgets('App navigation flow', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Test navigation to camera page
      await tester.tap(find.text('Identificar Planta'));
      await tester.pumpAndSettle();
      expect(find.text('Posicione a planta no centro'), findsOneWidget);

      // Test back navigation
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('Bloomix'), findsOneWidget);
    });

    testWidgets('UI elements are properly displayed', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify all main UI elements are present
      expect(find.text('Bloomix'), findsOneWidget);
      expect(find.text('Seu companheiro de plantas com IA'), findsOneWidget);
      expect(
        find.text(
          'Descubra o mundo botânico através da inteligência artificial',
        ),
        findsOneWidget,
      );
      expect(find.text('Identificar Planta'), findsOneWidget);

      // Verify icons are present
      expect(find.byIcon(Icons.local_florist), findsOneWidget);
      expect(find.byIcon(Icons.camera_alt_rounded), findsOneWidget);
    });

    testWidgets('Empty state is displayed correctly', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify empty state message
      expect(find.text('Nenhuma planta identificada ainda'), findsOneWidget);
      expect(find.text('Comece fotografando uma planta'), findsOneWidget);
      expect(find.byIcon(Icons.eco_outlined), findsOneWidget);
    });
  });
}
