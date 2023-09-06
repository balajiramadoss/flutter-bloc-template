import 'package:event_bus_plus/event_bus_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/application/config/application.dart';
import 'package:starter/data/network/dio.client.dart';

///
@module
abstract class InjectorModule {

  ///
  @Named('baseUrl')
  String get baseUrl => appConfig!.baseUrl;

  ///
  @lazySingleton
  DioClient dio(@Named('baseUrl') String url) => DioClient(url);

  ///
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  ///
  @singleton
  EventBus get eventBus => EventBus();

}
