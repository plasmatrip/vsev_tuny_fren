import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/date_dialog.dart';
import 'package:vsev_tuny_fren/app/models/work.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/work_item.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/work_type_menu.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';

class WorksList extends StatelessWidget {
  const WorksList({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    Iterable works = context.watch<WorkRepo>().works();
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 4.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  var workType = await workTypeMenu(context, globalKey);
                  if (workType != null && context.mounted) {
                    context.read<WorkRepo>().selectedWorkType = workType;
                  }
                },
                child: Row(
                  children: [
                    Text(
                      key: globalKey,
                      workType[context.watch<WorkRepo>().selectedWorkType],
                      style: context.s13w500.copyWith(color: dayTextIconsText_02),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.expand_more,
                      color: dayTextIconsText_02,
                      size: 24.h,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  var date = await dateDialog(context, context.read<WorkRepo>().selectedDate, true);
                  if (date != null && context.mounted) {
                    context.read<WorkRepo>().selectedDate = date;
                  }
                },
                child: Text(
                  DateFormat('dd MMMM y', 'ru').format(context.read<WorkRepo>().selectedDate),
                  style: context.s13w500.copyWith(color: dayTextIconsLink),
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              itemCount: works.length,
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemBuilder: (context, index) {
                Work work = works.elementAt(index);
                return WorkItem(work: work);
              },
            ),
          ),
        ],
      ),
    );
  }
}
