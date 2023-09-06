import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:starter/application/config/app_config.dart';
import 'package:starter/data/injection/injector.dart';

///
/// [Application]
///
class Application {
  ///
  AppConfiguration config;

  ///
  static Application? instance;

  ///
  /// Initialize
  ///
  static Future<void> initialize({required AppConfiguration config}) async {
    if (Application.instance != null) return;
    Application.instance = Application._(config: config);
    await Application.instance!.initializeServices();
  }

  ///
  /// Private Constructor
  ///
  Application._({required this.config});

  ///
  /// Initialize Services
  ///
  Future<void> initializeServices() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await configureDependencies();
  }
}

///
/// Get App Configuration
///
AppConfiguration? get appConfig => Application.instance?.config;
