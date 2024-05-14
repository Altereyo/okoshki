import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:group_button/group_button.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/list_tile_checbox_violet.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_service_to_window/edit_service_to_window_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_master_window/master_window.dart';
import 'package:okoshki/presentation/saloon/widgets/window/title_service.dart';
import 'package:okoshki/presentation/saloon/widgets/window/title_type_service.dart';
import 'package:provider/provider.dart';

class EditServiceToWindowBottomSheet extends StatelessWidget {
  const EditServiceToWindowBottomSheet({super.key, required this.controller});
  final EditServiceToWindowController controller;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => controller,
      child: Observer(
        builder: (_) => controller.isLoading
            ? const SizedBox(
                height: 100,
                child: CircularLoadingWidget(
                  isSaloon: true,
                ),
              )
            : LayoutBottomSheet.saloon(
                padding: EdgeInsets.fromLTRB(
                  16,
                  16,
                  16,
                  MediaQuery.of(context).viewInsets.bottom,
                ),
                title: 'Редактирование услуги',
                children: const [
                  BodyView(),
                  ButtonEdit(),
                ],
              ),
      ),
    );
  }
}

class BodyView extends StatefulWidget {
  const BodyView({super.key});

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EditServiceToWindowController>(context);

    return Observer(builder: (_) {
      if (controller.indexPage == 0) {
        return _selectTypeService();
      }
      if (controller.indexPage == 1) {
        return _selectService();
      }
      return _selectMaster();
    });
  }

  Widget _selectTypeService() {
    final controller = Provider.of<EditServiceToWindowController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GroupButton<ServiceType>(
        options: AppGroupButtonOptions.saloon,
        controller: GroupButtonController(
            selectedIndex: controller.selectSerType != null
                ? controller.servicesTypeSaloon.indexWhere(
                    (element) => controller.selectSerType!.id == element.id)
                : null),
        isRadio: true,
        buttons: controller.servicesTypeSaloon,
        buttonTextBuilder: (_, serviceType, __) {
          return serviceType.title;
        },
        onSelected: (serviceType, _, __) {
          controller.selectSerType = serviceType;
          controller.indexPage = 1;
        },
      ),
    );
  }

  Widget _selectService() {
    final controller = Provider.of<EditServiceToWindowController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTypeService(
            title: controller.selectSerType!.title,
            onPressed: () => controller.indexPage = 0,
          ),
          Column(
            children: controller.servicesSaloon
                .map(
                  (service) => ListTileCheckboxViolete(
                    title: service.title,
                    isValue: controller.selectService != null
                        ? service.id == controller.selectService!.id
                        : false,
                    onChanged: (val) {
                      controller.indexPage = 2;
                      controller.selectService = service;
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _selectMaster() {
    final controller = Provider.of<EditServiceToWindowController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTypeService(
            title: controller.selectSerType!.title,
            onPressed: () => controller.indexPage = 0,
          ),
          TitleService(
            title: controller.selectService!.title,
            onPressed: () => controller.indexPage = 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('Мастера и цены', style: AppTextStyles.s14w600h696969),
          ),
          ...controller.mastersWindowStoreList.map(
            (master) => MasterWindowWidget(store: master),
          ),
        ],
      ),
    );
  }
}

class ButtonEdit extends StatelessWidget {
  const ButtonEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<EditServiceToWindowController>(context);
    return Observer(
      builder: (_) => ButtonSaloon.large(
        title: 'Изменить',
        onPressed: controller.isEnabledButtonConfirm
            ? () async => appRouter.pop(controller.getWindowsServiceList)
            : null,
      ),
    );
  }
}
