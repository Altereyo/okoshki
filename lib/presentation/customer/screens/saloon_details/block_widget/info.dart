import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/extensions/saloon_detail.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/icon_app.dart';
import 'package:okoshki/presentation/app/widgets/logo_saloon.dart';
import 'package:okoshki/presentation/customer/bottomsheets/map_launcher/map_launcher.dart';
import 'package:okoshki/presentation/customer/bottomsheets/map_launcher/map_launcher_controller.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:okoshki/presentation/customer/widgets/favorite.dart';
import 'package:okoshki/presentation/customer/widgets/feedbacks.dart';
import 'package:okoshki/presentation/customer/widgets/location.dart';
import 'package:okoshki/presentation/customer/widgets/rating.dart';
import 'package:provider/provider.dart';

class BlockInfoOfSaloon extends StatelessWidget {
  const BlockInfoOfSaloon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //logo + title
        Row(
          children: [
            LogoSaloon(
              logo: controller.saloonDetail.logo,
              isPremium: controller.saloonDetail.isPremium!,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                controller.saloonDetail.title!,
                style: AppTextStyles.s26w600h262626,
              ),
            )
          ],
        ),

        //distanse + navigation
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.saloonDetail.address?.toString() ?? '',
                      style: AppTextStyles.s16w400h262626,
                    ),
                    const SizedBox(height: 4),
                    controller.saloonDetail.distance == null
                        ? Container()
                        : LocationWidget(
                            distance: controller.saloonDetail.distanceToString,
                          ),
                  ],
                ),
              ),
              if (controller.saloonDetail.address != null)
                IconButtonApp(
                  size: 24,
                  path: AppAssets.iconWay,
                  color: AppColors.hex43BCCE,
                  onPressed: () async {
                    final recordSaloon = (
                      title: controller.saloonDetail.title ?? '',
                      address: controller.saloonDetail.address!,
                    );
                    final mapLauncherCustomerController =
                        sl<MapLauncherCustomerController>(
                      param1: recordSaloon,
                    );
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      context: context,
                      builder: (context) => MapLauncherSheet(
                        controller: mapLauncherCustomerController,
                      ),
                    );
                  },
                )
            ],
          ),
        ),

        //rating + favorite + comments
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                RatingWidget(
                  rating: controller.saloonDetail.rating ?? 0,
                ),
                const SizedBox(width: 16),
                FavoriteWidget(
                  counter: controller.saloonDetail.usersLiked ?? 0,
                ),
              ],
            ),
            FeedBacksWidget(
              counter: controller.commentsList.length,
            ),
          ],
        ),
        //services
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: controller.saloonDetail
                .servicesType()
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.hex43BCCETransparent03,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        e.title,
                        style: AppTextStyles.s14w400hhex2CA3B5,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),

        const Divider(),
      ],
    );
  }
}
