// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:event_bus_plus/event_bus_plus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;
import 'package:starter/data/injection/modules.dart' as _i15;
import 'package:starter/data/network/dio.client.dart' as _i10;
import 'package:starter/data/network/endpoints/office.endpoint.dart' as _i12;
import 'package:starter/data/network/interceptors/activity.interceptor.dart'
    as _i13;
import 'package:starter/data/repositories/home_repository.dart' as _i14;
import 'package:starter/data/repositories/user_repository.dart' as _i9;
import 'package:starter/data/services/dialog.service.dart' as _i3;
import 'package:starter/data/storage/db/dao/user_dao.dart' as _i8;
import 'package:starter/data/storage/db/hive_database.dart' as _i6;
import 'package:starter/data/storage/local/local.storage.dart' as _i11;
import 'package:starter/presentation/styles/global.styles.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectorModule = _$InjectorModule();
    gh.singleton<_i3.DialogService>(_i3.DialogService());
    gh.singleton<_i4.EventBus>(injectorModule.eventBus);
    gh.singleton<_i5.GlobalTheme>(_i5.GlobalTheme());
    await gh.singletonAsync<_i6.HiveDatabase>(
      () => _i6.HiveDatabase.init(),
      preResolve: true,
    );
    await gh.singletonAsync<_i7.SharedPreferences>(
      () => injectorModule.prefs,
      preResolve: true,
    );
    gh.factory<String>(
      () => injectorModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.factory<_i8.UserDao>(() => _i8.UserDao(gh<_i6.HiveDatabase>()));
    gh.singleton<_i9.UserRepository>(_i9.UserRepository(gh<_i8.UserDao>()));
    gh.lazySingleton<_i10.DioClient>(
        () => injectorModule.dio(gh<String>(instanceName: 'baseUrl')));
    gh.singleton<_i11.LocalStorage>(
        _i11.LocalStorage(gh<_i7.SharedPreferences>()));
    gh.factory<_i12.OfficeEndpoint>(
        () => _i12.OfficeEndpoint(gh<_i10.DioClient>()));
    gh.singleton<_i13.ActivityInterceptor>(
        _i13.ActivityInterceptor(gh<_i10.DioClient>()));
    gh.factory<_i14.HomeRepository>(
        () => _i14.HomeRepository(gh<_i12.OfficeEndpoint>()));
    return this;
  }
}

class _$InjectorModule extends _i15.InjectorModule {}
