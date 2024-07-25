import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/models/work.dart';
import 'package:vsev_tuny_fren/app/pages/main/widgets/empty_works.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/work_item.dart';

import 'package:vsev_tuny_fren/app/repository/work_repo.dart';

class CurrentWorks extends StatelessWidget {
  const CurrentWorks({super.key});

  @override
  Widget build(BuildContext context) {
    Iterable currentWorks = context.watch<WorkRepo>().currentWorks();
    if (currentWorks.isEmpty) {
      return const EmptyWorks();
    }
    return SizedBox(
      height: 164.h,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 26.h, top: 20.h),
        scrollDirection: Axis.horizontal,
        itemCount: currentWorks.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          Work work = currentWorks.elementAt(index);
          return WorkItem(work: work);
        },
      ),
    );
  }
}
