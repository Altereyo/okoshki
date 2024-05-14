import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_to_window/add_service_to_window.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_to_window/add_service_to_window_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_service_to_window/edit_service_to_window.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_service_to_window/edit_service_to_window_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_icon_app.dart';
import 'package:okoshki/presentation/saloon/widgets/button_text_icon.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_window_service/select_window_service_controller.dart';
import 'package:provider/provider.dart';
import 'package:validators2/sanitizers.dart';

class SelectWindowService extends StatelessWidget {
  const SelectWindowService({super.key, required this.controller});
  final SelectWindowServiceController controller;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Какие услуги',
              style: AppTextStyles.s14w600h696969,
            ),
          ),
          Text(
            'Можно несколько',
            style: AppTextStyles.s14w400h696969,
          ),
          Observer(
            builder: (_) => Column(
              children: [
                ...controller.windowServices.toList().map(
                      (winSer) => WindowServicesCard(windowServices: winSer),
                    ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ButtonTextIcon(
              title: 'Добавить услуги',
              onPressed: () async {
                final controllerWindow = sl<AddServiceToWindowController>();
                final List<WindowService>? windowServices =
                    await showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => AddServiceToWindowBottomSheet(
                    controller: controllerWindow,
                  ),
                );
                if (windowServices != null) {
                  controller.windowServices.add(windowServices);
                  //add create
                  controller.createWindowService.add(windowServices);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WindowServicesCard extends StatelessWidget {
  const WindowServicesCard({super.key, required this.windowServices});
  final List<WindowService> windowServices;

  String price() {
    final listPrice = windowServices
        .map(
          (e) => toInt(e.price),
        )
        .toList();
    final minPrice = listPrice.reduce(min);
    final maxPrice = listPrice.reduce(max);
    if (minPrice == maxPrice) {
      return '$minPrice ₽';
    }
    return '$minPrice ₽ - $maxPrice ₽';
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SelectWindowServiceController>(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '${windowServices.first.service.serviceType.title}: ${windowServices.first.service.title}',
                style: AppTextStyles.s14w400h262626,
              ),
            ),
            ButtonIconApp.edit(
              onPressed: () async {
                final editController = sl<EditServiceToWindowController>(
                  param1: windowServices,
                );
                final List<WindowService>? windowServicesNew =
                    await showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => EditServiceToWindowBottomSheet(
                    controller: editController,
                  ),
                );

                if (windowServicesNew != null) {
                  //определяем был ли мастер (услуга)
                  for (var winSer in windowServicesNew) {
                    final isRes = windowServices.any(
                      (element) => element.master.id == winSer.master.id,
                    );
                    //если был то проверяем были ли изменения и обновляем
                    if (isRes) {
                      final isResMaster = windowServices.any(
                        (element) =>
                            element.service.id != winSer.service.id &&
                                element.master.id == winSer.master.id ||
                            element.price != winSer.price,
                      );
                      if (isResMaster) {
                        controller.updateWindowService.add([winSer]);
                      }
                    } else {
                      //если не было мастера(услуги) то создаем
                      controller.createWindowService.add([winSer]);
                    }
                  }
                  //проверка на удаление мастера(услуги)
                  for (var winSer in windowServices) {
                    final isRes = windowServicesNew.any(
                      (element) => element.master.id == winSer.master.id,
                    );
                    //если мастера нету в новом списке то удаляем
                    if (!isRes) {
                      controller.deleteWindowService.add([winSer]);
                    }
                  }
                  //замена услуги
                  controller.windowServices.add(windowServicesNew);
                  controller.windowServices.remove(windowServices);
                }
              },
            ),
            ButtonIconApp.delete(
              onPressed: () {
                controller.windowServices.remove(windowServices);
                controller.deleteWindowService.add(windowServices);
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlutterImageStack.widgets(
              itemCount: 3,
              totalCount: windowServices.length,
              itemRadius: 30,
              itemBorderWidth: 1,
              itemBorderColor: AppColors.hexFFFFFF,
              children: [
                ...windowServices.map(
                  (winSer) => ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: winSer.master.avatar != null
                        ? ImageNetworkIndicator(
                            src: winSer.master.avatar!,
                            height: 46,
                            width: 46,
                          )
                        : SvgPicture.asset(AppAssets.avatarMaster),
                  ),
                ),
              ],
            ),
            Text(
              price(),
              style: AppTextStyles.s16w600h262626,
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }
}
