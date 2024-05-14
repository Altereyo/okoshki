import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/list_tile_checbox_violet.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_saloon/add_service_saloon_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/button_service.dart';

class AddServiceSaloonBottomSheet extends StatelessWidget {
  const AddServiceSaloonBottomSheet({super.key, required this.controller});
  final AddServiceSaloonController controller;
  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return Observer(
      builder: (_) => controller.isLoading
          ? const CircularLoadingWidget(isSaloon: true)
          : LayoutBottomSheet.saloon(
              title: 'Добавить услугу',
              children: [
                controller.servicesTypeNotSaloonList.isNotEmpty
                    ? Text('Направление', style: AppTextStyles.s14w600h696969)
                    : Center(
                        child: Text(
                            'Вы добавили все возможные услуги. Для расширения перечня услуг обратитесь в службу поддержки сервиса "Окошки".',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.s14w600h696969),
                      ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) {
                    if (controller.indexPage == 0) {
                      return _servicesTypeList();
                    } else {
                      return _servicesList();
                    }
                  },
                ),
                controller.servicesTypeNotSaloonList.isNotEmpty
                    ? Observer(
                        builder: (_) => ButtonSaloon.large(
                          title: 'Подтвердить',
                          onPressed: controller.isEnabledButSaveServices
                              ? () async {
                                  await controller.addServicesToSaloonDetail();
                                  if (context.mounted) {
                                    appRouter.pop();
                                  }
                                }
                              : null,
                        ),
                      )
                    : ButtonApp.large(
                        title: 'Закрыть',
                        onPressed: appRouter.pop,
                      ),
              ],
            ),
    );
  }

  Widget _servicesTypeList() {
    return Wrap(
        alignment: WrapAlignment.start,
        children: controller.servicesTypeNotSaloonList
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
              controller.selectedSerType!.title,
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
        Column(
          children: controller
              .servicesSelectedSerTypeList()
              .map(
                (service) => ListTileCheckboxViolete(
                  title: service.title,
                  isValue: false,
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
      ],
    );
  }
}
