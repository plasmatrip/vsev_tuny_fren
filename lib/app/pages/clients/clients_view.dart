import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsev_tuny_fren/app/pages/clients/widgets/clients_list.dart';
import 'package:vsev_tuny_fren/app/pages/clients/widgets/empty_clients.dart';
import 'package:vsev_tuny_fren/app/repository/client_repo.dart';

@RoutePage()
class ClientsView extends StatelessWidget {
  const ClientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Клиенты'),
      ),
      body: context.watch<ClientRepo>().repo.isEmpty ? const EmptyClients() : const ClientsList(),
    );
  }
}
