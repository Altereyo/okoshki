import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/icon_buton_circle.dart';
import 'package:okoshki/presentation/customer/screens/home/home_controller.dart';

class TutorialWidget extends StatelessWidget {
  const TutorialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<HomeCustomerController>();
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.hex000000Transparent05,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(AppAssets.arrow1Customer),
                    Text(
                      "Здесь настройки вашего\nпрофиля и уведомлений,\nа также справочная\nинформация",
                      textAlign: TextAlign.end,
                      style: AppTextStyles.s16w600hFFFFFF,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 238,
              height: 56,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.hexFFFFFF,
                  textStyle: AppTextStyles.s18w600h262626,
                  side: BorderSide(
                    width: 2.0,
                    color: AppColors.hexFFFFFF,
                  ),
                ),
                onPressed: controller.setIsTutorial,
                child: const Text('Закрыть подсказки'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Вид отображения предложений: списком или на карте',
                        textAlign: TextAlign.start,
                        style: AppTextStyles.s16w600hFFFFFF,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Фильтры и сортировка окошек, а также их поиск',
                        textAlign: TextAlign.end,
                        style: AppTextStyles.s16w600hFFFFFF,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(AppAssets.arrow2Customer),
                        const SizedBox(height: 8),
                        IconButtonCircle(
                          isSaloon: false,
                          onPressed: null,
                          icon: AppAssets.iconMap,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset(AppAssets.arrow3Customer),
                                const SizedBox(height: 8),
                                IconButtonCircle(
                                  isSaloon: false,
                                  onPressed: null,
                                  icon: AppAssets.iconSearch,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(AppAssets.arrow4Customer),
                                const SizedBox(height: 8),
                                IconButtonCircle(
                                  isSaloon: false,
                                  onPressed: null,
                                  icon: AppAssets.iconFilter,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
