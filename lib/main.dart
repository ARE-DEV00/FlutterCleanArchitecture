import 'package:architecture/presentation/ui/sub01/sub_01_screen.dart';
import 'package:architecture/presentation/ui/sub02/sub_02_screen.dart';
import 'package:architecture/presentation/utils/color_schemes.g.dart';
import 'package:architecture/data/remote/api/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:architecture/data/remote/api/repository/api_repository_impl.dart';
import 'package:architecture/presentation/constants/route_path.dart';
import 'package:architecture/presentation/ui/home/home_screen.dart';
import 'package:go_router/go_router.dart';

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

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.home.fullPath,
      name: RoutePath.home.name,
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: RoutePath.sub01.path,
          name: RoutePath.sub01.name,
          builder: (BuildContext context, GoRouterState state) {
            return Sub01Screen();
          },
        ),
        GoRoute(
          path: RoutePath.sub02.path,
          name: RoutePath.sub02.name,
          builder: (BuildContext context, GoRouterState state) {
            String id = state.pathParameters['id'] ?? '';
            var ext = state.extra as Map<String, dynamic>?;
            String text = ext?['text'] ?? '';
            return Sub02Screen(id: id, text: text);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
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
      routerConfig: _router,
    );
  }
}
