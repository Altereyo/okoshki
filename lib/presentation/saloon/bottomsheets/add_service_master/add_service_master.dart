import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/list_tile_checbox_violet.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_master/add_service_master_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/button_service.dart';

class AddServiceMasterBottomSheet extends StatelessWidget {
  const AddServiceMasterBottomSheet({super.key, required this.controller});
  final AddServiceMasterController controller;
  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return LayoutBottomSheet.saloon(
      title: 'Новая услуга мастера',
      children: [
        Text('Направление', style: AppTextStyles.s14w600h696969),
        const SizedBox(height: 16),
        Observer(builder: (_) {
          if (controller.indexPage == 0) {
            return _servicesTypeList();
          } else {
            return _servicesList();
          }
        }),
        Observer(
          builder: (_) => ButtonSaloon.large(
            title: 'Подтвердить',
            onPressed: controller.isEnabledButSaveServices
                ? () async => appRouter.pop(controller.selectedServices)
                : null,
          ),
        ),
      ],
    );
  }

  Widget _servicesTypeList() {
    return Wrap(
        alignment: WrapAlignment.start,
        children: controller.servicesTypeSaloon
            .map(
              (serviceType) => ButtonService(
                title: serviceType.title,
                onTap: () => controller.setIndexPage(serviceType),
              ),
            )
            .toList());
  }

  Widget _servicesList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controller.isSelectedSerType!.title,
              style: AppTextStyles.s16w600h262626,
            ),
            IconButton(
              onPressed: () => controller.setIndexPage(null),
              icon: SvgPicture.asset(
                AppAssets.iconEdit,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
        const Divider(),
        controller.servSaloonSubtractingSerMaster().isEmpty
            ? Center(
                child: Text(
                    'Вы добавили все возможные услуги. Для расширения перечня услуг добавьте новые услуги в свой салон.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.s14w600h696969),
              )
            : Column(
                children: controller
                    .servSaloonSubtractingSerMaster()
                    .map(
                      (service) => ListTileCheckboxViolete(
                        title: service.title,
                        isValue: false,
                        onChanged: (val) {
                          if (val) {
                            controller.addListSelectedServices(service);
                          } else {
                            controller.removeListSelectedServices(service);
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
      ],
    );
  }
}
