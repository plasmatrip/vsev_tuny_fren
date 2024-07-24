import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/delete_dalog.dart';
import 'package:vsev_tuny_fren/app/models/client.dart';
import 'package:vsev_tuny_fren/app/repository/client_repo.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

@RoutePage()
class SelectedClientView extends StatefulWidget {
  const SelectedClientView({required this.clientKey, super.key});

  final int clientKey;

  @override
  State<SelectedClientView> createState() => _SelectedClientViewState();
}

class _SelectedClientViewState extends State<SelectedClientView> {
  late Client client;

  @override
  void initState() {
    client = context.read<ClientRepo>().repo.get(widget.clientKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => AutoRouter.of(context).removeLast(),
          child: Icon(Icons.arrow_back, color: dayTextIconsText_02, size: 24.h),
        ),
        title: const Text('Клиент'),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              context.read<ClientRepo>().edit(widget.clientKey);
              var result = await AutoRouter.of(context).push(const AddClientView());
              if (result == true) {
                setState(() {
                  context.read<ClientRepo>().repo.get(widget.clientKey);
                });
              }
            },
            child: SvgPicture.asset('assets/icons/Edit_01.svg', width: 24.w, height: 24.h),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w, left: 8.w),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                var result = await deleteDialog(context, 'Удалить клиента?');
                if (result == 'DELETE' && context.mounted) {
                  context.read<ClientRepo>().delete(key: widget.clientKey);
                  AutoRouter.of(context).removeLast();
                }
              },
              child: SvgPicture.asset('assets/icons/Trash.svg', width: 24.w, height: 24.h),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h, bottom: 92.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${client.surname} ${client.name} ${client.middleName}',
                style: context.s19w700.copyWith(color: dayTextIconsText_01),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/phone.svg', width: 24.w, height: 24.h),
                  SizedBox(width: 8.w),
                  Text(
                    client.phone,
                    style: context.s14w400.copyWith(color: const Color(0xFF5F6264)),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/Telegram.svg', width: 24.w, height: 24.h),
                  SizedBox(width: 8.w),
                  Text(
                    client.telegram,
                    style: context.s14w400.copyWith(color: const Color(0xFF5F6264)),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Text('@', style: context.s19w700.copyWith(color: dayTextIconsText_01)),
                  SizedBox(width: 8.w),
                  Text(
                    client.telegram,
                    style: context.s14w400.copyWith(color: const Color(0xFF5F6264)),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                client.comment,
                style: context.s13w500.copyWith(color: dayTextIconsText_01),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
