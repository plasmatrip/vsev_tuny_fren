// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:vsev_tuny_fren/app/pages/clients/add_client_view.dart' as _i1;
import 'package:vsev_tuny_fren/app/pages/clients/clients_view.dart' as _i4;
import 'package:vsev_tuny_fren/app/pages/clients/selected_client_view.dart'
    as _i9;
import 'package:vsev_tuny_fren/app/pages/employees/add_employee_view.dart'
    as _i2;
import 'package:vsev_tuny_fren/app/pages/employees/employees_view.dart' as _i5;
import 'package:vsev_tuny_fren/app/pages/employees/selected_employee_view.dart'
    as _i10;
import 'package:vsev_tuny_fren/app/pages/main/main_view.dart' as _i7;
import 'package:vsev_tuny_fren/app/pages/main_navigation/main_navigation.dart'
    as _i6;
import 'package:vsev_tuny_fren/app/pages/settings/settings_view.dart' as _i12;
import 'package:vsev_tuny_fren/app/pages/spalsh/splash_view.dart' as _i13;
import 'package:vsev_tuny_fren/app/pages/works/add_work_view.dart' as _i3;
import 'package:vsev_tuny_fren/app/pages/works/people_selector.dart' as _i8;
import 'package:vsev_tuny_fren/app/pages/works/selected_work_view.dart' as _i11;
import 'package:vsev_tuny_fren/app/pages/works/works_view.dart' as _i14;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AddClientView.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddClientView(),
      );
    },
    AddEmployeeView.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddEmployeeView(),
      );
    },
    AddWorkView.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AddWorkView(),
      );
    },
    ClientsView.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ClientsView(),
      );
    },
    EmployeesView.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.EmployeesView(),
      );
    },
    MainNavigation.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MainNavigation(),
      );
    },
    MainView.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MainView(),
      );
    },
    PeopleSelector.name: (routeData) {
      final args = routeData.argsAs<PeopleSelectorArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.PeopleSelector(
          type: args.type,
          key: args.key,
        ),
      );
    },
    SelectedClientView.name: (routeData) {
      final args = routeData.argsAs<SelectedClientViewArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SelectedClientView(
          clientKey: args.clientKey,
          key: args.key,
        ),
      );
    },
    SelectedEmployeeView.name: (routeData) {
      final args = routeData.argsAs<SelectedEmployeeViewArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.SelectedEmployeeView(
          employeeKey: args.employeeKey,
          key: args.key,
        ),
      );
    },
    SelectedWorkView.name: (routeData) {
      final args = routeData.argsAs<SelectedWorkViewArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SelectedWorkView(
          workKey: args.workKey,
          key: args.key,
        ),
      );
    },
    SettingsView.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SettingsView(),
      );
    },
    SplashView.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SplashView(),
      );
    },
    WorksView.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.WorksView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddClientView]
class AddClientView extends _i15.PageRouteInfo<void> {
  const AddClientView({List<_i15.PageRouteInfo>? children})
      : super(
          AddClientView.name,
          initialChildren: children,
        );

  static const String name = 'AddClientView';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddEmployeeView]
class AddEmployeeView extends _i15.PageRouteInfo<void> {
  const AddEmployeeView({List<_i15.PageRouteInfo>? children})
      : super(
          AddEmployeeView.name,
          initialChildren: children,
        );

  static const String name = 'AddEmployeeView';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddWorkView]
class AddWorkView extends _i15.PageRouteInfo<void> {
  const AddWorkView({List<_i15.PageRouteInfo>? children})
      : super(
          AddWorkView.name,
          initialChildren: children,
        );

  static const String name = 'AddWorkView';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ClientsView]
class ClientsView extends _i15.PageRouteInfo<void> {
  const ClientsView({List<_i15.PageRouteInfo>? children})
      : super(
          ClientsView.name,
          initialChildren: children,
        );

  static const String name = 'ClientsView';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EmployeesView]
class EmployeesView extends _i15.PageRouteInfo<void> {
  const EmployeesView({List<_i15.PageRouteInfo>? children})
      : super(
          EmployeesView.name,
          initialChildren: children,
        );

