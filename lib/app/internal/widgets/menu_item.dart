import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    required this.index,
    required this.text,
    required this.on,
    super.key,
  });

  final int index;
  final String text;
  final bool on;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 48.w,
      // height: 40.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              on ? 'assets/icons/on$index.svg' : 'assets/icons/off$index.svg',
              width: 24.w,
              height: 24.h,
              fit: BoxFit.cover,
            ),
            Text(
              text,
              style: context.s11w500.copyWith(color: on ? dayBaseAccentActive : dayBaseBase_06, letterSpacing: -0.5.w),
            )
          ],
        ),
      ),
    );
  }
}
