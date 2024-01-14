import 'package:architecture/presentation/utils/color_schemes.g.dart';
import 'package:architecture/data/remote/api/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:architecture/data/remote/api/repository/api_repository_impl.dart';
import 'package:architecture/presentation/constants/RouteName.dart';
import 'package:architecture/presentation/ui/home/home.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

GetIt getIt = GetIt.instance;

//DI 등록
void setupGetIt() {
  final dio = Dio();
  // Dio 로깅 설정
  dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      responseBody: true,
      request: true,
      error: true,
      requestBody: true,
      responseHeader: true));

/*
  dio.options.headers = {
    'x-client-access': '',
  };
*/

  getIt.registerSingleton<Dio>(dio);

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt<Dio>()), // GetIt을 사용하여 Dio 의존성 주입
  );
  getIt.registerLazySingleton<ApiRepositoryImpl>(() => ApiRepositoryImpl());
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
        title: 'Flutter Clean Architecture',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
        ),
        themeMode: ThemeMode.system,
        initialRoute: RouteName.home,
        routes: {
          RouteName.home: (context) => Home(),
        });
  }
}
