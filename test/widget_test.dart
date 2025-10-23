import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Simple test', (WidgetTester tester) async {
    // Build a simple widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Text('Hello World'),
        ),
      ),
    );

    // Verify that the text is displayed
    expect(find.text('Hello World'), findsOneWidget);
  });
}
