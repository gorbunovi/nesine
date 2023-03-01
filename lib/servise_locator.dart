import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nesine/core/platform/network_info.dart';
import 'package:nesine/feature/data/datasources/local/local_data_source.dart';
import 'package:nesine/feature/data/datasources/remote/remote_data_source.dart';
import 'package:nesine/feature/data/repositories/catalog_repositories_impl.dart';
import 'package:nesine/feature/domain/repositories/catalog_repository.dart';
import 'package:nesine/feature/domain/usecases/get_url.dart';
import 'package:nesine/feature/presentation/card/controller/card_controller.dart';

import 'feature/presentation/home/controller/home_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => HomeController(getUrl:  sl()));
  sl.registerFactory(() => CardController());

  //UseCases
  sl.registerLazySingleton(() => GetUrl(sl()));
  //Repository
  sl.registerLazySingleton<UrlRepository>(
        () => UrlRepositoryImpl(
      urlLocalDataSorce: sl(),
      urlRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<UrlLocalDataSource>(
        () => UrlLocalDataSorceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<UrlRemoteDataSource>(
        () => UrlRemoteDataSourceImpl(client: sl()),
  );
  //Core
  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImp(sl()),
  );
  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
