import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/extensions/saloon_schedule.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';

class SheduleInfoBottomSheet extends StatelessWidget {
  const SheduleInfoBottomSheet(
      {super.key,
      required this.saloonSheduleList,
      required this.currentDayOfTheWeek});
  final List<SaloonSchedule> saloonSheduleList;
  final int currentDayOfTheWeek;
  @override
  Widget build(BuildContext context) {
    return LayoutBottomSheet.customer(
      title: 'Режим работы',
      children: [
        Column(
          children: saloonSheduleList
              .map(
                (shedule) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shedule.getDayOfTheWeek,
                        style: currentDayOfTheWeek == shedule.weekDay
                            ? AppTextStyles.s16w400h43BCCE
                            : AppTextStyles.s16w400h262626,
                      ),
                      !shedule.weekend
                          ? Text(
                              shedule.timeStartEnd,
                              style: currentDayOfTheWeek == shedule.weekDay
                                  ? AppTextStyles.s16w600h43BCCE
                                  : AppTextStyles.s16w600h262626,
                            )
                          : Text(
                              'Выходной',
                              style: currentDayOfTheWeek == shedule.weekDay
                                  ? AppTextStyles.s16w600h43BCCE
                                  : AppTextStyles.s16w600h262626,
                            ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
