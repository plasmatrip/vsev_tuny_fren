import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vsev_tuny_fren/app/pages/main_navigation/widgets/navigation.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

@RoutePage()
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainView();
}

class _MainView extends State<MainNavigation> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        MainView(),
        EmployeesView(),
        ClientsView(),
        WorksView(),
        SettingsView(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          extendBody: true,
          body: child,
          bottomNavigationBar: Navigation(tabsRouter: tabsRouter),
        );
      },
    );
  }
}
