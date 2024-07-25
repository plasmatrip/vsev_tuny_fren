import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/boxes.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/delete_dalog.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/edit_delete_dialog.dart';
import 'package:vsev_tuny_fren/app/models/employee.dart';
import 'package:vsev_tuny_fren/app/models/settings.dart';
import 'package:vsev_tuny_fren/app/repository/employee_repo.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({
    required this.employee,
    super.key,
  });

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    return GestureDetector(
      onTap: () async => AutoRouter.of(context).push(SelectedEmployeeView(employeeKey: employee.key)),
      child: Container(
        width: 343.w,
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
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 76.h,
                height: 76.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.h),
                  image: DecorationImage(image: FileImage(File('${Hive.box<Settings>(Boxes.settings).getAt(0)!.appDir}/${employee.photo}')), fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 195.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${employee.surname} ${employee.name} ${employee.middleName}',
                      style: context.s15w400.copyWith(color: dayTextIconsText_01),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      employee.post,
                      style: context.s12w400.copyWith(color: dayTextIconsText_03),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      employee.phone,
                      style: context.s12w400.copyWith(color: dayTextIconsText_03),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    FilledButton(
                      onPressed: () async => AutoRouter.of(context).push(AddWorkView(employee: employee)),
                      style: context.btnOK.copyWith(
                        minimumSize: WidgetStatePropertyAll(Size(137.w, 24.h)),
                        maximumSize: WidgetStatePropertyAll(Size(137.w, 24.h)),
                        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Записать клиента'),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      var result = await editDeleteDialog(context, globalKey);
                      switch (result) {
                        case 'EDIT':
                          if (context.mounted) {
                            context.read<EmployeeRepo>().edit(employee.key);
                            AutoRouter.of(context).push(const AddEmployeeView());
                          }
                        case 'DELETE':
                          if (context.mounted) {
                            var result = await deleteDialog(context, 'Удалить сотрудника?');
                            if (result == 'DELETE' && context.mounted) {
                              context.read<EmployeeRepo>().delete(key: employee.key);
                            }
                          }
                      }
                    },
                    child: Icon(
                      key: globalKey,
                      Icons.more_vert,
                      color: dayBaseBase_05,
                      size: 24.h,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: dayBaseBase_05, size: 24.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
