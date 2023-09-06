import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/application/config/app_config.dart';
import 'package:starter/application/config/application.dart';
import 'package:starter/application/localizations/localizations.g.dart';
import 'package:starter/application/routes/router.dart';
import 'package:starter/presentation/styles/themes.dart';

///
void startApplication(AppConfiguration configuration) async {
  await Application.initialize(config: configuration);

  // This is to observe all states & events all over the app
  Bloc.observer = AppObserver();

  runApp(EasyLocalization(
      supportedLocales: const <Locale>[Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: MyApp()));
}

///
class MyApp extends StatelessWidget {
  ///
  MyApp({super.key});

  ///
  final AppRouter router = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Bloc',
      routerConfig: router.config(),
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      themeMode: ThemeMode.system,
      theme: lightThemeData,
      darkTheme: darkThemeData,
    );
  }
}

///
class AppObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    log('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
