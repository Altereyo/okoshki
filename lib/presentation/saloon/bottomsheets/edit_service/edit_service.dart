import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/list_tile_checbox_violet.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_service/edit_service_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';

class EditServiceBottomSheet extends StatelessWidget {
  const EditServiceBottomSheet({super.key, required this.controller});
  final EditServiceController controller;
  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return LayoutBottomSheet.saloon(
      title: 'Изменить услугу',
      children: [
        Observer(
          builder: (_) => controller.isLoading
              ? const CircularLoadingWidget(isSaloon: true)
              : Column(
                  children: controller.servicesList
                      .map(
                        (service) => ListTileCheckboxViolete(
                          title: service.title,
                          isValue: controller.selectedService(service),
                          onChanged: (val) {
                            if (val) {
                              controller.addListSelectedServices(service.id);
                            } else {
                              controller.removeListSelectedServices(service.id);
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
        ),
        Observer(
          builder: (_) => ButtonSaloon.large(
            title: 'Сохранить',
            onPressed: controller.isEnabledButSaveChanges
                ? () async {
                    await controller.onPressedButSaveChanges();
                    if (context.mounted) {
                      appRouter.pop();
                    }
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
