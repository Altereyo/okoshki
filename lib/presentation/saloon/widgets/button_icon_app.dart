import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

class ButtonIconApp extends StatelessWidget {
  final void Function()? onPressed;
  final String asset;

  ButtonIconApp.add({
    super.key,
    required this.onPressed,
  }) : asset = AppAssets.iconAdd;

  ButtonIconApp.delete({
    super.key,
    required this.onPressed,
  }) : asset = AppAssets.iconDelete;

  ButtonIconApp.edit({
    super.key,
    required this.onPressed,
  }) : asset = AppAssets.iconEdit;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        asset,
        height: 24,
        width: 24,
        colorFilter: onPressed == null
            ? ColorFilter.mode(
                AppColors.hex696969,
                BlendMode.srcIn,
              )
            : ColorFilter.mode(
                AppColors.hex385EO,
                BlendMode.srcIn,
              ),
      ),
    );
  }
}
