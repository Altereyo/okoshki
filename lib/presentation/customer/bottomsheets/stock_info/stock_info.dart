import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/stock.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/icon_logo_okoshki.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';

class StockInfoBottomSheet extends StatelessWidget {
  const StockInfoBottomSheet({super.key, required this.stock});
  final Stock stock;
  final double heightCard = 174;
  final borderRadius = const BorderRadius.all(Radius.circular(12));
  @override
  Widget build(BuildContext context) {
    return LayoutBottomSheet.customer(
      title: stock.title,
      children: [
        const SizedBox(height: 16),
        stock.logo == null
            ? Container(
                height: heightCard,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: AppColors.hex385EO,
                ),
                child: Center(
                  child: IconLogoOkoshki.white(),
                ),
              )
            : Container(
                height: heightCard,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      stock.logo!,
                    ),
                  ),
                ),
              ),
        const SizedBox(height: 16),
        Text(
          stock.duration,
          style: AppTextStyles.s12w400h696969,
        ),
        const SizedBox(height: 16),
        Text(
          stock.description ?? '',
          style: AppTextStyles.s14w400h262626,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
