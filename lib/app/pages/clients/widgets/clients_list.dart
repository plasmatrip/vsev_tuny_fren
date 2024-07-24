import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/models/client.dart';
import 'package:vsev_tuny_fren/app/pages/clients/widgets/client_item.dart';
import 'package:vsev_tuny_fren/app/repository/client_repo.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({super.key});

  @override
  Widget build(BuildContext context) {
    Iterable clients = context.watch<ClientRepo>().clients();
    return ListView.separated(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 100.h),
      itemCount: clients.length,
      separatorBuilder: (context, index) => SizedBox(height: 8.h),
      itemBuilder: (context, index) {
        Client client = clients.elementAt(index);
        return ClientItem(client: client);
      },
    );
  }
}
