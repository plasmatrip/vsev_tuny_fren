import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/repository/client_repo.dart';

class SurnameField extends StatefulWidget {
  const SurnameField({
    super.key,
  });

  @override
  State<SurnameField> createState() => _SurnameFieldState();
}

class _SurnameFieldState extends State<SurnameField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: context.read<ClientRepo>().surname);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 45.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.w, bottom: 2.h),
                child: Text(
                  'Фамилия',
                  style: context.s11w500.copyWith(color: context.watch<ClientRepo>().surname.isNotEmpty ? dayTextIconsText_03 : dayBaseBase_02, height: 0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: TextField(
                  controller: controller,
                  onChanged: (value) => context.read<ClientRepo>().surname = value,
                  style: context.s13w500.copyWith(color: dayTextIconsText_01),
                  decoration: InputDecoration.collapsed(
                    border: InputBorder.none,
                    hintText: 'Фамилия',
                    hintStyle: context.s13w500.copyWith(color: dayTextIconsText_01),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Divider(color: dayBaseClear_02.withOpacity(0.3), thickness: 0.5.h, height: 1.h),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
