import '../repository/book_details_repository/book_details_repository_impl.dart';
import 'package:dio/dio.dart';
 import 'package:get_it/get_it.dart';

import '../repository/home_page_repository/home_page_repository_impl.dart';
import '../Api/dio_consumer.dart'; 
import '../repository/search_repository/search_repository_impl.dart';

final getIt = GetIt.instance;
Future<void> serviceLocator() async {
  getIt.registerSingleton<DioConsumer>(DioConsumer(client:  Dio()));

  getIt.registerSingleton<HomePageRepositoryImpl>(HomePageRepositoryImpl(
    dio: getIt.get<DioConsumer>(),
  ));
  getIt.registerSingleton<BookDetailRepositoryImpl>(
      BookDetailRepositoryImpl(dio: getIt.get<DioConsumer>()));  
      getIt.registerSingleton<SearchRepositoryImpl>(
      SearchRepositoryImpl(dio: getIt.get<DioConsumer>()));

  //  getIt.registerFactory(() => GlobalKey<NavigatorState>());
  // getIt.registerLazySingleton(() => LogInterceptor(
  //     request: false,
  //     requestBody: false,
  //     requestHeader: false,
  //     responseBody: false,
  //     responseHeader: false,
  //     error: false));
}
