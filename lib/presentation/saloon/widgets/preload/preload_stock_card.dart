import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load.dart';

class PreloadStockCard extends StatelessWidget {
  const PreloadStockCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.hexFFFFFF,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 12,
            offset: Offset(0, 3),
            color: Colors.black12,
          ),
        ],
      ),
      child: Stack(
        children: [
          const SizedBox(height: 196),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.hexEAEAEA,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                   const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        ContLoad(height: 6, width: 106),
                        SizedBox(height: 16),
                        ContLoad(height: 12, width: 192),
                        SizedBox(height: 16),
                        ContLoad(height: 12, width: 192),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}

