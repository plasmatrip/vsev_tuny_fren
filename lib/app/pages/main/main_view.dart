import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/pages/main/widgets/current_works.dart';
import 'package:vsev_tuny_fren/app/pages/main/widgets/empty_works.dart';
import 'package:vsev_tuny_fren/app/pages/main/widgets/fast_access.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';

@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset('assets/images/main.png'),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 32.h, bottom: 6.h),
              child: Text(
                'Текущие записи',
                style: context.s14w700.copyWith(color: dayTextIconsText_01),
              ),
            ),
            if (context.watch<WorkRepo>().repo.isEmpty) ...[
              const EmptyWorks(),
            ] else ...[
              const CurrentWorks(),
            ],
            Padding(
              padding: EdgeInsets.only(left: 16.w, bottom: 6.h),
              child: Text(
                'Быстрый доступ',
                style: context.s14w700.copyWith(color: dayTextIconsText_01),
              ),
            ),
            const FastAccess(),
            SizedBox(height: 92.h),
          ],
        ),
      ),
    );
  }
}
