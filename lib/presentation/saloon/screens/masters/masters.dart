import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/icon_buton_circle.dart';
import 'package:okoshki/presentation/app/widgets/preload/preload_list.dart';
import 'package:okoshki/presentation/saloon/screens/masters/masters_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/create_master/create_master.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/create_master/create_master_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_master/edit_master.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_master/edit_master_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/list_of_masters.dart';
import 'package:okoshki/presentation/saloon/widgets/preload/preload_master_saloon_card.dart';

@RoutePage()
class MastersSaloonScreen extends StatelessWidget {
  const MastersSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<MastersSaloonController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мастера'),
      ),
      floatingActionButton: IconButtonCircle(
        isSaloon: true,
        icon: AppAssets.iconAdd,
        onPressed: () {
          final controllerMaster = sl<CreateMasterController>();
          showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (context) => CreateMasterBottomSheet(
              controller: controllerMaster,
            ),
          );
        },
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const PreloadListWidget(card: PreloadMasterSaloonCard())
            : const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<MastersSaloonController>();
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      children: [
        Observer(
          builder: (_) => ListOfMasters(
            saloonMastersList: controller.saloonMastersList.toList(),
            onDeleteMaster: (master) {
              controller.deleteMaster(master.id);
            },
            onEditMaster: (master) {
              final controllerMaster = sl<EditMasterController>(
                param1: master,
              );
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => EditMasterBottomSheet(
                  controller: controllerMaster,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
