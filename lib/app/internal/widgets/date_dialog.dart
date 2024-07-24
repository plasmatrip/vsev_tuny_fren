import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';

Future<DateTime?> dateDialog(BuildContext context, DateTime? selectedDate, [bool showEvents = false]) {
  const monthName = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'];
  selectedDate ??= DateTime.now();

  return showDialog<DateTime>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
            backgroundColor: dayBaseBase_01,
            surfaceTintColor: dayBaseBase_01,
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 24.h),
            clipBehavior: Clip.none,
            content: SizedBox(
              width: 343.w,
              height: 388.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TableCalendar(
                    locale: 'ru',
                    focusedDay: selectedDate!,
                    firstDay: DateTime(2010, 1, 1),
                    lastDay: DateTime(2035, 1, 1),
                    rowHeight: 40.h,
                    weekNumbersVisible: false,
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                      cellAlignment: Alignment.center,
                      cellMargin: EdgeInsets.all(3.h),
                      cellPadding: EdgeInsets.zero,
                      outsideDaysVisible: false,
                      defaultTextStyle: context.s18w400.copyWith(color: dayTextIconsText_01),
                      selectedTextStyle: context.s18w400.copyWith(color: dayBaseAccentActive),
                      selectedDecoration: const BoxDecoration(),
                      todayTextStyle: context.s18w400.copyWith(color: dayTextIconsText_01),
                      todayDecoration: const BoxDecoration(),
                      weekendTextStyle: context.s18w400.copyWith(color: dayTextIconsText_01),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        selectedDate = selectedDay;
                      });
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDate, day);
                    },
                    headerStyle: HeaderStyle(
                      titleTextFormatter: (date, locale) => '${monthName[date.month - 1]} ${DateFormat.y('ru').format(date)}',
                      titleCentered: false,
                      headerPadding: EdgeInsets.zero,
                      headerMargin: EdgeInsets.zero,
                      formatButtonVisible: false,
                      rightChevronMargin: EdgeInsets.zero,
                      leftChevronMargin: EdgeInsets.zero,
                      titleTextStyle: context.s17w700.copyWith(color: dayTextIconsText_02),
                      leftChevronIcon: Icon(Icons.arrow_back_ios, color: dayBaseAccentActive, size: 24.h),
                      rightChevronIcon: Icon(Icons.arrow_forward_ios, color: dayBaseAccentActive, size: 24.h),
                    ),
                    daysOfWeekHeight: 20.h,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: context.s13w400.copyWith(color: dayTextIconsText_04),
                      weekendStyle: context.s13w400.copyWith(color: dayTextIconsText_04),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilledButton(
                        style: context.btnCancel.copyWith(
                          minimumSize: WidgetStatePropertyAll(Size(156.w, 30.h)),
                          maximumSize: WidgetStatePropertyAll(Size(156.w, 30.h)),
                        ),
                        onPressed: () => AutoRouter.of(context).maybePop(),
                        child: const Text('Отменить'),
                      ),
                      FilledButton(
                        style: context.btnOK.copyWith(
                          minimumSize: WidgetStatePropertyAll(Size(156.w, 30.h)),
                          maximumSize: WidgetStatePropertyAll(Size(156.w, 30.h)),
                        ),
                        onPressed: () => AutoRouter.of(context).maybePop(selectedDate),
                        child: const Text('Готово'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
