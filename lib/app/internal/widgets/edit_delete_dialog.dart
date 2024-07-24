import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/utils.dart';

Future<String?> editDeleteDialog(BuildContext context, GlobalKey globalKey, [bool showDoneItem = false]) async {
  return await showMenu<String?>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.h),
    ),
    context: context,
    color: dayBaseBase_01,
    surfaceTintColor: dayBaseBase_01,
    position: position(globalKey, context),
    elevation: 10,
    constraints: BoxConstraints(maxWidth: 113.w, minHeight: 58.h),
    items: [
      PopupMenuItem<String>(
        padding: EdgeInsets.only(left: 14.w, right: 14.w),
        value: 'EDIT',
        height: 40.h,
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/Draft.svg', width: 16.w, height: 16.h),
            SizedBox(width: 6.w),
            Text('Изменить', style: context.s13w500.copyWith(color: dayTextIconsText_02)),
          ],
        ),
      ),
      PopupMenuItem<String>(
        padding: EdgeInsets.only(left: 14.w, right: 14.w),
        value: 'DELETE',
        height: 40.h,
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/Trash2.svg', width: 16.w, height: 16.h),
            SizedBox(width: 6.w),
            Text('Удалить', style: context.s13w500.copyWith(color: dayTextIconsText_02)),
          ],
        ),
      ),
    ],
  );
}
