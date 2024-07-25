import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

class EmptyWorks extends StatelessWidget {
  const EmptyWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 24.h),
          SvgPicture.asset('assets/vectors/empty_works.svg', width: 327.w, height: 360.h),
          SizedBox(height: 24.h),
          Text('Нет записей', style: context.s15w400.copyWith(color: dayTextIconsText_01)),
          SizedBox(height: 12.h),
          FilledButton(
            onPressed: () async => AutoRouter.of(context).push(const AddWorkView()),
            style: context.extraBtn,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Добавить'),
                Icon(Icons.add, color: dayTextIconsText_01, size: 24.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
