// import 'package:auto_route/auto_route.dart';
// import 'package:esotericy/app/internal/const/colors.dart';
// import 'package:esotericy/app/internal/const/ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';

// Future<DateTime?> dateDialog(BuildContext context, DateTime? selectedDate, [bool showEvents = false]) {
//   const monthName = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'];
//   selectedDate ??= DateTime.now();

//   return showDialog<DateTime>(
//     context: context,
//     builder: (context) {
//       return StatefulBuilder(
//         builder: (context, setState) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
//             backgroundColor: shapeMono,
//             surfaceTintColor: shapeMono,
//             insetPadding: EdgeInsets.zero,
//             contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
//             clipBehavior: Clip.none,
//             content: SizedBox(
//               width: 308.w,
//               height: 305.h,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TableCalendar(
//                     locale: 'ru',
//                     focusedDay: selectedDate!,
//                     firstDay: DateTime(2010, 1, 1),
//                     lastDay: DateTime(2035, 1, 1),
//                     rowHeight: 28.h,
//                     weekNumbersVisible: false,
//                     calendarFormat: CalendarFormat.month,
//                     startingDayOfWeek: StartingDayOfWeek.monday,
//                     calendarStyle: CalendarStyle(
//                       cellAlignment: Alignment.center,
//                       cellMargin: EdgeInsets.all(3.h),
//                       cellPadding: EdgeInsets.zero,
//                       outsideDaysVisible: true,
//                       defaultTextStyle: context.s11w400.copyWith(color: colors_3),
//                       selectedTextStyle: context.s11w400.copyWith(color: colors_3),
//                       selectedDecoration: const BoxDecoration(
//                         color: colors_2,
//                         shape: BoxShape.circle,
//                       ),
//                       todayTextStyle: context.s11w400.copyWith(color: colors_3),
//                       todayDecoration: ShapeDecoration(
//                         shape: CircleBorder(side: BorderSide(color: colors_2, width: 0.5.h)),
//                       ),
//                       weekendTextStyle: context.s11w400.copyWith(color: colors_3),
//                       outsideTextStyle: context.s12w300.copyWith(color: colors_4),
//                     ),
//                     onDaySelected: (selectedDay, focusedDay) {
//                       setState(() {
//                         selectedDate = selectedDay;
//                       });
//                     },
//                     selectedDayPredicate: (day) {
//                       return isSameDay(selectedDate, day);
//                     },
//                     headerStyle: HeaderStyle(
//                       titleTextFormatter: (date, locale) => '${monthName[date.month - 1]} ${DateFormat.y('ru').format(date)}',
//                       titleCentered: true,
//                       headerPadding: EdgeInsets.zero,
//                       headerMargin: EdgeInsets.zero,
//                       formatButtonVisible: false,
//                       rightChevronMargin: EdgeInsets.zero,
//                       leftChevronMargin: EdgeInsets.zero,
//                       titleTextStyle: context.s17w400.copyWith(color: colors_3),
//                       leftChevronIcon: Icon(Icons.arrow_left, color: colors_2, size: 32.h),
//                       rightChevronIcon: Icon(Icons.arrow_right, color: colors_3, size: 32.h),
//                     ),
//                     daysOfWeekHeight: 20.h,
//                     daysOfWeekStyle: DaysOfWeekStyle(
//                       weekdayStyle: context.s8w400.copyWith(color: colors_4),
//                       weekendStyle: context.s8w400.copyWith(color: colors_4),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       FilledButton(
//                         style: FilledButton.styleFrom(
//                           padding: EdgeInsets.symmetric(horizontal: 16.w),
//                           backgroundColor: colors_3,
//                           foregroundColor: colors_2,
//                           minimumSize: Size(118.w, 34.h),
//                           maximumSize: Size(118.w, 34.h),
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(color: colors_2, width: 1.h),
//                             borderRadius: BorderRadius.circular(12.h),
//                           ),
//                           textStyle: context.s15w500, //.copyWith(letterSpacing: -1.w),
//                         ),
//                         onPressed: () => AutoRouter.of(context).maybePop(),
//                         child: const Text('Закрыть'),
//                       ),
//                       FilledButton(
//                         style: FilledButton.styleFrom(
//                           padding: EdgeInsets.symmetric(horizontal: 16.w),
//                           backgroundColor: colors_2,
//                           foregroundColor: colors_3,
//                           minimumSize: Size(118.w, 34.h),
//                           maximumSize: Size(118.w, 34.h),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.h),
//                           ),
//                           textStyle: context.s15w500, //.copyWith(letterSpacing: -1.w),
//                         ),
//                         onPressed: () => AutoRouter.of(context).maybePop(selectedDate),
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
