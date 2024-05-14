import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key, required this.counter});
  final int counter;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppAssets.iconFavorite,
          height: 16,
          width: 16,
          colorFilter: ColorFilter.mode(
            counter == 0 ? AppColors.hex696969: AppColors.hexDF49B5,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          counter < 99 ? '$counter' : '99+',
          style: AppTextStyles.s12w400h696969,
        ),
      ],
    );
  }
}
