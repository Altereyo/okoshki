import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load_circle.dart';

class PreloadServiceSaloonCard extends StatelessWidget {
  const PreloadServiceSaloonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                ContLoad(height: 14, width: 109),
                SizedBox(width: 8),
                ContLoadCircle(height: 20, width: 20),
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
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            ContLoad(height: 10, width: double.infinity),
            SizedBox(height: 8),
            ContLoad(height: 10, width: double.infinity),
            SizedBox(height: 8),
            ContLoad(height: 10, width: double.infinity),
            SizedBox(height: 8),
            ContLoad(height: 10, width: 168),
          ],
        ),
      ],
    );
  }
}
