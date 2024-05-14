import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/domain/entities/stock.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/icon_buton_circle.dart';
import 'package:okoshki/presentation/app/widgets/icon_logo_okoshki.dart';
import 'package:okoshki/presentation/app/widgets/preload/preload_list.dart';
import 'package:okoshki/presentation/customer/widgets/not_results.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/create_stock/create_stock.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/delete/delete.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_stock/edit_stock.dart';
import 'package:okoshki/presentation/saloon/screens/stocks/stocks_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_icon_app.dart';
import 'package:okoshki/presentation/saloon/widgets/preload/preload_stock_card.dart';

@RoutePage()
class StocksSaloonScreen extends StatelessWidget {
  const StocksSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<StocksSaloonController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Акции'),
      ),
      floatingActionButton: IconButtonCircle(
        isSaloon: true,
        icon: AppAssets.iconAdd,
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) => const CreateStockBottomSheet(),
        ),
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const PreloadListWidget(card: PreloadStockCard())
            : const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<StocksSaloonController>();
    return Observer(
      builder: (_) => controller.stockList.isEmpty
          ? const NotResultsWidget(
              title: 'Пока не добавлено ни одной акции',
              subTitle: '',
            )
          : const StockList(),
    );
  }
}

class StockList extends StatelessWidget {
  const StockList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<StocksSaloonController>();
    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 80),
      child: Observer(
        builder: (_) => Column(
          children: [
            ...controller.stockList.toList().map(
                  (stock) => StockCardSaloon(stock: stock),
                ),
          ],
        ),
      ),
    );
  }
}

class StockCardSaloon extends StatelessWidget {
  const StockCardSaloon({super.key, required this.stock});
  final Stock stock;
  @override
  Widget build(BuildContext context) {
    final controller = sl<StocksSaloonController>();
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
          Column(
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
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Text(
                              stock.duration,
                              style: AppTextStyles.s12w400h696969,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 16),
                            child: Text(
                              stock.title,
                              style: AppTextStyles.s16w600h262626,
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        ButtonIconApp.edit(
                          onPressed: () => showModalBottomSheet(
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) =>
                                EditStockBottomSheet(stock: stock),
                          ),
                        ),
                        ButtonIconApp.delete(
                          onPressed: () async {
                            final bool? isRes = await showModalBottomSheet(
                              isScrollControlled: true,
                              useSafeArea: true,
                              context: context,
                              builder: (context) => const DeleteBottomSheet(),
                            );
                            if (isRes == true) {
                              controller.deleteStock(stockId: stock.id);
                            }
                          },
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
