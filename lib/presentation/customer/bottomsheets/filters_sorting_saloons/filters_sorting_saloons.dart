import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/checkbox_violet.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/customer/bottomsheets/filters_sorting_saloons/filters_sorting_saloons_controller.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';

class FiltersSortingSaloonsBottomSheet extends StatelessWidget {
  const FiltersSortingSaloonsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<FiltersSortingSaloonsController>();
    return Observer(
      builder: (_) => controller.isLoading
          ? const SizedBox(
              height: 200,
              child: CircularLoadingWidget(
                isSaloon: true,
              ),
            )
          : LayoutBottomSheet.customer(
              title: 'Фильтры и сортировка',
              children: const [
                  SaloonProfileBlock(),
                  DistanceBlock(),
                  ServiceCostBlock(),
                  DayRecording(),
                  SortingListSalonsBlock(),
                  BottomButtons(),
                ]),
    );
  }
}

class SaloonProfileBlock extends StatelessWidget {
  const SaloonProfileBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<FiltersSortingSaloonsController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Профиль салона',
            style: AppTextStyles.s14w600h696969,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GroupButton<ServiceType>(
            options: AppGroupButtonOptions.customer,
            controller: controller.buttonServicesController,
            isRadio: false,
            buttons: controller.servicesTypeList,
            buttonTextBuilder: (_, serviceType, __) {
              return serviceType.title;
            },
            onSelected: (ServiceType serviceType, int index, bool onSelected) {
              if (onSelected) {
                controller.servicesSelectedList.add(serviceType);
              } else {
                controller.servicesSelectedList.remove(serviceType);
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Observer(
                builder: (_) => InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () =>
                      controller.isWindowsButton = !controller.isWindowsButton,
                  child: controller.isWindowsButton
                      ? SvgPicture.asset(AppAssets.iconCheckboxActive)
                      : SvgPicture.asset(AppAssets.iconCheckboxNotActive),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Показывать только салоны с окошками',
                style: AppTextStyles.s14w600h262626,
              )
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class DistanceBlock extends StatelessWidget {
  const DistanceBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<FiltersSortingSaloonsController>();
    return controller.isGeolocation ? _viewBlock() : Container();
  }

  Widget _viewBlock() {
    final controller = sl<FiltersSortingSaloonsController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Удалённость от вас',
            style: AppTextStyles.s14w600h696969,
          ),
        ),
        Text(
          'Без учёта маршрута до салона',
          style: AppTextStyles.s14w400h696969,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              CheckboxViolete(
                isValue: controller.isActiveRadius,
                onChanged: (val) {
                  controller.distance = 0;
                  controller.distanceButton = 0;
                  controller.buttonDistanceController.selectIndex(0);
                  controller.isActiveRadius = val;
                },
              ),
              const SizedBox(width: 8),
              Text(
                'Указать радиус',
                style: AppTextStyles.s14w600h262626,
              )
            ],
          ),
        ),
        Observer(
          builder: (_) =>
              controller.isActiveRadius ? _slider() : _groupButton(),
        ),
        const Divider(),
      ],
    );
  }

  Widget _slider() {
    final controller = sl<FiltersSortingSaloonsController>();
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Slider(
                activeColor: AppColors.hex43BCCE,
                inactiveColor: AppColors.hexDADADA,
                thumbColor: AppColors.hexFFFFFF,
                value: controller.distance,
                max: 2000,
                min: 0,
                divisions: 20,
                onChanged: (value) => controller.distance = value,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0 м',
                    style: AppTextStyles.s12w400h696969,
                  ),
                  Text(
                    '1 км',
                    style: AppTextStyles.s12w400h696969,
                  ),
                  Text(
                    '2 км',
                    style: AppTextStyles.s12w400h696969,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 80,
          child: Center(
            child: Text(
              controller.distance < 1000
                  ? '${NumberFormat('###').format(controller.distance)} м'
                  : '${NumberFormat('###.0').format(controller.distance / 1000)} км',
              style: AppTextStyles.s14w600h262626,
            ),
          ),
        )
      ],
    );
  }

  Widget _groupButton() {
    final controller = sl<FiltersSortingSaloonsController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GroupButton(
        controller: controller.buttonDistanceController,
        options: AppGroupButtonOptions.customer,
        buttons: const [
          'Не важно',
          'до 500 м',
          'до 1 км',
          'до 2 км',
        ],
        onSelected: (String text, int index, bool onSelected) {
          switch (index) {
            case 0:
              {
                controller.distanceButton = 0;
                controller.distance = 0;
              }
            case 1:
              {
                controller.distanceButton = 1;
                controller.distance = 500;
              }
            case 2:
              {
                controller.distanceButton = 2;
                controller.distance = 1000;
              }
            case 3:
              {
                controller.distanceButton = 3;
                controller.distance = 2000;
              }
          }
        },
      ),
    );
  }
}

class ServiceCostBlock extends StatelessWidget {
  const ServiceCostBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<FiltersSortingSaloonsController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Стоимость услуги',
            style: AppTextStyles.s14w600h696969,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GroupButton(
            controller: controller.buttonCostController,
            options: AppGroupButtonOptions.customer,
            buttons: const [
              'Не важно',
              'до 1 000 ₽',
              'до 2 000 ₽',
              'до 5 000 ₽',
            ],
            onSelected: (_, int index, __) => controller.costButton = index,
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class DayRecording extends StatelessWidget {
  const DayRecording({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<FiltersSortingSaloonsController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'День и время записи',
            style: AppTextStyles.s14w600h696969,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GroupButton(
            controller: controller.buttonDayController,
            options: AppGroupButtonOptions.customer,
            buttons: const [
              'Не важно',
              'Сегодня',
              'Завтра',
              'Послезавтра',
            ],
            onSelected: (_, int index, __) => controller.dayButton = index,
          ),
        ),
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }
}

class SortingListSalonsBlock extends StatelessWidget {
  const SortingListSalonsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<FiltersSortingSaloonsController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Сортировка списка салонов',
            style: AppTextStyles.s14w600h696969,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GroupButton(
            controller: controller.buttonSortController,
            options: AppGroupButtonOptions.customer,
            buttons: const [
              'По удалённости от вас',
              'По алфавиту',
              'По популярности',
            ],
            onSelected: (_, int index, bool onSelected) =>
                controller.sortButton = index,
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<FiltersSortingSaloonsController>();
    return Observer(
      builder: (_) => controller.isResetButton
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonApp.small(
                  title: 'Сбросить',
                  onPressed: controller.onTapResetFiltersSortings,
                ),
                ButtonCustomer.small(
                  title: 'Применить',
                  onPressed: () async {
                    await controller.applySaloonFilters();
                    if (context.mounted) {
                      appRouter.pop();
                    }
                  },
                ),
              ],
            )
          : ButtonCustomer.large(
              title: 'Применить',
              onPressed: () async {
                await controller.applySaloonFilters();
                if (context.mounted) {
                  appRouter.pop();
                }
              },
            ),
    );
  }
}
