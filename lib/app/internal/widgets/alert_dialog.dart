// import 'package:fitlife_manager/app/const/colors.dart';
// import 'package:fitlife_manager/app/const/ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// Future<String?> alertDialog(BuildContext context, String question) {
//   return showDialog<String>(
//     context: context,
//     builder: (context) {
//       return StatefulBuilder(
//         builder: (context, setState) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
//             backgroundColor: shape,
//             surfaceTintColor: shape,
//             elevation: 7,
//             actionsPadding: EdgeInsets.zero,
//             actionsAlignment: MainAxisAlignment.center,
//             actions: <Widget>[
//               Container(
//                 width: 331.w,
//                 height: 161.h,
//                 padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
//                 child: Column(
//                   children: [
//                     Text(
//                       question,
//                       style: context.s14w300s.copyWith(color: white),
//                       textAlign: TextAlign.center,
//                     ),
//                     const Spacer(),
//                     FilledButton(
//                       onPressed: () => Navigator.of(context, rootNavigator: true).pop('CANCEL'),
//                       style: context.btnPopupCancel,
//                       child: const Text('Закрыть'),
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
