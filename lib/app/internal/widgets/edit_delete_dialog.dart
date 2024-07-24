// import 'package:esotericy/app/internal/const/colors.dart';
// import 'package:esotericy/app/internal/const/ui.dart';
// import 'package:esotericy/app/internal/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// Future<String?> editDeleteDialog(BuildContext context, GlobalKey globalKey, [bool showDoneItem = false]) async {
//   return await showMenu<String?>(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8.h),
//     ),
//     context: context,
//     color: shapeMono,
//     surfaceTintColor: shapeMono,
//     position: position(globalKey, context),
//     elevation: 10,
//     constraints: BoxConstraints(maxWidth: 135.w, maxHeight: 92.h),
//     items: [
//       PopupMenuItem<String>(
//         padding: EdgeInsets.only(left: 14.w, right: 14.w),
//         value: 'EDIT',
//         height: 40.h,
//         child: Text('Редактировать', style: context.s14w400.copyWith(color: colors_3)),
//       ),
//       PopupMenuDivider(
//         height: 0.5.h,
//       ),
//       PopupMenuItem<String>(
//         padding: EdgeInsets.only(left: 14.w, right: 14.w),
//         value: 'DELETE',
//         height: 40.h,
//         child: Text('Удалить', style: context.s14w400.copyWith(color: colors_6)),
//       ),
//     ],
//   );
// }
