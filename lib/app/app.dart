import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/repository/employee_repo.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appRouter = AppRouter();

  @override
  void dispose() async {
    await Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => WorkRepo()),
          ChangeNotifierProvider(create: (context) => EmployeeRepo()),
        ],
        builder: (context, child) {
          return DevicePreview(
              enabled: !kReleaseMode,
              builder: (context) {
                return ScreenUtilInit(
                  designSize: const Size(375, 880),
                  builder: (context, child) {
                    debugPaintSizeEnabled = false;
                    return MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      title: 'VsevTunyFren',
                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate
                      ],
                      supportedLocales: const [Locale('ru', 'RU')],
                      theme: ThemeData(
                        scaffoldBackgroundColor: dayBaseBase_02,
                        appBarTheme: AppBarTheme(
                          iconTheme: IconThemeData(
                            color: dayTextIconsText_02,
                            size: 24.h,
                          ),
                          backgroundColor: dayBaseBase_02,
                          centerTitle: false,
                          titleTextStyle: context.s17w700.copyWith(color: dayTextIconsText_02),
                        ),
                        useMaterial3: true,
                      ),
                      routerConfig: appRouter.config(),
                    );
                  },
                );
              });
        });
  }
}
