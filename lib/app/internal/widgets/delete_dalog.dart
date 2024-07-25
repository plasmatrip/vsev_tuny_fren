import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';

Future<String?> deleteDialog(BuildContext context, String question) {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
            backgroundColor: dayBaseBase_01,
            surfaceTintColor: dayBaseBase_01,
            elevation: 7,
            actionsPadding: EdgeInsets.zero,
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              Container(
                width: 260.w,
                height: 135.h,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Удалить', style: context.s14w700.copyWith(color: dayTextIconsText_01)),
                    // const Spacer(),
                    Text(
                      question,
                      style: context.s11w700.copyWith(color: dayTextIconsText_01),
                      textAlign: TextAlign.center,
                    ),
                    // const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilledButton(
                          style: context.btnCancel,
                          onPressed: () => Navigator.of(context, rootNavigator: true).pop('CANCEL'),
                          child: const Center(child: Text('Закрыть')),
                        ),
                        FilledButton(
                          style: context.btnOK,
                          onPressed: () => Navigator.of(context, rootNavigator: true).pop('DELETE'),
                          child: const Center(child: Text('Удалить')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
