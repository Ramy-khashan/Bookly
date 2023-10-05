import 'config/theme/controller/theme_controller_cubit.dart';
import 'core/repository/search_repository/search_repository_impl.dart';
import 'core/utils/service_locator.dart';
import 'modules/home_page/controller/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/app_string.dart';
import 'core/repository/home_page_repository/home_page_repository_impl.dart';
import 'modules/search/controller/search_cubit.dart';
import 'modules/splash/view/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    MyApp.navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeControllerCubit()..getSavedMode(),
        ),
        BlocProvider(
          create: (context) =>
              HomePageCubit(getIt.get<HomePageRepositoryImpl>())
                ..getNewBooks()
                ..getFreeBestSellerBooks(),
        ),
        BlocProvider(
            create: (context) =>
                SearchCubit(getIt.get<SearchRepositoryImpl>())),
      ],
      child: BlocBuilder<ThemeControllerCubit, ThemeControllerState>(
        builder: (context, state) {
          final controller=ThemeControllerCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppString.appTitle,
            navigatorKey: MyApp.navigatorKey,
            theme: ThemeData(
              useMaterial3: true,
              brightness:controller.isDarkMode? Brightness.dark:Brightness.light,
              scaffoldBackgroundColor:controller.isDarkMode? const Color.fromARGB(255, 0, 0, 0): Color.fromARGB(255, 255, 255, 255),
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
