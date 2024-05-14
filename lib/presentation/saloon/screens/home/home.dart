import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/icon_app.dart';
import 'package:okoshki/presentation/app/widgets/icon_buton_circle.dart';
import 'package:okoshki/presentation/app/widgets/icon_logo_okoshki.dart';
import 'package:okoshki/presentation/app/widgets/preload/preload_list.dart';
import 'package:okoshki/presentation/app/widgets/title_windows.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/create_window/create_windows.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/create_window/create_windows_controller.dart';
import 'package:okoshki/presentation/saloon/screens/home/home_controller.dart';

import 'package:okoshki/presentation/saloon/widgets/preload/preload_window_saloon_card.dart';
import 'package:okoshki/presentation/saloon/widgets/window_card.dart';

@RoutePage()
class HomeSaloonScreen extends StatelessWidget {
  const HomeSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<HomeSaloonController>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: IconLogoOkoshki.saloon(),
          actions: [
            IconButtonApp(
              color: AppColors.hex696969,
              path: AppAssets.iconProfile,
              onPressed: () => appRouter.pushNamed(PathRoute.profileSaloonScreen),
            ),
          ],
        ),
        body: Observer(
          builder: (_) => controller.isLoading
              ? const PreloadListWidget(card: PreloadWindowsSaloonCard())
              : const ViewScreen(),
        ));
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomCenter,
      children: [
        WindowsList(),
        ButtomNavigationButton(),
      ],
    );
  }
}

class WindowsList extends StatelessWidget {
  const WindowsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<HomeSaloonController>();
    final dateTime = controller.dateTime;
    return RefreshIndicator(
        onRefresh: controller.refreshWindows,
        color: AppColors.hexFFFFFF,
        backgroundColor: AppColors.hex385EO,
        child: Observer(
          builder: (_) {
            final dayKeys = [dateTime.day, dateTime.day + 1, dateTime.day + 2];
            final windowsMap = controller.windowsGroupSort;
            return ListView(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 100),
              children: [
                TitleWindows(
                  day: 'Сегодня',
                  date: DateFormat('d LLL y').format(dateTime),
                ),
                windowsMap.keys.any((element) => element == dayKeys[0])
                    ? Column(
                        children: windowsMap[dayKeys[0]]!
                            .map((window) =>
                                WindowCard(window: window, isTime: true))
                            .toList(),
                      )
                    : const AddedWindow(),
                TitleWindows(
                  day: 'Завтра',
                  date: DateFormat('d LLL y').format(
                    dateTime.add(const Duration(days: 1)),
                  ),
                ),
                windowsMap.keys.any((element) => element == dayKeys[1])
                    ? Column(
                        children: windowsMap[dayKeys[1]]!
                            .map((window) =>
                                WindowCard(window: window, isTime: true))
                            .toList(),
                      )
                    : const AddedWindow(),
                TitleWindows(
                  day: 'Послезавтра',
                  date: DateFormat('d LLL y')
                      .format(dateTime.add(const Duration(days: 2))),
                ),
                windowsMap.keys.any((element) => element == dayKeys[2])
                    ? Column(
                        children: windowsMap[dayKeys[2]]!
                            .map(
                              (window) =>
                                  WindowCard(window: window, isTime: true),
                            )
                            .toList(),
                      )
                    : const AddedWindow(),
              ],
            );
          },
        ));
  }
}

class AddedWindow extends StatelessWidget {
  const AddedWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            final controllerWindow = sl<CreateWindowController>();
            showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) => CreateWindowBottomSheet(
                controller: controllerWindow,
              ),
            );
          },
          child: Container(
            height: 147,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.hexDADADA,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Добавить окошко',
                    style: AppTextStyles.s16w600h385EO,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.add,
                      color: AppColors.hex385EO,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtomNavigationButton extends StatelessWidget {
  const ButtomNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButtonCircle(
            icon: AppAssets.iconQr,
            onPressed: () => appRouter.pushNamed(PathRoute.scanningQrSaloonScreen),
            isSaloon: true,
          ),
          IconButtonCircle(
            icon: AppAssets.iconAdd,
            onPressed: () {
              final controllerWindow = sl<CreateWindowController>();
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => CreateWindowBottomSheet(
                  controller: controllerWindow,
                ),
              );
            },
            isSaloon: true,
          ),
        ],
      ),
    );
  }
}
