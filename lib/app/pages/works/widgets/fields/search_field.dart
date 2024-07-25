import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/repository/work_repo.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: context.read<WorkRepo>().searchString);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 307.w,
      height: 44.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: ShapeDecoration(
        color: dayBaseClear_02.withOpacity(0.03),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        onChanged: (value) => context.read<WorkRepo>().searchString = value,
        style: context.s13w500.copyWith(color: dayTextIconsText_01),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Поиск по фамилии имени',
          hintStyle: context.s13w500.copyWith(color: dayTextIconsText_02),
          prefixIcon: SvgPicture.asset(
            'assets/icons/Search.svg',
            width: 24.h,
            height: 24.h,
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}
