import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/filters_history_stat/filters_history_stat_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/selection_date/selection_date.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:provider/provider.dart';

class FiltersHistoryStatBottomSheet extends StatelessWidget {
  const FiltersHistoryStatBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => sl<FiltersHistoryStatController>(),
      child: LayoutBottomSheet.saloon(title: 'Фильтры', children: [
        FilterPeriod(),
        FilterStatus(),
        const BottomButtons(),
      ]),
    );
  }
}


class FilterPeriod extends StatelessWidget {
  FilterPeriod({super.key});
  final buttons = [
    'Этот месяц',
    'Последний квартал',
    'Последнее полугодие',
    'С начала года',
    'Выбрать период',
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FiltersHistoryStatController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'За какой период',
          style: AppTextStyles.s14w600h696969,
        ),
        SizedBox(
          height: 56,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              GroupButton(
                options: AppGroupButtonOptions.saloon,
                controller: controller.periodController,
                isRadio: true,
                buttons: buttons,
                onSelected: (_, index, __) {
                  controller.periodButton = index;
                },
              ),
            ],
          ),
        ),
        Observer(
          builder: (_) => controller.isSelectPeriod
              ? const SelectPeriodDate()
              : Container(),
        ),
        const Divider(),
      ],
    );
  }
}

class SelectPeriodDate extends StatelessWidget {
  const SelectPeriodDate({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FiltersHistoryStatController>(context);
    return Row(
      children: [
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () async {
              final DateTime? selectionDateTime = await showModalBottomSheet(
                context: context,
                builder: (_) => SelectionDateButtomSheet(
                  recordDate: (
                    initialDate: controller.fromDateTime,
                    minimumDate: DateTime(2023),
                  ),
                ),
              );
              if (selectionDateTime != null) {
                controller.fromDateTime = selectionDateTime;
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text('С'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(
                      builder: (_) => Text(
                        controller.fromDateTime == null
                            ? 'Выберите дату'
                            : DateFormat.yMMMM()
                                .format(controller.fromDateTime!),
                        style: AppTextStyles.s16w600h262626,
                      ),
                    ),
                    SvgPicture.asset(
                      AppAssets.iconArrow,
                      height: 16,
                      width: 16,
                      colorFilter: ColorFilter.mode(
                        AppColors.hex385EO,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () async {
              final DateTime? selectionDateTime = await showModalBottomSheet(
                context: context,
                builder: (_) => SelectionDateButtomSheet(
                  recordDate: (
                    initialDate: controller.toDateTime,
                    minimumDate: DateTime(2023),
                  ),
                ),
              );
              if (selectionDateTime != null) {
                controller.toDateTime = selectionDateTime;
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text('По'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Observer(
                      builder: (_) => Text(
                        controller.toDateTime == null
                            ? 'Выберите дату'
                            : DateFormat.yMMMM().format(controller.toDateTime!),
                        style: AppTextStyles.s16w600h262626,
                      ),
                    ),
                    SvgPicture.asset(
                      AppAssets.iconArrow,
                      height: 16,
                      width: 16,
                      colorFilter: ColorFilter.mode(
                        AppColors.hex385EO,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _text(String title) {
    return Text(
      title,
      style: AppTextStyles.s14w400h696969,
    );
  }
}

class FilterStatus extends StatelessWidget {
  FilterStatus({super.key});

  final buttons = [
    'Выполнено',
    'Есть бронь',
    'Ждёт брони',
    'Клиент не пришёл',
    'Нет брони',
    'Отменено клиентом',
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FiltersHistoryStatController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Какие окошки показывать',
            style: AppTextStyles.s14w600h696969,
          ),
        ),
        GroupButton(
          controller: controller.statusController,
          isRadio: false,
          options: const GroupButtonOptions(groupingType: GroupingType.column),
          buttons: buttons,
          onSelected: (val, i, selected) =>
              debugPrint('Button: $val index: $i $selected'),
          buttonIndexedBuilder: (selected, index, context) {
            return RadioStatus(
              title: buttons[index],
              selected: selected,
              onTap: () {
                if (!selected) {
                  controller.statusController.selectIndex(index);
                  controller.statusSet.add(index);
                  return;
                }
                controller.statusController.unselectIndex(index);
                controller.statusSet.remove(index);
              },
            );
          },
        ),
      ],
    );
  }
}

class RadioStatus extends StatelessWidget {
  const RadioStatus(
      {super.key,
      required this.title,
      required this.selected,
      required this.onTap});

  final String title;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.s16w600h262626,
                softWrap: true,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onTap,
              child: selected
                  ? SvgPicture.asset(AppAssets.iconCheckboxActive)
                  : SvgPicture.asset(AppAssets.iconCheckboxNotActive),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = Provider.of<FiltersHistoryStatController>(context);
    return Observer(
      builder: (_) => controller.isResetButton
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonApp.small(
                  title: 'Сбросить',
                  onPressed: controller.onTapResetFilter,
                ),
                ButtonSaloon.small(
                  title: 'Применить',
                  onPressed: () async {
                    await controller.applyFilter();
                    if (context.mounted) {
                      appRouter.pop();
                    }
                  },
                ),
              ],
            )
          : ButtonSaloon.large(
              title: 'Применить',
              onPressed: () async {
                await controller.applyResetFilter();
                if (context.mounted) {
                  appRouter.pop();
                }
              },
            ),
    );
  }
}
