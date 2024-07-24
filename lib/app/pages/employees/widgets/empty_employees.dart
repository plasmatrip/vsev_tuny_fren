import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

class EmptyEmployees extends StatelessWidget {
  const EmptyEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 64.h),
          SvgPicture.asset('assets/vectors/empty_employees.svg', width: 327.w, height: 320.h),
          SizedBox(height: 24.h),
          Text('Нет сотрудников', style: context.s15w400.copyWith(color: dayTextIconsText_01)),
          SizedBox(height: 12.h),
          FilledButton(
            onPressed: () async => AutoRouter.of(context).push(const AddEmployeeView()),
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
