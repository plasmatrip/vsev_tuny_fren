import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/fields/search_field.dart';
import 'package:vsev_tuny_fren/app/pages/works/works_view.dart';
import 'package:vsev_tuny_fren/app/repository/client_repo.dart';
import 'package:vsev_tuny_fren/app/repository/employee_repo.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

@RoutePage()
class PeopleSelector extends StatelessWidget {
  const PeopleSelector({required this.type, super.key});

  final PeopleType type;

  @override
  Widget build(BuildContext context) {
    Iterable peoples = switch (type) {
      PeopleType.client => context.watch<ClientRepo>().clients(serarchString: context.watch<WorkRepo>().searchString),
      PeopleType.employee => context.watch<EmployeeRepo>().employees(serarchString: context.watch<WorkRepo>().searchString),
    };
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => AutoRouter.of(context).removeLast(),
            child: Icon(Icons.arrow_back, color: dayTextIconsText_02, size: 24.h),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: const SearchField(),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h),
          child: Column(
            children: [
              FilledButton(
                onPressed: () async => switch (type) {
                  PeopleType.client => AutoRouter.of(context).push(const AddClientView()),
                  PeopleType.employee => AutoRouter.of(context).push(const AddEmployeeView()),
                },
                style: context.btnCancel.copyWith(
                  minimumSize: WidgetStatePropertyAll(Size(343.w, 35.w)),
                  maximumSize: WidgetStatePropertyAll(Size(343.w, 35.w)),
                  foregroundColor: const WidgetStatePropertyAll(dayBaseSecondary_02),
                ),
                child: Text(type == PeopleType.client ? 'Добавить клиента' : 'Добавить сотрудника'),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 4.h, bottom: 92.h),
                  itemCount: peoples.length,
                  separatorBuilder: (context, index) => SizedBox(height: 4.h),
                  itemBuilder: (context, index) {
                    var people = peoples.elementAt(index);
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async => AutoRouter.of(context).maybePop(people),
                      child: Container(
                        width: 343.w,
                        height: 24.h,
                        padding: const EdgeInsets.only(top: 3, left: 7, right: 12, bottom: 3),
                        child: Text(
                          '${people.surname} ${people.name} ${people.middleName}',
                          style: context.s13w500.copyWith(color: dayTextIconsText_02),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
