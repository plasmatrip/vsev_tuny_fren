// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:vsev_tuny_fren/app/pages/clients/clients_view.dart' as _i1;
import 'package:vsev_tuny_fren/app/pages/employees/employees_view.dart' as _i2;
import 'package:vsev_tuny_fren/app/pages/main/main_view.dart' as _i4;
import 'package:vsev_tuny_fren/app/pages/main_navigation/main_navigation.dart'
    as _i3;
import 'package:vsev_tuny_fren/app/pages/settings/settings_view.dart' as _i5;
import 'package:vsev_tuny_fren/app/pages/spalsh/splash_view.dart' as _i6;
import 'package:vsev_tuny_fren/app/pages/works/works_view.dart' as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    ClientsView.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ClientsView(),
      );
    },
    EmployeesView.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EmployeesView(),
      );
    },
    MainNavigation.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainNavigation(),
      );
    },
    MainView.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainView(),
      );
    },
    SettingsView.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SettingsView(),
      );
    },
    SplashView.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashView(),
      );
    },
    WorksView.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.WorksView(),
      );
    },
  };
}

/// generated route for
/// [_i1.ClientsView]
class ClientsView extends _i8.PageRouteInfo<void> {
  const ClientsView({List<_i8.PageRouteInfo>? children})
      : super(
          ClientsView.name,
          initialChildren: children,
        );

  static const String name = 'ClientsView';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EmployeesView]
class EmployeesView extends _i8.PageRouteInfo<void> {
  const EmployeesView({List<_i8.PageRouteInfo>? children})
      : super(
          EmployeesView.name,
          initialChildren: children,
        );

  static const String name = 'EmployeesView';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainNavigation]
class MainNavigation extends _i8.PageRouteInfo<void> {
  const MainNavigation({List<_i8.PageRouteInfo>? children})
      : super(
          MainNavigation.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigation';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainView]
class MainView extends _i8.PageRouteInfo<void> {
  const MainView({List<_i8.PageRouteInfo>? children})
      : super(
          MainView.name,
          initialChildren: children,
        );

  static const String name = 'MainView';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SettingsView]
class SettingsView extends _i8.PageRouteInfo<void> {
  const SettingsView({List<_i8.PageRouteInfo>? children})
      : super(
          SettingsView.name,
          initialChildren: children,
        );

  static const String name = 'SettingsView';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashView]
class SplashView extends _i8.PageRouteInfo<void> {
  const SplashView({List<_i8.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.WorksView]
class WorksView extends _i8.PageRouteInfo<void> {
  const WorksView({List<_i8.PageRouteInfo>? children})
      : super(
          WorksView.name,
          initialChildren: children,
        );

  static const String name = 'WorksView';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
