import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

class ButtonFavorite extends StatelessWidget {
  const ButtonFavorite(
      {super.key, required this.isValue, required this.onPressed});
  final bool isValue;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.hexFFFFFFTransparent0,
      onTap: onPressed ,
      child: isValue
          ? SvgPicture.asset(
              AppAssets.iconFavorite,
              height: 30,
              width: 30,
              colorFilter: ColorFilter.mode(
                AppColors.hexDF49B5,
                BlendMode.srcIn,
              ),
            )
          : SvgPicture.asset(
              AppAssets.iconFavoriteOutline,
              height: 30,
              width: 30,
            ),
    );
  }
}
