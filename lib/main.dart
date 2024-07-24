import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:vsev_tuny_fren/app/app.dart';
import 'package:vsev_tuny_fren/app/internal/const/boxes.dart';
import 'package:vsev_tuny_fren/app/models/client.dart';
import 'package:vsev_tuny_fren/app/models/employee.dart';
import 'package:vsev_tuny_fren/app/models/settings.dart';
import 'package:vsev_tuny_fren/app/models/work.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter<Settings>(SettingsAdapter());
  Hive.registerAdapter<Work>(WorkAdapter());
  Hive.registerAdapter<Client>(ClientAdapter());
  Hive.registerAdapter<Employee>(EmployeeAdapter());

  await Hive.openBox<Settings>(Boxes.settings);
  await Hive.openBox<Work>(Boxes.work);
  await Hive.openBox<Client>(Boxes.client);
  await Hive.openBox<Employee>(Boxes.employee);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => initializeDateFormatting('ru', null).then(
      (_) => runApp(
        const App(),
      ),
    ),
  );
}
