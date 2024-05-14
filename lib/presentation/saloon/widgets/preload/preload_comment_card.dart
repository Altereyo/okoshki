import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load_circle.dart';

class PreloadCommentSaloonCard extends StatelessWidget {
  const PreloadCommentSaloonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const ContLoad(height: 10, width: 157),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                ContLoadCircle(height: 36, width: 36),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContLoad(height: 10, width: 97),
                    SizedBox(height: 8),
                    ContLoad(height: 10, width: 55),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.iconRating,
                  height: 16,
                  width: 16,
                ),
                SvgPicture.asset(
                  AppAssets.iconRating,
                  height: 16,
                  width: 16,
                ),
                SvgPicture.asset(
                  AppAssets.iconRating,
                  height: 16,
                  width: 16,
                ),
                SvgPicture.asset(
                  AppAssets.iconRating,
                  height: 16,
                  width: 16,
                ),
                SvgPicture.asset(
                  AppAssets.iconRating,
                  height: 16,
                  width: 16,
                ),
              ],
            ),
          ],
        ),

        ///
        const SizedBox(height: 16),
        const ContLoad(height: 10, width: double.infinity),
        const SizedBox(height: 8),
        const ContLoad(height: 10, width: double.infinity),
        const SizedBox(height: 8),
        const ContLoad(height: 10, width: 180),
        const SizedBox(height: 16),

   
      ],
    );
  }
}
