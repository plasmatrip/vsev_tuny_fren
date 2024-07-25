import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/empty_works.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/works_list.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

enum PeopleType { employee, client }

@RoutePage()
class WorksView extends StatelessWidget {
  const WorksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Запись клиентов'),
        actions: [
          if (context.watch<WorkRepo>().repo.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async => AutoRouter.of(context).push(AddWorkView()),
                child: Container(
                  width: 56.w,
                  height: 35.h,
                  decoration: ShapeDecoration(
                    color: dayBasePrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                  ),
                  child: Icon(Icons.add, color: dayTextIconsText_01, size: 24.h),
                ),
              ),
            ),
          ],
        ],
      ),
      body: context.watch<WorkRepo>().repo.isEmpty ? const EmptyWorks() : const WorksList(),
    );
  }
}
