import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/icon_buton_circle.dart';
import 'package:okoshki/presentation/app/widgets/preload/preload_list.dart';
import 'package:okoshki/presentation/saloon/screens/services/services_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_saloon/add_service_saloon.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_saloon/add_service_saloon_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_service/edit_service.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_service/edit_service_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/list_of_services_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/preload/preload_service_saloon_card.dart';

@RoutePage()
class ServicesSaloonScreen extends StatelessWidget {
  const ServicesSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<ServicesSaloonController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Услуги салона'),
      ),
      floatingActionButton: IconButtonCircle(
        isSaloon: true,
        icon: AppAssets.iconAdd,
        onPressed: () {
          final addServiceController = sl<AddServiceSaloonController>();
          showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (context) => AddServiceSaloonBottomSheet(
              controller: addServiceController,
            ),
          );
        },
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const PreloadListWidget(card: PreloadServiceSaloonCard())
            : const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<ServicesSaloonController>();
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      children: [
        Observer(
          builder: (_) => ListOfServicesSaloon(
            saloonDetail: controller.saloonDetail,
            onEditServiseType: (editServiceType) {
              final controllerEditService = sl<EditServiceController>(
                param1: editServiceType,
              );
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => EditServiceBottomSheet(
                  controller: controllerEditService,
                ),
              );
            },
            onRemoveServiseType: controller.removeServiseType,
          ),
        ),
      ],
    );
  }
}
