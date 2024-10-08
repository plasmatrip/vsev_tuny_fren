import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/alert_dialog.dart';
import 'package:vsev_tuny_fren/app/pages/clients/widgets/fields/comment_field.dart';
import 'package:vsev_tuny_fren/app/pages/clients/widgets/fields/email_field.dart';
import 'package:vsev_tuny_fren/app/pages/clients/widgets/fields/middle_name_field.dart';
import 'package:vsev_tuny_fren/app/pages/clients/widgets/fields/name_field.dart';
import 'package:vsev_tuny_fren/app/pages/clients/widgets/fields/phone_field.dart';
import 'package:vsev_tuny_fren/app/pages/clients/widgets/fields/surname_field.dart';
import 'package:vsev_tuny_fren/app/pages/clients/widgets/fields/telegram_field.dart';
import 'package:vsev_tuny_fren/app/repository/client_repo.dart';

@RoutePage()
class AddClientView extends StatelessWidget {
  const AddClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.read<ClientRepo>().clean();
              AutoRouter.of(context).removeLast();
            },
            child: Icon(Icons.arrow_back, color: dayTextIconsText_02, size: 24.h),
          ),
          title: const Text('Клиент'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  if (context.read<ClientRepo>().editMode) {
                    context.read<ClientRepo>().delete();
                  } else {
                    context.read<ClientRepo>().clean();
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
                PhoneField(),
                TelegramField(),
                EmailField(),
                CommentField(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FilledButton(
          onPressed: () async {
            if (context.read<ClientRepo>().canSave()) {
              context.read<ClientRepo>().save();
              AutoRouter.of(context).maybePop(true);
            } else {
              await alertDialog(context, 'Заполните ФИО клиента и его телефон.');
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
