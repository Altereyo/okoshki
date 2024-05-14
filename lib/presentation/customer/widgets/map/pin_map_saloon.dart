import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';

class PinMapSaloon extends StatefulWidget {
  const PinMapSaloon({
    required this.saloon,
    required this.onTap,
    required this.isOpened,
    super.key,
  });

  final Saloon saloon;
  final void Function(BuildContext, Saloon) onTap;
  final bool isOpened;

  @override
  State<PinMapSaloon> createState() => _PinMapSaloonState();
}

class _PinMapSaloonState extends State<PinMapSaloon> {
  final animationDuration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(context, widget.saloon),
      child: AnimatedScale(
        scale: widget.isOpened ? 1.2 : 1,
        duration: animationDuration,
        alignment: Alignment.center,
        child: Column(
          children: [
            AnimatedContainer(
              duration: animationDuration,
              alignment: Alignment.center,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: widget.isOpened
                    ? AppColors.hex43BCCE
                    : AppColors.hexFFFFFF,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: widget.saloon.logo != null
                        ? ImageNetworkIndicator(
                            src: widget.saloon.logo!,
                            height: 40,
                            width: 40,
                          )
                        : SvgPicture.asset(
                            AppAssets.avatarSaloon,
                            height: 40,
                            width: 40,
                          ),
                  ),
                  if (widget.saloon.isPremium)
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        AppAssets.iconBadgePremium,
                        height: 20,
                        width: 20,
                      ),
                    )
                ],
              ),
            ),
            AnimatedContainer(
              duration: animationDuration,
              height: 4,
              width: 4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(2),
                  bottomRight: Radius.circular(2),
                ),
                color: widget.isOpened
                    ? AppColors.hex43BCCE
                    : AppColors.hexFFFFFF,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
