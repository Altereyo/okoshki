import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/extensions/saloon.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/presentation/app/widgets/icon_app.dart';
import 'package:okoshki/presentation/app/widgets/saloon_card.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';

class SaloonCardFavoriteWidget extends StatelessWidget {
  const SaloonCardFavoriteWidget({
    super.key,
    required this.saloon,
    required this.onTapFavorite,
  });
  final Saloon saloon;
  final void Function() onTapFavorite;
  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              final saloonDetailsCustomerController =
                  sl<SaloonDetailsCustomerController>(
                param1: saloon.id,
              );
              appRouter.push(
                SaloonDetailsCustomerRoute(
                  controller: saloonDetailsCustomerController,
                ),
              );
            },
            child: Row(
              children: [
                Expanded(
                  child: SaloonCardWidget(
                    logo: saloon.logo,
                    isPremium: saloon.isPremium,
                    title: saloon.title,
                    address: saloon.address.toString(),
                    rating: saloon.rating.toString(),
                    usersLiked: saloon.usersLiked!.toInt(),
                    distance: saloon.distanceToString,
                  ),
                ),
                IconButtonApp(
                  path: AppAssets.iconFavorite,
                  color: AppColors.hexDF49B5,
                  size: 24,
                  onPressed: onTapFavorite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
