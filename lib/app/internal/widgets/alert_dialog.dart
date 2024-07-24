import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';

Future<String?> alertDialog(BuildContext context, String question) {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
            backgroundColor: dayBaseBase_02,
            surfaceTintColor: dayBaseBase_02,
            elevation: 7,
            actionsPadding: EdgeInsets.zero,
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              Container(
                width: 260.w,
                height: 120.h,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: Column(
                  children: [
                    Text(
                      question,
                      style: context.s11w700.copyWith(color: dayTextIconsText_01),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    FilledButton(
                      onPressed: () => Navigator.of(context, rootNavigator: true).pop('CANCEL'),
                      style: context.btnCancel,
                      child: const Text('Закрыть'),
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
