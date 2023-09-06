// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:starter/presentation/ui/screens/example/example_screen.dart'
    as _i2;
import 'package:starter/presentation/ui/screens/home/home.screen.dart' as _i1;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeScreen.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    ExampleScreen.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ExampleScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreen extends _i3.PageRouteInfo<void> {
  const HomeScreen({List<_i3.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ExampleScreen]
class ExampleScreen extends _i3.PageRouteInfo<void> {
  const ExampleScreen({List<_i3.PageRouteInfo>? children})
      : super(
          ExampleScreen.name,
          initialChildren: children,
        );

  static const String name = 'ExampleScreen';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