  static const String name = 'EmployeesView';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MainNavigation]
class MainNavigation extends _i15.PageRouteInfo<void> {
  const MainNavigation({List<_i15.PageRouteInfo>? children})
      : super(
          MainNavigation.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigation';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MainView]
class MainView extends _i15.PageRouteInfo<void> {
  const MainView({List<_i15.PageRouteInfo>? children})
      : super(
          MainView.name,
          initialChildren: children,
        );

  static const String name = 'MainView';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PeopleSelector]
class PeopleSelector extends _i15.PageRouteInfo<PeopleSelectorArgs> {
  PeopleSelector({
    required _i14.PeopleType type,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          PeopleSelector.name,
          args: PeopleSelectorArgs(
            type: type,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PeopleSelector';

  static const _i15.PageInfo<PeopleSelectorArgs> page =
      _i15.PageInfo<PeopleSelectorArgs>(name);
}

class PeopleSelectorArgs {
  const PeopleSelectorArgs({
    required this.type,
    this.key,
  });

  final _i14.PeopleType type;

  final _i16.Key? key;

  @override
  String toString() {
    return 'PeopleSelectorArgs{type: $type, key: $key}';
  }
}

/// generated route for
/// [_i9.SelectedClientView]
class SelectedClientView extends _i15.PageRouteInfo<SelectedClientViewArgs> {
  SelectedClientView({
    required int clientKey,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          SelectedClientView.name,
          args: SelectedClientViewArgs(
            clientKey: clientKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedClientView';

  static const _i15.PageInfo<SelectedClientViewArgs> page =
      _i15.PageInfo<SelectedClientViewArgs>(name);
}

class SelectedClientViewArgs {
  const SelectedClientViewArgs({
    required this.clientKey,
    this.key,
  });

  final int clientKey;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SelectedClientViewArgs{clientKey: $clientKey, key: $key}';
  }
}

/// generated route for
/// [_i10.SelectedEmployeeView]
class SelectedEmployeeView
    extends _i15.PageRouteInfo<SelectedEmployeeViewArgs> {
  SelectedEmployeeView({
    required int employeeKey,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          SelectedEmployeeView.name,
          args: SelectedEmployeeViewArgs(
            employeeKey: employeeKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedEmployeeView';

  static const _i15.PageInfo<SelectedEmployeeViewArgs> page =
      _i15.PageInfo<SelectedEmployeeViewArgs>(name);
}

class SelectedEmployeeViewArgs {
  const SelectedEmployeeViewArgs({
    required this.employeeKey,
    this.key,
  });

  final int employeeKey;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SelectedEmployeeViewArgs{employeeKey: $employeeKey, key: $key}';
  }
}

/// generated route for
/// [_i11.SelectedWorkView]
class SelectedWorkView extends _i15.PageRouteInfo<SelectedWorkViewArgs> {
  SelectedWorkView({
    required int workKey,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          SelectedWorkView.name,
          args: SelectedWorkViewArgs(
            workKey: workKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedWorkView';

  static const _i15.PageInfo<SelectedWorkViewArgs> page =
      _i15.PageInfo<SelectedWorkViewArgs>(name);
}

class SelectedWorkViewArgs {
  const SelectedWorkViewArgs({
    required this.workKey,
    this.key,
  });

  final int workKey;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SelectedWorkViewArgs{workKey: $workKey, key: $key}';
  }
}

/// generated route for
/// [_i12.SettingsView]
class SettingsView extends _i15.PageRouteInfo<void> {
  const SettingsView({List<_i15.PageRouteInfo>? children})
      : super(
          SettingsView.name,
          initialChildren: children,
        );

  static const String name = 'SettingsView';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SplashView]
class SplashView extends _i15.PageRouteInfo<void> {
  const SplashView({List<_i15.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.WorksView]
class WorksView extends _i15.PageRouteInfo<void> {
  const WorksView({List<_i15.PageRouteInfo>? children})
      : super(
          WorksView.name,
          initialChildren: children,
        );

  static const String name = 'WorksView';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
