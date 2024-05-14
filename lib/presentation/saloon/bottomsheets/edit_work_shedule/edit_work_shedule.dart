import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/domain/entities/extensions/saloon_schedule.dart';
import 'package:okoshki/presentation/app/widgets/checkbox_violet.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_work_shedule/edit_work_shedule_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/text_field_hour_minute.dart';

class EditWorkSheduleBottomSheet extends StatelessWidget {
  const EditWorkSheduleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<EditWorkSheduleController>();
    return LayoutBottomSheet.saloon(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      title: 'Режим работы',
      children: [
        Column(
          children: controller.editSheduleList
              .map((shedule) => TextFieldTimeWork(saloonShedule: shedule))
              .toList(),
        ),
        ButtonSaloon.large(
          title: 'Сохранить',
          onPressed: () async {
            await controller.updateShedule();
            if (context.mounted) {
              appRouter.pop();
            }
          },
        ),
      ],
    );
  }
}

class TextFieldTimeWork extends StatelessWidget {
  const TextFieldTimeWork({super.key, required this.saloonShedule});
  final SaloonSchedule saloonShedule;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            saloonShedule.getDayOfTheWeekAbbreviation,
            style: AppTextStyles.s16w600h262626,
          ),
          Row(
            children: [
              _textTwo('c'),
              TextFiledHourMinute(
                  text: saloonShedule.startHour,
                  hintText: '09',
                  onChanged: (startHour) {
                    //Устанавливает новый час
                    saloonShedule.startDateTime =
                        saloonShedule.startDateTime.copyWith(
                      hour: int.tryParse(startHour),
                    );
                  },
                  isReadOnly: false),
              _textOne(':'),
              TextFiledHourMinute(
                  text: saloonShedule.startMinute,
                  hintText: '30',
                  onChanged: (startMinute) {
                    saloonShedule.startDateTime =
                        saloonShedule.startDateTime.copyWith(
                      minute: int.tryParse(startMinute),
                    );
                  },
                  isReadOnly: false),
              _textTwo('до'),
              TextFiledHourMinute(
                  text: saloonShedule.endHour,
                  hintText: '19',
                  onChanged: (endHour) {
                    saloonShedule.endDateTime =
                        saloonShedule.endDateTime.copyWith(
                      hour: int.tryParse(endHour),
                    );
                  },
                  isReadOnly: false),
              _textOne(':'),
              TextFiledHourMinute(
                  text: saloonShedule.endMinute,
                  hintText: '30',
                  onChanged: (endMinute) {
                    saloonShedule.endDateTime =
                        saloonShedule.endDateTime.copyWith(
                      minute: int.tryParse(endMinute),
                    );
                  },
                  isReadOnly: false),
            ],
          ),
          CheckboxViolete(
            isValue: !saloonShedule.weekend,
            onChanged: (val) => saloonShedule.weekend = !val,
          ),
        ],
      ),
    );
  }

  Widget _textOne(String title) {
    return Text(title, style: AppTextStyles.s16w400h262626);
  }

  Widget _textTwo(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(title, style: AppTextStyles.s16w400h696969),
    );
  }
}
