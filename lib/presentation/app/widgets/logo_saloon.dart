import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';

class LogoSaloon extends StatelessWidget {
  const LogoSaloon({super.key, required this.logo, required this.isPremium});
  final String? logo;
  final bool isPremium;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: logo != null
              ? Image.network(
                  logo!,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SvgPicture.asset(AppAssets.avatarSaloon);
                  },
                )
              : SvgPicture.asset(AppAssets.avatarSaloon),
        ),
        isPremium
            ? SvgPicture.asset(
                AppAssets.iconBadgePremium,
                height: 20,
                width: 20,
              )
            : const SizedBox(
                height: 20,
                width: 20,
              ),
      ],
    );
  }
}
