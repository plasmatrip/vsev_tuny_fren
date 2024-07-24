import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:vsev_tuny_fren/app/internal/const/boxes.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/utils.dart';
import 'package:vsev_tuny_fren/app/models/settings.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async => openUrl(Hive.box<Settings>(Boxes.settings).getAt(0)!.privacyPolicyUri),
              child: SizedBox(
                height: 56.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Политика конфиденциальности', style: context.s15w400.copyWith(color: dayTextIconsText_01, letterSpacing: -1.w)),
                    SvgPicture.asset('assets/icons/Confendiality_02.svg', width: 24.h, height: 24.h),
                  ],
                ),
              ),
            ),
            Divider(color: dayBaseBase_05, thickness: 0.2.h, height: 1.h),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async => openUrl(Hive.box<Settings>(Boxes.settings).getAt(0)!.termsOfUseUri),
              child: SizedBox(
                height: 56.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Пользовательское соглашение', style: context.s15w400.copyWith(color: dayTextIconsText_01, letterSpacing: -1.w)),
                    SvgPicture.asset('assets/icons/Book_02.svg', width: 24.h, height: 24.h),
                  ],
                ),
              ),
            ),
            Divider(color: dayBaseBase_05, thickness: 0.2.h, height: 1.h),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                final InAppReview inAppReview = InAppReview.instance;
                if (await inAppReview.isAvailable()) {
                  await inAppReview.requestReview();
                }
              },
              child: SizedBox(
                height: 56.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Оценить приложение', style: context.s15w400.copyWith(color: dayTextIconsText_01, letterSpacing: -1.w)),
                    SvgPicture.asset('assets/icons/Star.svg', width: 24.h, height: 24.h),
                  ],
                ),
              ),
            ),
            Divider(color: dayBaseBase_05, thickness: 0.2.h, height: 1.h),
          ],
        ),
      ),
    );
  }
}
