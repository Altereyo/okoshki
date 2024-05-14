import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/stock.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/icon_logo_okoshki.dart';
import 'package:okoshki/presentation/customer/bottomsheets/stock_info/stock_info.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:provider/provider.dart';

class BlockStockOfSaloon extends StatelessWidget {
  const BlockStockOfSaloon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SaloonDetailsCustomerController>(context);
    return controller.stocksList.isEmpty
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Text(
                'Акции салона',
                style: AppTextStyles.s14w600h696969,
              ),
              SizedBox(
                height: 216,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.stocksList.length,
                  itemBuilder: (context, index) {
                    final stock = controller.stocksList[index];
                    return StockCardCustomer(stock: stock);
                  },
                ),
              ),
            ],
          );
  }
}

class StockCardCustomer extends StatelessWidget {
  const StockCardCustomer({super.key, required this.stock});
  final Stock stock;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (context) => StockInfoBottomSheet(
          stock: stock,
        ),
      ),
      child: Container(
        width: 190,
        margin: const EdgeInsets.all(4),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            stock.logo == null
                ? Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      color: AppColors.hex385EO,
                    ),
                    child: Center(
                      child: IconLogoOkoshki.white(),
                    ),
                  )
                : Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                          stock.logo!,
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stock.duration,
                      style: AppTextStyles.s12w400h696969,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      stock.title,
                      style: AppTextStyles.s16w600h262626,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
