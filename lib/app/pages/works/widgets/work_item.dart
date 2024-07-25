import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/delete_dalog.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/edit_delete_dialog.dart';
import 'package:vsev_tuny_fren/app/models/client.dart';
import 'package:vsev_tuny_fren/app/models/employee.dart';
import 'package:vsev_tuny_fren/app/models/work.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

class WorkItem extends StatelessWidget {
  const WorkItem({
    required this.work,
    super.key,
  });

  final Work work;

  @override
  Widget build(BuildContext context) {
    final Employee? employee = work.employee!.isEmpty ? null : work.employee!.last as Employee;
    final Client? client = work.client!.isEmpty ? null : work.client!.last as Client;
    final GlobalKey globalKey = GlobalKey();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async => AutoRouter.of(context).push(SelectedWorkView(workKey: work.key)),
      child: Container(
        width: 343.w,
        height: 118.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 24,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    work.name,
                    style: context.s15w400.copyWith(color: dayBaseSecondary_02),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    var result = await editDeleteDialog(context, globalKey);
                    switch (result) {
                      case 'EDIT':
                        if (context.mounted) {
                          context.read<WorkRepo>().edit(work.key);
                          AutoRouter.of(context).push(const AddWorkView());
                        }
                      case 'DELETE':
                        if (context.mounted) {
                          var result = await deleteDialog(context, 'Удалить запись?');
                          if (result == 'DELETE' && context.mounted) {
                            context.read<WorkRepo>().delete(key: work.key);
                          }
                        }
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child: Icon(
                      key: globalKey,
                      Icons.more_vert,
                      color: dayBaseBase_05,
                      size: 24.h,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Клиент:', style: context.s13w500.copyWith(color: dayTextIconsText_03)),
                    SizedBox(height: 4.h),
                    Text('Сотрудник:  ', style: context.s13w500.copyWith(color: dayTextIconsText_03)),
                    SizedBox(height: 4.h),
                    Text('Время:', style: context.s13w500.copyWith(color: dayTextIconsText_03)),
                  ],
                ),
                SizedBox(
                  width: 240.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        client == null ? 'Клиент удален из базы!' : '${client.surname} ${client.name} ${client.middleName}',
                        style: context.s13w500.copyWith(color: dayTextIconsLink),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        employee == null ? 'Сотрудник удален из базы!' : '${employee.surname} ${employee.name} ${employee.middleName}',
                        style: context.s13w500.copyWith(color: dayTextIconsLink),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(periods[work.time!], style: context.s13w500.copyWith(color: dayTextIconsText_01)),
                          Icon(
                            Icons.arrow_forward,
                            color: dayBaseBase_05,
                            size: 24.h,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
