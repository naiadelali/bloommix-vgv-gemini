import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:bloomix/core/utils/result.dart';
import 'package:bloomix/features/identify/domain/entities/plant_info.dart';
import 'package:bloomix/features/identify/domain/usecases/identify_plant_usecase.dart';
import 'package:bloomix/features/identify/presentation/cubit/identify_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIdentifyPlantUsecase extends Mock implements IdentifyPlantUsecase {}

void main() {
  group('IdentifyCubit', () {
    late IdentifyCubit identifyCubit;
    late MockIdentifyPlantUsecase mockUsecase;

    setUpAll(() {
      registerFallbackValue(Uint8List(0));
    });

    setUp(() {
      mockUsecase = MockIdentifyPlantUsecase();
      identifyCubit = IdentifyCubit(mockUsecase);
    });

    tearDown(() {
      identifyCubit.close();
    });

    test('initial state is IdentifyInitial', () {
      expect(identifyCubit.state, equals(const IdentifyInitial()));
    });

    group('identifyPlant', () {
      blocTest<IdentifyCubit, IdentifyState>(
        'emits [IdentifyLoading, IdentifySuccess] when identifyPlant succeeds',
        build: () {
          // Mock successful identification
          when(() => mockUsecase(any())).thenAnswer(
            (_) async => Success<PlantInfo>(
              PlantInfo(
                name: 'Rosa',
                scientificName: 'Rosa spp.',
                confidence: 0.95,
                watering: 'Regar 2-3 vezes por semana',
                light: 'Luz solar direta',
                tips: 'Manter solo úmido mas não encharcado',
                identifiedAt: DateTime.now(),
              ),
            ),
          );
          return identifyCubit;
        },
        act: (cubit) async {
          await cubit.identifyPlant(Uint8List(0), null);
        },
        expect: () => [
          isA<IdentifyLoading>(),
          isA<IdentifySuccess>(),
        ],
      );

      blocTest<IdentifyCubit, IdentifyState>(
        'emits [IdentifyLoading, IdentifyError] when identifyPlant fails',
        build: () {
          // Mock error scenario
          when(() => mockUsecase(any())).thenAnswer(
            (_) async => const Failure<PlantInfo>('Erro ao identificar planta'),
          );
          return identifyCubit;
        },
        act: (cubit) async {
          await cubit.identifyPlant(Uint8List(0), null);
        },
        expect: () => [
          isA<IdentifyLoading>(),
          isA<IdentifyError>(),
        ],
      );
    });
  });
}
