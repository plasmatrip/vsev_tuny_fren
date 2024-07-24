import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/boxes.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/edit_delete_dialog.dart';
import 'package:vsev_tuny_fren/app/models/employee.dart';
import 'package:vsev_tuny_fren/app/models/settings.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/employee_item.dart';
import 'package:vsev_tuny_fren/app/repository/employee_repo.dart';

class EmployeesList extends StatelessWidget {
  const EmployeesList({super.key});

  @override
  Widget build(BuildContext context) {
    Iterable employees = context.watch<EmployeeRepo>().employees();
    return ListView.separated(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 100.h),
      itemCount: employees.length,
      separatorBuilder: (context, index) => SizedBox(height: 8.h),
      itemBuilder: (context, index) {
        Employee employee = employees.elementAt(index);
        return EmployeeItem(employee: employee);
      },
    );
  }
}
