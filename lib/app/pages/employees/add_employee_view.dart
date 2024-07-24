import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/alert_dialog.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/fields/birthday_field.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/fields/comment_field.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/fields/excperience_field.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/fields/middle_name_field.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/fields/name_field.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/fields/phone_field.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/fields/photo_field.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/fields/post_field.dart';
import 'package:vsev_tuny_fren/app/pages/employees/widgets/fields/surname_field.dart';
import 'package:vsev_tuny_fren/app/repository/employee_repo.dart';

@RoutePage()
class AddEmployeeView extends StatelessWidget {
  const AddEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.read<EmployeeRepo>().clean();
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
                  if (context.read<EmployeeRepo>().editMode) {
                    context.read<EmployeeRepo>().delete();
                  } else {
                    context.read<EmployeeRepo>().clean();
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
                MiddleNameField(),
                SurnameField(),
                PostField(),
                ExperienceField(),
                BirtdayField(),
                PhoneField(),
                CommentField(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: PhotoField(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FilledButton(
          onPressed: () async {
            if (context.read<EmployeeRepo>().canSave()) {
              context.read<EmployeeRepo>().save();
              AutoRouter.of(context).maybePop(true);
            } else {
              await alertDialog(context, 'Заполните ФИО работника, должность, стаж работы и телефон.');
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
