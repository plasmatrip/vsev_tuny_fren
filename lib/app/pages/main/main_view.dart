import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
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
              SizedBox(
                width: 375.w,
                height: 152.h,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Нет информации',
                      style: context.s15w400.copyWith(color: dayTextIconsText_01),
                    ),
                    SizedBox(height: 12.h),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                          fixedSize: Size(343.w, 40.h),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
                          backgroundColor: dayBasePrimary,
                          foregroundColor: dayTextIconsText_01,
                          textStyle: context.s14w700),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Добавить'),
                          Icon(Icons.add, color: dayTextIconsText_01, size: 24.h),
                        ],
                      ),
                    ),
                    SizedBox(height: 23.h),
                  ],
                ),
              ),
            ] else
              ...[],
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 32.h, bottom: 6.h),
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
