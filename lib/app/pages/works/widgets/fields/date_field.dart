import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/date_dialog.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 45.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              var birtday = await dateDialog(context, context.read<WorkRepo>().date);
              if (birtday != null && context.mounted) {
                context.read<WorkRepo>().date = birtday;
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w, bottom: 2.h),
                  child: Text(
                    'Дата',
                    style: context.s11w500.copyWith(color: context.watch<WorkRepo>().date != null ? dayTextIconsText_03 : dayBaseBase_02, height: 0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: context.watch<WorkRepo>().date != null
                      ? Text(DateFormat('dd MMMM y', 'ru').format(context.watch<WorkRepo>().date!), style: context.s13w500.copyWith(color: dayTextIconsText_01))
                      : Text('Дата', style: context.s13w500.copyWith(color: dayTextIconsText_01)),
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
