import 'package:dio/dio.dart';
import 'package:front_atak/modules/home/domain/repositories/search_repository.dart';
import 'package:front_atak/modules/home/domain/usecases/search_usecase.dart';
import 'package:front_atak/modules/home/domain/usecases/search_usecase_impl.dart';
import 'package:front_atak/modules/home/external/search_datasource_impl.dart';
import 'package:front_atak/modules/home/infra/datasource/search_datasource.dart';
import 'package:front_atak/modules/home/infra/repositories/search_repository_impl.dart';
import 'package:front_atak/modules/home/presentation/controller/search_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //dio
    getIt.registerLazySingleton<Dio>(() => Dio());

    //datasources
    getIt.registerLazySingleton<SearchDatasource>(
      () => SearchDatasourceImpl(dio: getIt()),
    );

    //repositories
    getIt.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(datasource: getIt()),
    );

    //usecases
    getIt.registerLazySingleton<SearchUsecase>(
      () => SearchUsecaseImpl(repository: getIt()),
    );

    //controllers
    getIt.registerLazySingleton(() => SearchController(getIt()));
  }
}
