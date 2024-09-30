import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:just_smile/constant/api_constant.dart';
import 'package:just_smile/data/remote/remote_api.dart';
import 'package:just_smile/data/remote/remote_data_source.dart';
import 'package:just_smile/modules/category/providers/category_provider.dart';
import 'package:just_smile/modules/home/providers/home_provider.dart';
import 'package:just_smile/modules/joke/providers/joke_provider.dart';
import 'package:just_smile/repository/remote_data_repository.dart';

GetIt getIt = GetIt.instance;

Future<void> inject() async {
  getIt.registerLazySingleton(() => Dio(
        BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 3600000),
            receiveTimeout: const Duration(seconds: 3600000),
            sendTimeout: const Duration(seconds: 3600000),
            headers: {"accept": "application/json"}),
      ));
  getIt.registerFactory(() => RemoteApi(getIt.get<Dio>()));
  getIt.registerSingleton(RemoteDataSource(remoteApi: getIt.get()));
  getIt.registerSingleton(RemoteDataRepository(remoteDataSource: getIt.get()));
  getIt.registerFactory(() => HomeProvider());
  getIt.registerFactory(
      () => CategoryProvider(remoteDataRepository: getIt.get()));
  getIt.registerFactory(() => JokeProvider(remoteDataRepository: getIt.get()));
}
