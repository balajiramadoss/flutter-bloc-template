import 'package:auto_route/auto_route.dart';
import 'package:starter/application/routes/router.gr.dart';

///
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AdaptiveRoute(page: HomeScreen.page, path: '/'),
        AdaptiveRoute(page: ExampleScreen.page, path: '/example')
      ];
}
