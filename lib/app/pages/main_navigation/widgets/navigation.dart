import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/menu_item.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    required this.tabsRouter,
    super.key,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 83.h,
      padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 24.h),
      decoration: BoxDecoration(
        color: dayBaseBase_02,
        border: Border(
          top: BorderSide(width: 0.5.h, color: dayBaseBase_06),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TapRegion(
            behavior: HitTestBehavior.opaque,
            onTapInside: (event) => tabsRouter.setActiveIndex(0),
            child: tabsRouter.activeIndex == 0
                ? const MenuItem(
                    index: 1,
                    text: 'Главная',
                    on: true,
                  )
                : const MenuItem(
                    index: 1,
                    text: 'Главная',
                    on: false,
                  ),
          ),
          TapRegion(
            behavior: HitTestBehavior.opaque,
            onTapInside: (event) => tabsRouter.setActiveIndex(1),
            child: tabsRouter.activeIndex == 1
                ? const MenuItem(
                    index: 2,
                    text: 'Сотрудники',
                    on: true,
                  )
                : const MenuItem(
                    index: 2,
                    text: 'Сотрудники',
                    on: false,
                  ),
          ),
          TapRegion(
            behavior: HitTestBehavior.opaque,
            onTapInside: (event) => tabsRouter.setActiveIndex(2),
            child: tabsRouter.activeIndex == 2
                ? const MenuItem(
                    index: 3,
                    text: 'Клиенты',
                    on: true,
                  )
                : const MenuItem(
                    index: 3,
                    text: 'Клиенты',
                    on: false,
                  ),
          ),
          TapRegion(
            behavior: HitTestBehavior.opaque,
            onTapInside: (event) => tabsRouter.setActiveIndex(3),
            child: tabsRouter.activeIndex == 3
                ? const MenuItem(
                    index: 4,
                    text: 'Запись',
                    on: true,
                  )
                : const MenuItem(
                    index: 4,
                    text: 'Запись',
                    on: false,
                  ),
          ),
          TapRegion(
            behavior: HitTestBehavior.opaque,
            onTapInside: (event) => tabsRouter.setActiveIndex(4),
            child: tabsRouter.activeIndex == 4
                ? const MenuItem(
                    index: 5,
                    text: 'Настройки',
                    on: true,
                  )
                : const MenuItem(
                    index: 5,
                    text: 'Настройки',
                    on: false,
                  ),
          ),
        ],
      ),
    );
  }
}
