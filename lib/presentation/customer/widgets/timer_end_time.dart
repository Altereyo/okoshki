import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class TimerEndTime extends StatelessWidget {
  const TimerEndTime({super.key, required this.endDateTime});
  final DateTime endDateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Text(
            'До начала осталось ',
            style: AppTextStyles.s14w400h696969,
          ),
          CountdownTimer(
            endTime: endDateTime.millisecondsSinceEpoch + 1000 * 30,
            widgetBuilder: (_, time) {
              if (time == null) {
                return Text(
                  '0',
                  style: AppTextStyles.s14w400hDF49B5,
                );
              }
              if (time.days != null) {
                return Text(
                  '${time.days} д ${time.hours} ч ${time.min} м ${time.sec} с',
                  style: AppTextStyles.s14w400hDF49B5,
                );
              }
              if (time.hours != null) {
                return Text(
                  '${time.hours} ч ${time.min} м ${time.sec} с',
                  style: AppTextStyles.s14w400hDF49B5,
                );
              }
              if (time.min != null) {
                return Text(
                  '${time.min} м ${time.sec} с',
                  style: AppTextStyles.s14w400hDF49B5,
                );
              }
              return Text(
                '${time.sec} с',
                style: AppTextStyles.s14w400hDF49B5,
              );
            },
            onEnd: () {
              //delete window?
            },
          ),
        ],
      ),
    );
  }
}
