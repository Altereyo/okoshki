import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/icon_buton_circle.dart';
import 'package:okoshki/presentation/app/widgets/preload/preload_list.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/filters_history_stat/filters_history_stat.dart';
import 'package:okoshki/presentation/saloon/screens/history_stat/history_stat_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/preload/preload_history_statistics_card.dart';
import 'package:okoshki/presentation/saloon/widgets/window_card.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HistoryStatSaloonScreen extends StatefulWidget {
  const HistoryStatSaloonScreen({super.key});

  @override
  State<HistoryStatSaloonScreen> createState() =>
      _HistoryStatSaloonScreenState();
}

class _HistoryStatSaloonScreenState extends State<HistoryStatSaloonScreen> {
  final controller = sl<HistoryStatSaloonController>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('История и статистика'),
      ),
      body: Provider(
        create: (_) => controller,
        child: Observer(
          builder: (_) => controller.isLoading
              ? const PreloadListWidget(card: PreloadHistoryStatistickCard())
              : const ViewScreen(),
        ),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ViewListHistoryStatistics(),
        ViewBottomButton(),
      ],
    );
  }
}

class ViewListHistoryStatistics extends StatelessWidget {
  const ViewListHistoryStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 100),
      children: const [
        ButtonFilterMonth(),
        StatisticsList(),
        HistoryWindowList(),
      ],
    );
  }
}

class ButtonFilterMonth extends StatefulWidget {
  const ButtonFilterMonth({super.key});

  @override
  State<ButtonFilterMonth> createState() => _ButtonFilterMonthState();
}

class _ButtonFilterMonthState extends State<ButtonFilterMonth> {
  List<String> get _buttons {
    final dateTime = DateTime.now();
    return [
      DateFormat.MMMM().format(dateTime),
      DateFormat.MMMM().format(DateTime(dateTime.year, dateTime.month - 1)),
      DateFormat.MMMM().format(DateTime(dateTime.year, dateTime.month - 2)),
    ];
  }

  String get _datePeriod {
    final controller = Provider.of<HistoryStatSaloonController>(context);
    final from = DateFormat.yMMM().format(controller.periodDate.from);
    final to = DateFormat.yMMM().format(controller.periodDate.to);
    return 'Период: $from - $to';
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HistoryStatSaloonController>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Observer(
          builder: (_) => controller.isFilter
              ? Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.hex385EO,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        _datePeriod,
                        style: AppTextStyles.s14w600hFFFFFF,
                      ),
                    ),
                  ],
                )
              : GroupButton(
                  controller: controller.groupButtonController,
                  options: AppGroupButtonOptions.saloon,
                  buttons: _buttons,
                  onSelected: (_, int index, __) {
                    controller.dateButton = index;
                  },
                ),
        ));
  }
}

class StatisticsList extends StatelessWidget {
  const StatisticsList({super.key});

  @override
  Widget build(BuildContext context) {
    final saloonStatistics =
        Provider.of<HistoryStatSaloonController>(context).saloonStatistics;
    return SizedBox(
      height: 108,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          StatisticsCard.numWindows(
            number: saloonStatistics.numWindows,
          ),
          StatisticsCard.numBookings(
            number: saloonStatistics.numBookings,
          ),
          StatisticsCard.amountProfit(
            number: saloonStatistics.amountProfit,
          ),
          StatisticsCard.windowsCommissions(
            number: saloonStatistics.windowsCommissions,
          ),
          StatisticsCard.numDoneWindows(
            number: saloonStatistics.numDoneWindows,
          ),
          StatisticsCard.numClientCancelWindows(
            number: saloonStatistics.numClientCancelWindows,
          ),
          StatisticsCard.numClientNotComeWindows(
            number: saloonStatistics.numClientNotComeWindows,
          ),
          StatisticsCard.numNotBookingWindows(
            number: saloonStatistics.numNotBookingWindows,
          ),
        ],
      ),
    );
  }
}

class StatisticsCard extends StatelessWidget {
  final String title;
  final int number;
  final TextStyle style;

  StatisticsCard.numWindows({
    super.key,
    required this.number,
  })  : title = 'Добавлено окошек',
        style = AppTextStyles.s26w600h262626;

  StatisticsCard.numBookings({
    super.key,
    required this.number,
  })  : title = 'Всего броней',
        style = AppTextStyles.s26w600h262626;

  StatisticsCard.amountProfit({
    super.key,
    required this.number,
  })  : title = 'Прибыль с окошек, ₽',
        style = AppTextStyles.s26w600h262626;

  StatisticsCard.windowsCommissions({
    super.key,
    required this.number,
  })  : title = 'Сумма комиссии, ₽',
        style = AppTextStyles.s26w600h262626;

  StatisticsCard.numDoneWindows({
    super.key,
    required this.number,
  })  : title = 'Выполнено броней',
        style = AppTextStyles.s26w600h385EO;

  StatisticsCard.numClientCancelWindows({
    super.key,
    required this.number,
  })  : title = 'Отменено клиентом',
        style = AppTextStyles.s26w600h979797;

  StatisticsCard.numClientNotComeWindows({
    super.key,
    required this.number,
  })  : title = 'Клиент не пришёл',
        style = AppTextStyles.s26w600hF64C4C;

  StatisticsCard.numNotBookingWindows({
    super.key,
    required this.number,
  })  : title = 'Окошки без брони',
        style = AppTextStyles.s26w600h262626;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.hexFFFFFF,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(4, 4),
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.s14w400h696969,
          ),
          Text(
            number.toString(),
            textAlign: TextAlign.center,
            style: style,
          ),
        ],
      ),
    );
  }
}

class HistoryWindowList extends StatelessWidget {
  const HistoryWindowList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HistoryStatSaloonController>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Observer(
        builder: (_) => Column(
          children: [
            ...controller.windowGroupSort.entries.map(
              (map) => _windowList(map),
            ),
          ],
        ),
      ),
    );
  }

  Widget _windowList(MapEntry<String, List<Window>> map) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          map.key,
          style: AppTextStyles.s14w600h696969,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: map.value.length,
          itemBuilder: (_, index) {
            final window = map.value[index];
            return WindowCard(window: window, isTime: false);
          },
        ),
      ],
    );
  }
}

class ViewBottomButton extends StatelessWidget {
  const ViewBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HistoryStatSaloonController>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButtonCircle(
            icon: AppAssets.iconDownload,
            onPressed: () async {
              await controller.getStatisticsPdf();
            },
            isSaloon: true,
          ),
          Observer(
            builder: (_) => IconButtonCircle(
              icon: AppAssets.iconFilter,
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => const FiltersHistoryStatBottomSheet(),
                );
              },
              isSaloon: true,
              isBadge: controller.isFilter,
            ),
          ),
        ],
      ),
    );
  }
}
