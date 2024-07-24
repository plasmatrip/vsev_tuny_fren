import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/employees_list.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/empty_employees.dart';
import 'package:vsev_tuny_fren/app/repository/employee_repo.dart';

@RoutePage()
class EmployeesView extends StatelessWidget {
  const EmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сотрудники'),
      ),
      body: context.watch<EmployeeRepo>().repo.isEmpty ? const EmptyEmployees() : const EmployeesList(),
    );
  }
}
