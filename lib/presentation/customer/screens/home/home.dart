import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/icon_app.dart';
import 'package:okoshki/presentation/app/widgets/icon_logo_okoshki.dart';
import 'package:okoshki/presentation/app/widgets/icon_buton_circle.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/app/widgets/preload/preload_list.dart';
import 'package:okoshki/presentation/app/widgets/refresh_indicator.dart';
import 'package:okoshki/presentation/customer/bottomsheets/filters_sorting_saloons/filters_sorting_saloons.dart';
import 'package:okoshki/presentation/customer/screens/home/home_controller.dart';
import 'package:okoshki/presentation/customer/screens/search_saloons/search_saloons_controller.dart';
import 'package:okoshki/presentation/customer/widgets/map/map_widget.dart';
import 'package:okoshki/presentation/customer/widgets/not_results.dart';
import 'package:okoshki/presentation/customer/widgets/preload/preload_saloon_card.dart';
import 'package:okoshki/presentation/customer/widgets/saloon_card.dart';
import 'package:okoshki/presentation/customer/widgets/tutorial.dart';

@RoutePage()
class HomeCustomerScreen extends StatefulWidget {
  const HomeCustomerScreen({super.key});

  @override
  State<HomeCustomerScreen> createState() => _HomeCustomerScreenState();
}

class _HomeCustomerScreenState extends State<HomeCustomerScreen> {
  final appRouter = sl<AppRouter>();
  final controller = sl<HomeCustomerController>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: IconLogoOkoshki.customer(),
        actions: [
          IconButtonApp(
            path: AppAssets.iconProfile,
            color: AppColors.hex696969,
            onPressed: () =>
                appRouter.pushNamed(PathRoute.profileCustomerScreen),
          ),
        ],
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const PreloadListWidget(card: PreloadSaloonCard())
            : const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<HomeCustomerController>();
    return Observer(
      builder: (_) =>
          controller.isTutorial ? ViewSaloon() : const TutorialWidget(),
    );
  }
}

class ViewSaloon extends StatelessWidget {
  ViewSaloon({super.key});
  final controller = sl<HomeCustomerController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => controller.isLoading
          ? _bodyLoading()
          : controller.isMap
              ? const MapWidget()
              : const SaloonListWidget(),
    );
  }

  Widget _bodyLoading() {
    return controller.isMap
        ? const CircularLoadingWidget(isSaloon: false)
        : const PreloadListWidget(card: PreloadSaloonCard());
  }
}

class SaloonListWidget extends StatelessWidget {
  const SaloonListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<HomeCustomerController>();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Observer(
          builder: (_) {
            final saloonsList = controller.saloonsList.toList();
            return controller.isFiltersSorting && saloonsList.isEmpty
                ? const NotResultsWidget(
                    title: 'Увы, под заданные фильтры ничего не найдено',
                    subTitle: 'Попробуйте выбрать другие фильтры',
                  )
                : RefreshIndicatorApp.customer(
                    onRefresh: () => controller.onRefresh,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      controller: controller.controllerScroll,
                      children: saloonsList
                          .map((saloon) => Column(
                                children: [
                                  SaloonAndWindowCardWidget(
                                    saloon: saloon,
                                  ),
                                  const Divider(),
                                ],
                              ))
                          .toList(),
                    ),
                  );
          },
        ),
        const BottomNavigationBarWidget(),
      ],
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<HomeCustomerController>();
    return Observer(
      builder: (_) => controller.isNavigationBar
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(
                    builder: (_) => IconButtonCircle(
                      icon: controller.isMap
                          ? AppAssets.iconList
                          : AppAssets.iconMap,
                      isSaloon: false,
                      onPressed: () => controller.isMap = !controller.isMap,
                    ),
                  ),
                  const Spacer(),
                  Builder(
                    builder: (context) {
                      final isSearching = sl<AppRouter>().current.name ==
                          SearchSaloonsCustomerRoute.name;
                      final isSearchMap =
                          sl<SearchSaloonController>().isMap;
                      if (isSearching && isSearchMap) {
                        return const SizedBox();
                      }
                      return IconButtonCircle(
                        isSaloon: false,
                        icon: AppAssets.iconSearch,
                        onPressed: () => appRouter.pushNamed(
                          PathRoute.searchSaloonsCustomerScreen,
                        ),
                      );
                    },
                  ),
                  Observer(
                    builder: (_) => !controller.isMap
                        ? IconButtonCircle(
                            isSaloon: false,
                            icon: AppAssets.iconFilter,
                            isBadge: controller.isFiltersSorting,
                            onPressed: () => showModalBottomSheet(
                              isScrollControlled: true,
                              useSafeArea: true,
                              context: context,
                              builder: (context) =>
                                  const FiltersSortingSaloonsBottomSheet(),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
