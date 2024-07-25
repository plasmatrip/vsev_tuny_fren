import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/boxes.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/delete_dalog.dart';
import 'package:vsev_tuny_fren/app/models/employee.dart';
import 'package:vsev_tuny_fren/app/models/settings.dart';
import 'package:vsev_tuny_fren/app/repository/employee_repo.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

@RoutePage()
class SelectedEmployeeView extends StatefulWidget {
  const SelectedEmployeeView({required this.employeeKey, super.key});

  final int employeeKey;

  @override
  State<SelectedEmployeeView> createState() => _SelectedEmployeeViewState();
}

class _SelectedEmployeeViewState extends State<SelectedEmployeeView> {
  late Employee employee;

  @override
  void initState() {
    employee = context.read<EmployeeRepo>().repo.get(widget.employeeKey);
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
        title: const Text('Сотрудник'),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              context.read<EmployeeRepo>().edit(widget.employeeKey);
              var result = await AutoRouter.of(context).push(const AddEmployeeView());
              if (result == true) {
                setState(() {
                  employee = context.read<EmployeeRepo>().repo.get(widget.employeeKey);
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
                var result = await deleteDialog(context, 'Удалить сотрудника?');
                if (result == 'DELETE' && context.mounted) {
                  context.read<EmployeeRepo>().delete(key: widget.employeeKey);
                  AutoRouter.of(context).removeLast();
                }
              },
              child: SvgPicture.asset('assets/icons/Trash.svg', width: 24.w, height: 24.h),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.file(
                  File('${Hive.box<Settings>(Boxes.settings).getAt(0)!.appDir}/${employee.photo}'),
                  width: 375.w,
                  height: 375.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 352.h,
                  child: Container(
                    width: 375.w,
                    height: 30.h,
                    decoration: ShapeDecoration(
                      color: dayBaseBase_02,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.h),
                          topRight: Radius.circular(12.h),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${employee.surname} ${employee.name} ${employee.middleName}',
                    style: context.s19w700.copyWith(color: dayTextIconsText_01),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/phone.svg', width: 24.w, height: 24.h),
                      SizedBox(width: 8.w),
                      Text(
                        employee.phone,
                        style: context.s14w400.copyWith(color: const Color(0xFF5F6264)),
                      ),
                    ],
                  ),
                  Divider(color: dayBaseClearActive_02.withOpacity(0.2), thickness: 0.5.h, height: 24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 109.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Стаж работы:', style: context.s14w400.copyWith(color: dayTextIconsText_03)),
                            SizedBox(height: 8.h),
                            Text('Дата рождения:', style: context.s14w400.copyWith(color: dayTextIconsText_03)),
                            SizedBox(height: 8.h),
                            Text('Комментарий:', style: context.s14w400.copyWith(color: dayTextIconsText_03)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 226.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              employee.experience,
                              style: context.s14w400.copyWith(color: dayTextIconsText_01),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              DateFormat('dd MMMM y', 'ru').format(employee.birthday!),
                              style: context.s14w400.copyWith(color: dayTextIconsText_01),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              employee.comment,
                              style: context.s14w400.copyWith(color: dayTextIconsText_01),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledButton(
        onPressed: () {},
        style: context.extraBtn,
        child: const Text('Записать клиента'),
      ),
    );
  }
}
