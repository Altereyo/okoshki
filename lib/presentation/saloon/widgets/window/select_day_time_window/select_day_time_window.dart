import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:okoshki/internal/ui/app_button_styles.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/saloon/widgets/text_field_hour_minute.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_day_time_window/select_day_time_window_controller.dart';

class SelectDayTimeWindow extends StatelessWidget {
  const SelectDayTimeWindow({super.key, required this.controller});
  final SelectDayTimeWindowController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'В какой день',
            style: AppTextStyles.s14w600h696969,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GroupButton(
            controller: GroupButtonController(
              selectedIndex: controller.selectDayButton,
            ),
            options: AppGroupButtonOptions.saloon,
            buttons: const [
              'Сегодня',
              'Завтра',
              'Послезавтра',
            ],
            onSelected: (_, index, __) => controller.selectDayButton = index,
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'В какое время',
            style: AppTextStyles.s14w600h696969,
          ),
        ),
        Row(
          children: [
            _textOne('c'),
            TextFiledHourMinute(
              text: controller.startHour,
              hintText: '09',
              onChanged: (hour) => controller.startHour = hour,
              isReadOnly: false,
            ),
            _textTwo(':'),
            TextFiledHourMinute(
              text: controller.startMinute,
              hintText: '30',
              onChanged: (minute) =>
                  controller.startMinute = minute,
              isReadOnly: false,
            ),
            _textOne('до'),
            TextFiledHourMinute(
              text: controller.endHour,
              hintText: '10',
              onChanged: (hour) => controller.endHour = hour,
              isReadOnly: false,
            ),
            _textTwo(':'),
            TextFiledHourMinute(
              text: controller.endMinute,
              hintText: '30',
              onChanged: (minute) =>
                  controller.endMinute = minute,
              isReadOnly: false,
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }
  Widget _textOne(String title) {
    return Text(title, style: AppTextStyles.s16w400h696969);
  }

  Widget _textTwo(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Text(title, style: AppTextStyles.s16w400h262626),
    );
  }
}
