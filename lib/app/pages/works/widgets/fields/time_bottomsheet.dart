import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';

Future<int?> timeBottomSheet(BuildContext context) async {
  int? time;
  final List<int> busyTime = context.read<WorkRepo>().busyTime(context.read<WorkRepo>().date!, context.read<WorkRepo>().employee!);
  return showModalBottomSheet(
    useSafeArea: true,
    context: context,
    showDragHandle: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => Container(
          width: 375.w,
          height: 252.h,
          padding: EdgeInsets.only(top: 4.h, left: 16.w, right: 16.w),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.h),
                topRight: Radius.circular(24.h),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 32.w,
                  height: 3.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF919DAA),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.h)),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => AutoRouter.of(context).maybePop(),
                  child: Icon(Icons.close, color: dayBaseBase_05, size: 24.h),
                ),
              ),
              SizedBox(height: 10.h),
              Text('Выбрать время сеанса', style: context.s14w700.copyWith(color: dayTextIconsText_01)),
              SizedBox(height: 20.h),
              Wrap(
                spacing: 4.w,
                runSpacing: 4.h,
                children: [
                  for (int i = 0; i < periods.length; i++) ...[
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (!busyTime.contains(i)) {
                          setState(() {
                            time = i;
                          });
                        }
                      },
                      child: Container(
                        width: 111.w,
                        height: 24.h,
                        decoration: ShapeDecoration(
                          color: busyTime.contains(i)
                              ? dayBaseBase_02
                              : i == time
                                  ? dayBaseBase_02
                                  : dayBaseBase_03,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.h,
                              color: busyTime.contains(i)
                                  ? Colors.black.withOpacity(0.2)
                                  : i == time
                                      ? dayBaseAccent_01
                                      : dayTextIconsText_03,
                            ),
                            borderRadius: BorderRadius.circular(8.h),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            periods[i],
                            style: context.s13w500.copyWith(
                                color: busyTime.contains(i)
                                    ? dayBaseBase_05
                                    : i == time
                                        ? dayBaseAccentActive
                                        : dayTextIconsText_03),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 20.h),
              FilledButton(
                onPressed: () => AutoRouter.of(context).maybePop(time),
                style: context.btnOK.copyWith(
                  minimumSize: WidgetStatePropertyAll(Size(343.w, 30.h)),
                  maximumSize: WidgetStatePropertyAll(Size(343.w, 30.h)),
                ),
                child: const Text('Готово'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
