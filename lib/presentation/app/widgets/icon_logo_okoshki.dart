import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

class IconLogoOkoshki extends StatelessWidget {
  IconLogoOkoshki.customer({
    super.key,
  }) : color = AppColors.hex43BCCE;

  IconLogoOkoshki.saloon({
    super.key,
  }) : color = AppColors.hex385EO;

  IconLogoOkoshki.white({
    super.key,
  }) : color = AppColors.hexFFFFFF;

  final Color color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.iconLogo,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
