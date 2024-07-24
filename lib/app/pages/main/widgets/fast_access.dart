import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

class FastAccess extends StatelessWidget {
  const FastAccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 198.h,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () async => AutoRouter.of(context).navigate(const EmployeesView()),
            child: Image.asset(
              'assets/images/employees.png',
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () async => AutoRouter.of(context).navigate(const ClientsView()),
            child: Image.asset(
              'assets/images/clients.png',
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () async => AutoRouter.of(context).navigate(const WorksView()),
            child: Image.asset(
              'assets/images/work.png',
            ),
          ),
        ],
      ),
    );
  }
}
