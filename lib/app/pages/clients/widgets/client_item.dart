import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/internal/const/colors.dart';
import 'package:vsev_tuny_fren/app/internal/const/ui.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/delete_dalog.dart';
import 'package:vsev_tuny_fren/app/internal/widgets/edit_delete_dialog.dart';
import 'package:vsev_tuny_fren/app/models/client.dart';
import 'package:vsev_tuny_fren/app/repository/client_repo.dart';
import 'package:vsev_tuny_fren/app/routing/app_router.gr.dart';

class ClientItem extends StatelessWidget {
  const ClientItem({
    required this.client,
    super.key,
  });

  final Client client;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async => AutoRouter.of(context).push(SelectedClientView(clientKey: client.key)),
      child: Container(
        width: 343.w,
        height: 84.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 24,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 283.w,
                  child: Text(
                    '${client.surname} ${client.name} ${client.middleName}',
                    style: context.s15w400.copyWith(color: dayTextIconsText_01),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 283.w,
                  child: Text(
                    client.phone,
                    style: context.s12w400.copyWith(color: dayTextIconsText_01),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    var result = await editDeleteDialog(context, globalKey);
                    switch (result) {
                      case 'EDIT':
                        if (context.mounted) {
                          context.read<ClientRepo>().edit(client.key);
                          AutoRouter.of(context).push(const AddClientView());
                        }
                      case 'DELETE':
                        if (context.mounted) {
                          var result = await deleteDialog(context, 'Удалить клиента?');
                          if (result == 'DELETE' && context.mounted) {
                            context.read<ClientRepo>().delete(key: client.key);
                            // AutoRouter.of(context).removeLast();
                          }
                        }
                    }
                  },
                  child: Icon(
                    key: globalKey,
                    Icons.more_vert,
                    color: dayBaseBase_05,
                    size: 24.h,
                  ),
                ),
                Icon(Icons.arrow_forward, color: dayBaseBase_05, size: 24.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
