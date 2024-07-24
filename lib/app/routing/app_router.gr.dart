// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:vsev_tuny_fren/app/pages/clients/add_client_view.dart' as _i1;
import 'package:vsev_tuny_fren/app/pages/clients/clients_view.dart' as _i3;
import 'package:vsev_tuny_fren/app/pages/clients/selected_client_view.dart'
    as _i7;
import 'package:vsev_tuny_fren/app/pages/employees/add_employee_view.dart'
    as _i2;
import 'package:vsev_tuny_fren/app/pages/employees/employees_view.dart' as _i4;
import 'package:vsev_tuny_fren/app/pages/employees/selected_employee_view.dart'
    as _i8;
import 'package:vsev_tuny_fren/app/pages/main/main_view.dart' as _i6;
import 'package:vsev_tuny_fren/app/pages/main_navigation/main_navigation.dart'
    as _i5;
import 'package:vsev_tuny_fren/app/pages/settings/settings_view.dart' as _i9;
import 'package:vsev_tuny_fren/app/pages/spalsh/splash_view.dart' as _i10;
import 'package:vsev_tuny_fren/app/pages/works/works_view.dart' as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AddClientView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddClientView(),
      );
    },
    AddEmployeeView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddEmployeeView(),
      );
    },
    ClientsView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ClientsView(),
      );
    },
    EmployeesView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EmployeesView(),
      );
    },
    MainNavigation.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainNavigation(),
      );
    },
    MainView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MainView(),
      );
    },
    SelectedClientView.name: (routeData) {
      final args = routeData.argsAs<SelectedClientViewArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SelectedClientView(
          clientKey: args.clientKey,
          key: args.key,
        ),
      );
    },
    SelectedEmployeeView.name: (routeData) {
      final args = routeData.argsAs<SelectedEmployeeViewArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SelectedEmployeeView(
          employeeKey: args.employeeKey,
          key: args.key,
        ),
      );
    },
    SettingsView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SettingsView(),
      );
    },
    SplashView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashView(),
      );
    },
    WorksView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.WorksView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddClientView]
class AddClientView extends _i12.PageRouteInfo<void> {
  const AddClientView({List<_i12.PageRouteInfo>? children})
      : super(
          AddClientView.name,
          initialChildren: children,
        );

  static const String name = 'AddClientView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddEmployeeView]
class AddEmployeeView extends _i12.PageRouteInfo<void> {
  const AddEmployeeView({List<_i12.PageRouteInfo>? children})
      : super(
          AddEmployeeView.name,
          initialChildren: children,
        );

  static const String name = 'AddEmployeeView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ClientsView]
class ClientsView extends _i12.PageRouteInfo<void> {
  const ClientsView({List<_i12.PageRouteInfo>? children})
      : super(
          ClientsView.name,
          initialChildren: children,
        );

  static const String name = 'ClientsView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EmployeesView]
class EmployeesView extends _i12.PageRouteInfo<void> {
  const EmployeesView({List<_i12.PageRouteInfo>? children})
      : super(
          EmployeesView.name,
          initialChildren: children,
        );

  static const String name = 'EmployeesView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MainNavigation]
class MainNavigation extends _i12.PageRouteInfo<void> {
  const MainNavigation({List<_i12.PageRouteInfo>? children})
      : super(
          MainNavigation.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigation';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MainView]
class MainView extends _i12.PageRouteInfo<void> {
  const MainView({List<_i12.PageRouteInfo>? children})
      : super(
          MainView.name,
          initialChildren: children,
        );

  static const String name = 'MainView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SelectedClientView]
class SelectedClientView extends _i12.PageRouteInfo<SelectedClientViewArgs> {
  SelectedClientView({
    required int clientKey,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          SelectedClientView.name,
          args: SelectedClientViewArgs(
            clientKey: clientKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedClientView';

  static const _i12.PageInfo<SelectedClientViewArgs> page =
      _i12.PageInfo<SelectedClientViewArgs>(name);
}

class SelectedClientViewArgs {
  const SelectedClientViewArgs({
    required this.clientKey,
    this.key,
  });

  final int clientKey;

  final _i13.Key? key;

  @override
  String toString() {
    return 'SelectedClientViewArgs{clientKey: $clientKey, key: $key}';
  }
}

/// generated route for
/// [_i8.SelectedEmployeeView]
class SelectedEmployeeView
    extends _i12.PageRouteInfo<SelectedEmployeeViewArgs> {
  SelectedEmployeeView({
    required int employeeKey,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          SelectedEmployeeView.name,
          args: SelectedEmployeeViewArgs(
            employeeKey: employeeKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedEmployeeView';

  static const _i12.PageInfo<SelectedEmployeeViewArgs> page =
      _i12.PageInfo<SelectedEmployeeViewArgs>(name);
}

class SelectedEmployeeViewArgs {
  const SelectedEmployeeViewArgs({
    required this.employeeKey,
    this.key,
  });

  final int employeeKey;

  final _i13.Key? key;

  @override
  String toString() {
    return 'SelectedEmployeeViewArgs{employeeKey: $employeeKey, key: $key}';
  }
}

/// generated route for
/// [_i9.SettingsView]
class SettingsView extends _i12.PageRouteInfo<void> {
  const SettingsView({List<_i12.PageRouteInfo>? children})
      : super(
          SettingsView.name,
          initialChildren: children,
        );

  static const String name = 'SettingsView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashView]
class SplashView extends _i12.PageRouteInfo<void> {
  const SplashView({List<_i12.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.WorksView]
class WorksView extends _i12.PageRouteInfo<void> {
  const WorksView({List<_i12.PageRouteInfo>? children})
      : super(
          WorksView.name,
          initialChildren: children,
        );

  static const String name = 'WorksView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
