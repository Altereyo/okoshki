import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.distance});
  final String distance;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppAssets.iconLocation,
          height: 16,
          width: 16,
          colorFilter: ColorFilter.mode(
            AppColors.hex696969,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          distance,
          style: AppTextStyles.s12w400h696969,
        ),
      ],
    );
  }
}
