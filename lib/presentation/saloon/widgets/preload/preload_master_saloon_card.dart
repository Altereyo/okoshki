import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load_circle.dart';

class PreloadMasterSaloonCard extends StatelessWidget {
  const PreloadMasterSaloonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                ContLoadCircle(height: 46, width: 46),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContLoad(height: 14, width: 120),
                    SizedBox(height: 8),
                    ContLoad(height: 10, width: 85),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.iconEdit,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.hexEAEAEA,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  AppAssets.iconDelete,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.hexEAEAEA,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 36,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (_, __) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Container(
                  height: 36,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.hexEAEAEA,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
