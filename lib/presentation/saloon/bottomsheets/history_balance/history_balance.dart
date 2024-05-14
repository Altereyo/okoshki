import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/extensions/saloon_balance.dart';
import 'package:okoshki/domain/entities/saloon_balance.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/history_balance/history_balance_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/selection_date/selection_date.dart';

class HistoryBalanceBottomSheet extends StatefulWidget {
  const HistoryBalanceBottomSheet({super.key});

  @override
  State<HistoryBalanceBottomSheet> createState() =>
      _HistoryBalanceBottomSheetState();
}

class _HistoryBalanceBottomSheetState extends State<HistoryBalanceBottomSheet> {
  final controller = sl<HistoryBalanceController>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBottomSheet.saloon(
      title: 'История баланса',
      children: const [
        SelectPeriodDate(),
        Divider(),
        SaloonBalanceList(),
      ],
    );
  }
}

class SelectPeriodDate extends StatelessWidget {
  const SelectPeriodDate({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<HistoryBalanceController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
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
                  controller.setFromDateTime = selectionDateTime;
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
                  controller.setToDateTime = selectionDateTime;
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
                              : DateFormat.yMMMM()
                                  .format(controller.toDateTime!),
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
      ),
    );
  }

  Widget _text(String title) {
    return Text(
      title,
      style: AppTextStyles.s14w400h696969,
    );
  }
}

class SaloonBalanceList extends StatelessWidget {
  const SaloonBalanceList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<HistoryBalanceController>();
    return Observer(
      builder: (_) => controller.isLoading
          ? const SizedBox(
              height: 300,
              child: CircularLoadingWidget(isSaloon: true),
            )
          : Observer(
              builder: (_) => controller.saloonBalanceGroupSort.isEmpty
                  ? SizedBox(
                      height: 300,
                      child: Center(
                        child: Text(
                          'На данный момент здесь пусто',
                          style: AppTextStyles.s18w600h262626,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        ...controller.saloonBalanceGroupSort.entries.map(
                          (map) => SaloonBalanceCard(map: map),
                        ),
                      ],
                    ),
            ),
    );
  }
}

class SaloonBalanceCard extends StatelessWidget {
  const SaloonBalanceCard({super.key, required this.map});
  final MapEntry<String, List<SaloonBalance>> map;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          map.key,
          style: AppTextStyles.s14w600h696969,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: map.value.length,
          itemBuilder: (_, index) {
            final saloonBalance = map.value[index];
            return _card(saloonBalance);
          },
        ),
        const Divider(),
      ],
    );
  }

  Widget _card(SaloonBalance saloonBalance) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            saloonBalance.time,
            style: AppTextStyles.s16w400h696969,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                saloonBalance.transactionCategory ?? 'null',
                style: AppTextStyles.s16w600h262626,
                // softWrap: true,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          saloonBalance.transactionType == 'REFILL'
              ? Text(
                  saloonBalance.amountCurrency,
                  style: AppTextStyles.s16w600h385EO,
                )
              : Text(
                  saloonBalance.amountCurrency,
                  style: AppTextStyles.s16w600h262626,
                ),
        ],
      ),
    );
  }
}
