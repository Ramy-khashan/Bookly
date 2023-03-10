import 'package:bookly/core/repository/search_repository/search_repository_impl.dart';
import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/modules/home_page/controller/home_page_cubit.dart';
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
          create: (context) =>
              HomePageCubit(getIt.get<HomePageRepositoryImpl>())
                ..getNewBooks()
                ..getFreeBestSellerBooks(),
        ),
        BlocProvider(
            create: (context) =>
                SearchCubit(getIt.get<SearchRepositoryImpl>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.appTitle,
        navigatorKey: MyApp.navigatorKey,
        theme: ThemeData(
           useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.black,
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
