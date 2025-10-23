import 'package:bloomix/core/config/app_config.dart';
import 'package:bloomix/features/identify/data/datasources/gemini_datasource.dart';
import 'package:bloomix/features/identify/data/repositories/plant_repository_impl.dart';
import 'package:bloomix/features/identify/domain/repositories/plant_repository.dart';
import 'package:bloomix/features/identify/domain/usecases/identify_plant_usecase.dart';
import 'package:bloomix/features/identify/presentation/cubit/identify_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  final model = GenerativeModel(
    model: 'gemini-2.5-flash',
    apiKey: AppConfig.geminiApiKey,
  );

  getIt.registerLazySingleton<GenerativeModel>(() => model);

  getIt.registerLazySingleton<GeminiDatasource>(
    () => GeminiDatasourceImpl(getIt()),
  );

  getIt.registerLazySingleton<PlantRepository>(
    () => PlantRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<IdentifyPlantUsecase>(
    () => IdentifyPlantUsecase(getIt()),
  );

  getIt.registerFactory<IdentifyCubit>(
    () => IdentifyCubit(getIt()),
  );
}
