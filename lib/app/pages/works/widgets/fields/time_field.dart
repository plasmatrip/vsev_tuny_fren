import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/alert_dialog.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/fields/time_bottomsheet.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';

class TimeField extends StatelessWidget {
  const TimeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              if (context.read<WorkRepo>().employee == null && context.read<WorkRepo>().date == null) {
                await alertDialog(context, 'С начала выберите сотрудника и дату');
                return;
              }
              var time = await timeBottomSheet(context);
              if (time != null && context.mounted) {
                context.read<WorkRepo>().time = time;
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w, bottom: 2.h),
                  child: Text(
                    'Время сеанса',
                    style: context.s11w500.copyWith(color: context.watch<WorkRepo>().time != null ? dayTextIconsText_03 : dayBaseBase_02, height: 0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      context.watch<WorkRepo>().time != null
                          ? Text(periods[context.watch<WorkRepo>().time!], style: context.s13w500.copyWith(color: dayTextIconsText_01))
                          : Text('Время сеанса', style: context.s13w500.copyWith(color: dayTextIconsText_01)),
                      Icon(Icons.arrow_forward_ios, color: dayBaseBase_05, size: 20.h),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Divider(color: dayBaseClear_02.withOpacity(0.3), thickness: 0.5.h, height: 1.h),
              ],
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
