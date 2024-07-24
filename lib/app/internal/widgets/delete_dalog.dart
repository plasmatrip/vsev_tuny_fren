// import 'package:esotericy/app/internal/const/colors.dart';
// import 'package:esotericy/app/internal/const/ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// Future<String?> deleteDialog(BuildContext context, String question) {
//   return showDialog<String>(
//     context: context,
//     builder: (context) {
//       return StatefulBuilder(
//         builder: (context, setState) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
//             backgroundColor: shapeMono,
//             surfaceTintColor: shapeMono,
//             elevation: 7,
//             actionsPadding: EdgeInsets.zero,
//             actionsAlignment: MainAxisAlignment.center,
//             actions: <Widget>[
//               Container(
//                 width: 331.w,
//                 height: 173.h,
//                 padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
//                 child: Column(
//                   children: [
//                     Text('Удалить', style: context.s22w500.copyWith(color: colors_6)),
//                     const Spacer(),
//                     Text(
//                       question,
//                       style: context.s14w400.copyWith(color: colors_3),
//                       textAlign: TextAlign.center,
//                     ),
//                     const Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         FilledButton(
//                           style: FilledButton.styleFrom(
//                             padding: EdgeInsets.zero,
//                             backgroundColor: colors_3,
//                             foregroundColor: colors_2,
//                             minimumSize: Size(120.w, 34.h),
//                             maximumSize: Size(120.w, 34.h),
//                             shape: RoundedRectangleBorder(
//                               side: BorderSide(color: colors_2, width: 1.h),
//                               borderRadius: BorderRadius.circular(12.h),
//                             ),
//                             textStyle: context.s15w500.copyWith(height: 0),
//                           ),
//                           onPressed: () => Navigator.of(context, rootNavigator: true).pop('CANCEL'),
//                           child: const Center(child: Text('Закрыть')),
//                         ),
//                         FilledButton(
//                           style: FilledButton.styleFrom(
//                             padding: EdgeInsets.zero,
//                             backgroundColor: colors_6,
//                             foregroundColor: colors_3,
//                             minimumSize: Size(120.w, 34.h),
//                             maximumSize: Size(120.w, 34.h),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12.h),
//                             ),
//                             textStyle: context.s15w500.copyWith(height: 0),
//                           ),
//                           onPressed: () => Navigator.of(context, rootNavigator: true).pop('DELETE'),
//                           child: const Center(child: Text('Удалить')),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       );
//     },
//   );
// }
