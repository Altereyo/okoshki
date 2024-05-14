import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/logo_saloon.dart';
import 'package:okoshki/presentation/customer/widgets/favorite.dart';
import 'package:okoshki/presentation/customer/widgets/location.dart';

class SaloonCardWidget extends StatelessWidget {
  const SaloonCardWidget({
    super.key,
    this.logo,
    required this.isPremium,
    required this.title,
    required this.address,
    required this.rating,
    required this.usersLiked,
    this.distance,
  });
  final String? logo;
  final bool isPremium;
  final String title;
  final String address;
  final String rating;
  final int usersLiked;
  final String? distance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            LogoSaloon(
              logo: logo,
              isPremium: isPremium,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.s16w600h262626),
                  Text(
                    address,
                    style: AppTextStyles.s14w400h262626,
                    
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.iconRating,
                        height: 16,
                        width: 16,
                        colorFilter: ColorFilter.mode(
                          AppColors.hexFFB444,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(rating.toString(),
                          style: AppTextStyles.s12w400h696969),
                      const SizedBox(width: 16),
                      FavoriteWidget(
                        counter: usersLiked,
                      ),
                      const SizedBox(width: 16),
                      distance == null
                          ? Container()
                          : LocationWidget(
                              distance: distance!,
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
