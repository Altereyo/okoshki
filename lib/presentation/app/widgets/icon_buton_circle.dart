import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_colors.dart';

class IconButtonCircle extends StatelessWidget {
  const IconButtonCircle({
    super.key,
    this.icon,
    required this.onPressed,
    required this.isSaloon,
    this.isBadge,
    this.isGrey = false,
    this.googleIcon,
  });

  final void Function()? onPressed;
  final String? icon;
  final bool isSaloon;
  final bool? isBadge;
  final bool isGrey;
  final IconData? googleIcon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.5,
      onPressed: onPressed,
      fillColor: AppColors.hexFFFFFF,
      padding: googleIcon != null ? const EdgeInsets.all(14.0) : const EdgeInsets.all(16.0),
      shape: const CircleBorder(),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          googleIcon != null
              ? Icon(googleIcon, color: AppColors.hex696969, size: 28)
              : SvgPicture.asset(
                  icon!,
                  colorFilter: ColorFilter.mode(
                    isGrey
                        ? AppColors.hex696969
                        : isSaloon
                            ? AppColors.hex385EO
                            : AppColors.hex43BCCE,
                    BlendMode.srcIn,
                  ),
                ),
          isBadge != null && isBadge == true
              ? Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.hexDF49B5,
                  ),
                )
              : const SizedBox(
                  height: 10,
                  width: 10,
                )
        ],
      ),
    );
  }
}
