import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/block_widget/additional_info.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/block_widget/info.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/block_widget/windows.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/block_widget/reviews.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/block_widget/sliver_app_bar.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/block_widget/stock.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:okoshki/presentation/customer/widgets/preload/preload_saloon_details_screen.dart';

import 'package:provider/provider.dart';

@RoutePage()
class SaloonDetailsCustomerScreen extends StatelessWidget {
  const SaloonDetailsCustomerScreen({super.key, required this.controller});
  final SaloonDetailsCustomerController controller;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => controller,
      child: Observer(
        builder: (_) => controller.isLoading
            ? const PreloadSaloonDetailsScreen()
            : const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(),
          SliverListWidget(),
        ],
      ),
    );
  }
}

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlockInfoOfSaloon(),
              BlockWindowsOfSaloon(),
              BlockAdditionalInfoOfSaloon(),
              BlockStockOfSaloon(),
            ],
          ),
        ),
        BlockReviewsOfSaloon(),
      ],
    );
  }
}
