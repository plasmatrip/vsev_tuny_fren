import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';

extension UI on BuildContext {
  TextStyle get s20w400 => TextStyle(fontSize: 20.h, fontFamily: 'Manrope', fontWeight: FontWeight.w400);
  TextStyle get s19w700 => TextStyle(fontSize: 19.h, fontFamily: 'Manrope', fontWeight: FontWeight.w700);
  TextStyle get s18w400 => TextStyle(fontSize: 18.h, fontFamily: 'Manrope', fontWeight: FontWeight.w400);
  TextStyle get s17w700 => TextStyle(fontSize: 17.h, fontFamily: 'Manrope', fontWeight: FontWeight.w700);
  TextStyle get s15w400 => TextStyle(fontSize: 15.h, fontFamily: 'Manrope', fontWeight: FontWeight.w400);
  TextStyle get s14w700 => TextStyle(fontSize: 14.h, fontFamily: 'Manrope', fontWeight: FontWeight.w700);
  TextStyle get s14w400 => TextStyle(fontSize: 14.h, fontFamily: 'Manrope', fontWeight: FontWeight.w400);
  TextStyle get s13w500 => TextStyle(fontSize: 13.h, fontFamily: 'Manrope', fontWeight: FontWeight.w500);
  TextStyle get s13w400 => TextStyle(fontSize: 13.h, fontFamily: 'Manrope', fontWeight: FontWeight.w400);
  TextStyle get s12w400 => TextStyle(fontSize: 12.h, fontFamily: 'Manrope', fontWeight: FontWeight.w400);
  TextStyle get s11w700 => TextStyle(fontSize: 11.h, fontFamily: 'Manrope', fontWeight: FontWeight.w700);
  TextStyle get s11w500 => TextStyle(fontSize: 11.h, fontFamily: 'Manrope', fontWeight: FontWeight.w500);

  ButtonStyle get extraBtn => FilledButton.styleFrom(
        fixedSize: Size(343.w, 40.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
        backgroundColor: dayBasePrimary,
        foregroundColor: dayTextIconsText_01,
        textStyle: s14w700,
      );

  ButtonStyle get btnOK => FilledButton.styleFrom(
        minimumSize: Size(110.w, 30.h),
        maximumSize: Size(110.w, 30.h),
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
        backgroundColor: dayBaseAccent_01,
        foregroundColor: dayTextIconsText_01,
        textStyle: s13w500,
      );

  ButtonStyle get btnCancel => FilledButton.styleFrom(
        minimumSize: Size(110.w, 30.h),
        maximumSize: Size(110.w, 30.h),
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
        backgroundColor: dayBaseBase_03,
        foregroundColor: dayTextIconsText_01,
        textStyle: s13w500,
      );
}
