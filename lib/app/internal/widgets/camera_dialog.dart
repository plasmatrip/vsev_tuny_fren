import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';

Future<String?> cameraDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
        backgroundColor: dayBaseBase_01,
        surfaceTintColor: dayBaseBase_01,
        shadowColor: const Color(0x3FABB1B9),
        elevation: 10,
        actionsPadding: EdgeInsets.zero,
        actionsAlignment: MainAxisAlignment.center,
        content: SizedBox(
          width: 100.w,
          height: 135.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: () => Navigator.of(context).pop('Camera'),
                style: context.btnOK,
                child: const Text('Камера'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop('Galery'),
                style: context.btnOK,
                child: const Text('Галерея'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
// 