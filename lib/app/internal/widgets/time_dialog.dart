// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:habit_builder/app/const/colors.dart';
// import 'package:habit_builder/app/const/ui.dart';
// import 'package:wheel_picker/wheel_picker.dart';

// Future<DateTime?> timeDialog(BuildContext context, DateTime? selectedTime) {
//   selectedTime ??= DateTime(0, 0, 0, 0, 30);
//   int hour = selectedTime.hour;
//   int minute = selectedTime.minute;

//   late final hoursWheel = WheelPickerController(
//     itemCount: 24,
//     initialIndex: hour,
//   );
//   late final minutesWheel = WheelPickerController(
//     itemCount: 60,
//     initialIndex: minute,
//     mounts: [hoursWheel],
//   );
//   final wheelStyle = WheelPickerStyle(
//     size: 170.h,
//     itemExtent: 65.h,
//     squeeze: 1.45,
//     diameterRatio: 1.2,
//     surroundingOpacity: .15,
//     magnification: 1.2,
//   );

//   Widget itemBuilder(BuildContext context, int index) {
//     return Text("$index".padLeft(2, '0'), style: context.s56w400.copyWith(color: grayscale_1));
//   }

//   return showDialog<DateTime>(
//     context: context,
//     builder: (context) {
//       return StatefulBuilder(
//         builder: (context, setState) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
//             backgroundColor: grayscale_6,
//             surfaceTintColor: grayscale_6,
//             insetPadding: EdgeInsets.zero,
//             contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
//             clipBehavior: Clip.none,
//             content: SizedBox(
//               width: 308.w,
//               height: 237.h,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Align(alignment: Alignment.centerLeft, child: Text('Время заниятия', style: context.s12w500.copyWith(color: grayscale_3))),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       WheelPicker(
//                         builder: itemBuilder,
//                         controller: hoursWheel,
//                         style: wheelStyle,
//                         onIndexChanged: (index) => hour = index,
//                       ),
//                       Text(' : ', style: context.s56w400.copyWith(color: grayscale_1)),
//                       WheelPicker(
//                         builder: itemBuilder,
//                         controller: minutesWheel,
//                         style: wheelStyle,
//                         enableTap: true,
//                         onIndexChanged: (index) => minute = index,
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       FilledButton(
//                         style: context.btnCancel.copyWith(
//                           minimumSize: MaterialStatePropertyAll(Size(104.w, 32.h)),
//                           maximumSize: MaterialStatePropertyAll(Size(104.w, 32.h)),
//                         ),
//                         onPressed: () => AutoRouter.of(context).maybePop(),
//                         child: const Text('Закрыть'),
//                       ),
//                       FilledButton(
//                         style: context.btnOk.copyWith(
//                           minimumSize: MaterialStatePropertyAll(Size(104.w, 32.h)),
//                           maximumSize: MaterialStatePropertyAll(Size(104.w, 32.h)),
//                         ),
//                         onPressed: () => AutoRouter.of(context).maybePop(DateTime(selectedTime!.year, selectedTime.month, selectedTime.day, hour, minute)),
//                         child: const Text('Выбрать'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }
