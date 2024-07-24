import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  // TextStyle get textUnderline => TextStyle(
  //       fontSize: 21.h,
  //       fontFamily: 'Neue Machina',
  //       fontWeight: FontWeight.w700,
  //       color: Colors.transparent,
  //       shadows: [
  //         Shadow(
  //           offset: Offset(0, -5.h),
  //           color: colors_3,
  //         ),
  //       ],
  //       decoration: TextDecoration.underline,
  //       decorationStyle: TextDecorationStyle.solid,
  //       decorationColor: colors_2,
  //       decorationThickness: 3.h,
  //       height: 0,
  //     );

  // ButtonStyle get extraBtn => FilledButton.styleFrom(
  //       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
  //       backgroundColor: colors_2,
  //       foregroundColor: colors_3,
  //       disabledBackgroundColor: colors_5,
  //       disabledForegroundColor: colors_4,
  //       minimumSize: Size(343.w, 46.h),
  //       maximumSize: Size(343.w, 46.h),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(12.h),
  //       ),
  //       textStyle: s15w500.copyWith(letterSpacing: -1.w),
  //     );
}
