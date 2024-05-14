import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/title_windows.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:okoshki/presentation/customer/widgets/window_list.dart';
import 'package:provider/provider.dart';

class BlockWindowsOfSaloon extends StatelessWidget {
  const BlockWindowsOfSaloon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        controller.windowsList.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Нет свободных окошек',
                  style: AppTextStyles.s16w400h696969,
                ),
              )
            : const WindowsList(),
        const Divider(),
      ],
    );
  }
}

class WindowsList extends StatelessWidget {
  const WindowsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    final dateTime = controller.dateTime;
    final dayKeys = [dateTime.day, dateTime.day + 1, dateTime.day + 2];
    final windowsMap = controller.windowsGroupSort;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        windowsMap.keys.any((element) => element == dayKeys[0])
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWindows(
                    day: 'Окошки сегодня',
                    date: DateFormat('d LLL y').format(dateTime),
                  ),
                  WindowsListWidget(
                    windows: windowsMap[dayKeys[0]]!,
                    saloonId: controller.saloonDetail.id,
                    isPremium: controller.saloonDetail.isPremium!,
                    isBlocking: controller.saloonDetail.salonBlocking!,
                  ),
                ],
              )
            : Container(),
        windowsMap.keys.any((element) => element == dayKeys[1])
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWindows(
                    day: 'Окошки завтра',
                    date: DateFormat('d LLL y').format(
                      dateTime.add(const Duration(days: 1)),
                    ),
                  ),
                  WindowsListWidget(
                    windows: windowsMap[dayKeys[1]]!,
                    saloonId: controller.saloonDetail.id,
                    isPremium: controller.saloonDetail.isPremium!,
                    isBlocking: controller.saloonDetail.salonBlocking!,
                  ),
                ],
              )
            : Container(),
        windowsMap.keys.any((element) => element == dayKeys[2])
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWindows(
                    day: 'Окошки послезавтра',
                    date: DateFormat('d LLL y').format(
                      dateTime.add(const Duration(days: 2)),
                    ),
                  ),
                  WindowsListWidget(
                    windows: windowsMap[dayKeys[2]]!,
                    saloonId: controller.saloonDetail.id,
                    isPremium: controller.saloonDetail.isPremium!,
                    isBlocking: controller.saloonDetail.salonBlocking!,
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
