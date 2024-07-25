import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/models/client.dart';
import 'package:vsev_tuny_fren/app/pages/works/works_view.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

class ClientField extends StatelessWidget {
  const ClientField({
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
              var client = await AutoRouter.of(context).push(PeopleSelector(type: PeopleType.client));
              if (client != null && context.mounted) {
                context.read<WorkRepo>().client = client as Client;
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w, bottom: 2.h),
                  child: Text(
                    'Клиент',
                    style: context.s11w500.copyWith(color: context.watch<WorkRepo>().client != null ? dayTextIconsText_03 : dayBaseBase_02, height: 0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      context.watch<WorkRepo>().client != null
                          ? Expanded(
                              child: Text(
                                '${context.watch<WorkRepo>().client!.surname} ${context.watch<WorkRepo>().client!.name} ${context.watch<WorkRepo>().client!.middleName}',
                                style: context.s13w500.copyWith(color: dayTextIconsText_01),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : Text('Клиент', style: context.s13w500.copyWith(color: dayTextIconsText_01)),
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
