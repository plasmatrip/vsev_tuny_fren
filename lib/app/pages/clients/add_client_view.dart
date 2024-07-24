import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vsev_tuny_fren/app/pages/clients/widgets/fields/name_field.dart';

@RoutePage()
class AddClientView extends StatelessWidget {
  const AddClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Клиент'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
