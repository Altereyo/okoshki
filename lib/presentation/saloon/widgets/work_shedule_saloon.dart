import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/domain/entities/extensions/saloon_schedule.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_work_shedule/edit_work_shedule.dart';
import 'package:okoshki/presentation/saloon/widgets/button_text_icon.dart';
import 'package:okoshki/presentation/saloon/widgets/title_bloc_page_profile_info.dart';

class WorkSheduleSaloon extends StatelessWidget {
  const WorkSheduleSaloon({super.key, required this.saloonSheduleList});
   final List<SaloonSchedule> saloonSheduleList;
  @override
  Widget build(BuildContext context) {
    return saloonSheduleList.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleBlocPageProfileInfo(
                title: 'Режим работы (необязательно)',
                subTitle: 'Ничего не добавлено',
              ),
              ButtonTextIcon(
                title: 'Добавить режим работы',
                onPressed: () {},
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleBlocPageProfileInfo(
                title: 'Режим работы (необязательно)',
                subTitle: null,
              ),
              Column(
                children: saloonSheduleList
                    .map(
                      (shedule) => Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              shedule.getDayOfTheWeek,
                              style: AppTextStyles.s16w400h262626,
                            ),
                            !shedule.weekend
                                ? Text(
                                    shedule.timeStartEnd,
                                    style: AppTextStyles.s16w600h262626,
                                  )
                                : Text(
                                    'Выходной',
                                    style: AppTextStyles.s16w600h262626,
                                  ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              ButtonApp.large(
                title: 'Редактировать',
                onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => const EditWorkSheduleBottomSheet(),
                ),
              ),
            ],
          );
  }
}
