import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import '../presentation/resources/routes_maneger.dart';
import 'functions/cubits/app/app_cubit.dart';
import 'functions/cubits/app/app_states.dart';
import 'functions/cubits/login/login_cubit.dart';

class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();

  int appState = 0;

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ---------- providers ----------
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..init(),
        ),
        BlocProvider(create: (BuildContext context) => LoginCubit()..init()),
      ],

      // ---------- Consumer ----------
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          // ---------- MaterialApp ----------
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashRout,
            theme: ThemeManager.getAppTheme(),
          );
        },
      ),
    );
  }
}
