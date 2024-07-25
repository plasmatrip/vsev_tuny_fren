import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/delete_dalog.dart';
import 'package:vsev_tuny_fren/app/models/client.dart';
import 'package:vsev_tuny_fren/app/models/employee.dart';
import 'package:vsev_tuny_fren/app/models/work.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

@RoutePage()
class SelectedWorkView extends StatefulWidget {
  const SelectedWorkView({required this.workKey, super.key});

  final int workKey;

  @override
  State<SelectedWorkView> createState() => _SelectedWorkViewState();
}

class _SelectedWorkViewState extends State<SelectedWorkView> {
  late Work work;
  late Employee? employee;
  late Client? client;

  @override
  void initState() {
    work = context.read<WorkRepo>().repo.get(widget.workKey);
    employee = work.employee!.isEmpty ? null : work.employee!.last as Employee;
    client = work.client!.isEmpty ? null : work.client!.last as Client;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => AutoRouter.of(context).removeLast(),
          child: Icon(Icons.arrow_back, color: dayTextIconsText_02, size: 24.h),
        ),
        title: const Text('Запись'),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              context.read<WorkRepo>().edit(widget.workKey);
              var result = await AutoRouter.of(context).push(AddWorkView());
              if (result == true) {
                setState(() {
                  work = context.read<WorkRepo>().repo.get(widget.workKey);
                  employee = work.employee!.isEmpty ? null : work.employee!.last as Employee;
                  client = work.client!.isEmpty ? null : work.client!.last as Client;
                });
              }
            },
            child: SvgPicture.asset('assets/icons/Edit_01.svg', width: 24.w, height: 24.h),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w, left: 8.w),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                var result = await deleteDialog(context, 'Удалить запись?');
                if (result == 'DELETE' && context.mounted) {
                  context.read<WorkRepo>().delete(key: widget.workKey);
                  AutoRouter.of(context).removeLast();
                }
              },
              child: SvgPicture.asset('assets/icons/Trash.svg', width: 24.w, height: 24.h),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.h, top: 12.h, bottom: 92.h),
          child: Column(
            children: [
              Text(work.name, style: context.s19w700.copyWith(color: dayTextIconsText_01)),
              SizedBox(height: 12.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Клиент:', style: context.s13w500.copyWith(color: dayTextIconsText_03)),
                      SizedBox(height: 4.h),
                      Text('Сотрудник:  ', style: context.s13w500.copyWith(color: dayTextIconsText_03)),
                      SizedBox(height: 4.h),
                      Text('Время:', style: context.s13w500.copyWith(color: dayTextIconsText_03)),
                      SizedBox(height: 4.h),
                      Text('Примечание:', style: context.s13w500.copyWith(color: dayTextIconsText_03)),
                    ],
                  ),
                  SizedBox(
                    width: 252.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          client == null ? 'Клиент удален из базы!' : '${client!.surname} ${client!.name} ${client!.middleName}',
                          style: context.s13w500.copyWith(color: dayTextIconsLink),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          employee == null ? 'Сотрудник удален из базы!' : '${employee!.surname} ${employee!.name} ${employee!.middleName}',
                          style: context.s13w500.copyWith(color: dayTextIconsLink),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(periods[work.time!], style: context.s13w500.copyWith(color: dayTextIconsText_01)),
                        SizedBox(height: 4.h),
                        Text(work.comment, style: context.s13w500.copyWith(color: dayTextIconsText_01)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
