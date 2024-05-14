import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class FeedBacksWidget extends StatelessWidget {
  const FeedBacksWidget({super.key, required this.counter});
  final int counter;
  String get text {
    int num100 = counter % 100;
    if (num100 > 4 && num100 < 21)
      return 'отзывов';
    else {
      int num10 = num100 % 10;
      if (num10 == 1)
        return 'отзыв';
      else if (num10 > 1 && num10 < 5)
       return 'отзыва';
      else
      return 'отзывов';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppAssets.iconFeedbacks,
          height: 16,
          width: 16,
          colorFilter: ColorFilter.mode(
            AppColors.hex696969,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        counter == 0
            ? Text(
                '$counter',
                style: AppTextStyles.s14w400h696969,
              )
            : Text(
                '$counter $text',
                style: AppTextStyles.s14w400h43BCCE,
              ),
      ],
    );
  }
}
