import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load_circle.dart';

class PreloadSaloonCard extends StatelessWidget {
  const PreloadSaloonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              //
              const ContLoadCircle(height: 60, width: 60),
              const SizedBox(width: 16),
              //
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ////
                    const ContLoad(height: 14, width: 226),
                    ////
                    const ContLoad(height: 12, width: 156),
                    ////
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.iconRating,
                          height: 16,
                          width: 16,
                        ),
                        const ContLoad(height: 10, width: 18),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          AppAssets.iconFavorite,
                          height: 16,
                          width: 16,
                        ),
                        const ContLoad(height: 10, width: 18),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          AppAssets.iconLocation,
                          height: 16,
                          width: 16,
                        ),
                        const ContLoad(height: 10, width: 18),
                      ],
                    ),
                  ],
                ),
              ),
              //
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.hexEAEAEA,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 46,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (_, __) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Container(
                  height: 46,
                  width: 114,
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
