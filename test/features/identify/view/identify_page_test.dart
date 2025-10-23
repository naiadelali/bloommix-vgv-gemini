import 'package:bloomix/features/identify/domain/usecases/identify_plant_usecase.dart';
import 'package:bloomix/features/identify/presentation/cubit/identify_cubit.dart';
import 'package:bloomix/features/identify/presentation/pages/home_page.dart';
import 'package:bloomix/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIdentifyPlantUsecase extends Mock implements IdentifyPlantUsecase {}

void main() {
  group('HomePage', () {
    late MockIdentifyPlantUsecase mockUsecase;

    setUp(() {
      mockUsecase = MockIdentifyPlantUsecase();
    });

    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: BlocProvider<IdentifyCubit>(
            create: (context) => IdentifyCubit(mockUsecase),
            child: const HomePage(),
          ),
        ),
      );

      // Pump and settle to allow all widgets to build
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
