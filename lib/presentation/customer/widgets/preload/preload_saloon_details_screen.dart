import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/presentation/app/widgets/icon_app.dart';
import 'package:okoshki/presentation/app/widgets/icon_logo_okoshki.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load.dart';
import 'package:okoshki/presentation/app/widgets/preload/container_load_circle.dart';

class PreloadSaloonDetailsScreen extends StatelessWidget {
  const PreloadSaloonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.hexEAEAEA,
        actions: [
          IconButtonApp(
            color: AppColors.hex696969,
            path: AppAssets.iconShare,
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            //appBar
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 220,
                  color: AppColors.hexEAEAEA,
                  child: Center(
                    child: IconLogoOkoshki.white(),
                  ),
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.hexFFFFFF,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: AppColors.hexFFFFFF,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.iconFavorite,
                        height: 30,
                        width: 30,
                        colorFilter: ColorFilter.mode(
                          AppColors.hexEAEAEA,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //saloon card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      ContLoadCircle(height: 60, width: 60),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContLoad(height: 18, width: 198),
                          SizedBox(height: 8),
                          ContLoad(height: 18, width: 126),
                        ],
                      )
                    ],
                  ),
                  //add info
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContLoad(height: 10, width: 286),
                          SizedBox(height: 8),
                          ContLoad(height: 10, width: 157),
                        ],
                      ),
                      ContLoadCircle(height: 30, width: 30),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                          const ContLoad(height: 10, width: 18),
                          const SizedBox(width: 8),
                          SvgPicture.asset(AppAssets.iconFavorite,
                              height: 16, width: 16),
                          const ContLoad(height: 10, width: 18),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.iconFeedbacks,
                            height: 16,
                            width: 16,
                            colorFilter: ColorFilter.mode(
                              AppColors.hexEAEAEA,
                              BlendMode.srcIn,
                            ),
                          ),
                          const ContLoad(height: 10, width: 18),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ContLoad(height: 28, width: 100),
                      ContLoad(height: 28, width: 70),
                      ContLoad(height: 28, width: 74),
                      ContLoad(height: 28, width: 68),
                      ContLoad(height: 28, width: 118),
                      ContLoad(height: 28, width: 72),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Divider(color: AppColors.hexEAEAEA),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContLoad(height: 10, width: 132),
                      ContLoad(height: 10, width: 82),
                    ],
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
                  const SizedBox(height: 16),
                  Divider(color: AppColors.hexEAEAEA),
                  const SizedBox(height: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContLoad(height: 10, width: 157),
                      SizedBox(height: 16),
                      ContLoad(height: 10, width: double.infinity),
                      SizedBox(height: 4),
                      ContLoad(height: 10, width: double.infinity),
                      SizedBox(height: 4),
                      ContLoad(height: 10, width: double.infinity),
                      SizedBox(height: 4),
                      ContLoad(height: 10, width: double.infinity),
                      SizedBox(height: 4),
                      ContLoad(height: 10, width: 168),
                      SizedBox(height: 16),
                      ContLoad(height: 10, width: 157),
                      SizedBox(height: 16),
                      Wrap(
                        runSpacing: 4,
                        spacing: 4,
                        children: [
                          ContLoadCircle(height: 36, width: 36),
                          ContLoadCircle(height: 36, width: 36),
                          ContLoadCircle(height: 36, width: 36),
                          ContLoadCircle(height: 36, width: 36),
                        ],
                      ),
                      SizedBox(height: 16),
                      ContLoad(height: 36, width: 126),
                    ],
                  ),
                  Divider(color: AppColors.hexEAEAEA),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      ContLoad(height: 10, width: 157),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          ContLoadCircle(height: 46, width: 46),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContLoad(height: 10, width: 97),
                              SizedBox(height: 4),
                              ContLoad(height: 10, width: 55),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: AppColors.hexEAEAEA),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
