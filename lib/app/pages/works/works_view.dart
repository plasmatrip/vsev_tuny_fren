import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/empty_works.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/works_list.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';

@RoutePage()
class WorksView extends StatelessWidget {
  const WorksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Запись клиентов'),
      ),
      body: context.watch<WorkRepo>().repo.isEmpty ? const EmptyWorks() : const WorksList(),
    );
  }
}
