import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/utils.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';

Future<int?> workTypeMenu(BuildContext context, GlobalKey globalKey, [bool showDoneItem = false]) async {
  return await showMenu<int?>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.h),
    ),
    context: context,
    color: dayBaseBase_01,
    surfaceTintColor: dayBaseBase_01,
    position: position(globalKey, context),
    elevation: 10,
    constraints: BoxConstraints(maxWidth: 143.w, minHeight: 58.h),
    items: [
      for (int i = 0; i < workType.length; i++) ...[
        PopupMenuItem<int>(
          padding: EdgeInsets.only(left: 14.w, right: 14.w),
          value: i,
          height: 40.h,
          child: Text(workType[i], style: context.s13w500.copyWith(color: dayTextIconsText_02)),
        ),
      ],
    ],
  );
}
