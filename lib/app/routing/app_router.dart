import 'package:auto_route/auto_route.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route,Page|Screen")
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: SplashView.page),
        AutoRoute(
          page: MainNavigation.page,
          children: [
            AutoRoute(page: MainView.page),
            AutoRoute(page: EmployeesView.page),
            AutoRoute(page: ClientsView.page),
            AutoRoute(page: WorksView.page),
            AutoRoute(page: SettingsView.page),
          ],
        ),
      ];
}
