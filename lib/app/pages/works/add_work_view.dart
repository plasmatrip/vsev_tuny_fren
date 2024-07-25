import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/alert_dialog.dart';
import 'package:vsev_tuny_fren/app/models/employee.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/fields/client_field.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/fields/comment_field.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/fields/date_field.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/fields/employee_field.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/fields/name_field.dart';
import 'package:vsev_tuny_fren/app/pages/works/widgets/fields/time_field.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';

@RoutePage()
class AddWorkView extends StatelessWidget {
  const AddWorkView({super.key, this.employee});

  final Employee? employee;

  @override
  Widget build(BuildContext context) {
    if (employee != null && context.read<WorkRepo>().employee == null) {
      context.read<WorkRepo>().setEmployee(employee!);
    }
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.read<WorkRepo>().clean();
              AutoRouter.of(context).removeLast();
            },
            child: Icon(Icons.arrow_back, color: dayTextIconsText_02, size: 24.h),
          ),
          title: const Text('Сотрудник'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  if (context.read<WorkRepo>().editMode) {
                    context.read<WorkRepo>().delete();
                  } else {
                    context.read<WorkRepo>().clean();
                  }
                  AutoRouter.of(context).removeLast();
                },
                child: SvgPicture.asset('assets/icons/Trash.svg', width: 24.w, height: 24.h),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h, bottom: 92.h),
            child: const Column(
              children: [
                NameField(),
                CommentField(),
                ClientField(),
                EmployeeField(),
                DateField(),
                TimeField(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FilledButton(
          onPressed: () async {
            if (context.read<WorkRepo>().canSave()) {
              context.read<WorkRepo>().save();
              AutoRouter.of(context).maybePop(true);
            } else {
              await alertDialog(context, 'Заполните все поля.');
            }
          },
          style: context.btnOK.copyWith(
            backgroundColor: const WidgetStatePropertyAll(dayBasePrimary),
            minimumSize: WidgetStatePropertyAll(Size(120.w, 40.h)),
            maximumSize: WidgetStatePropertyAll(Size(120.w, 40.h)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Готово'),
              Icon(Icons.check, color: dayTextIconsText_01, size: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
