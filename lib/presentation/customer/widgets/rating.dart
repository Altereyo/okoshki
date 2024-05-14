import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        rating == 0 ?  _iconRatingNull() :
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) => SvgPicture.asset(
            AppAssets.iconRating,
            colorFilter: ColorFilter.mode(
              AppColors.hexFFB444,
              BlendMode.srcIn,
            ),
          ),
          itemCount: 5,
          itemSize: 16.0,
          direction: Axis.horizontal,
        ),
        const SizedBox(width: 8),
        Text(
          rating.toString(),
          style: AppTextStyles.s14w400h696969,
        ),
      ],
    );
  }

  Widget _iconRatingNull(){
    return SvgPicture.asset(
            AppAssets.iconRating,
            colorFilter: ColorFilter.mode(
              AppColors.hex696969,
              BlendMode.srcIn,
            ),
          );
  }
}
