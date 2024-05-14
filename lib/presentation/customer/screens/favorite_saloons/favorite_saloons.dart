import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/preload/preload_list.dart';
import 'package:okoshki/presentation/customer/screens/favorite_saloons/favorite_saloons_controller.dart';
import 'package:okoshki/presentation/customer/widgets/not_results.dart';
import 'package:okoshki/presentation/customer/widgets/preload/preload_favorite_saloon_card.dart';
import 'package:okoshki/presentation/customer/widgets/saloon_card_favorite.dart';

@RoutePage()
class FavoriteSaloonCustomerScreen extends StatelessWidget {
  const FavoriteSaloonCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Любимые салоны'),
      ),
      body: const ViewScreen(),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<FavoriteSaloonsCustomerController>();

    return Observer(
      builder: (_) => controller.isLoading
          ? const PreloadListWidget(
              card: PreloadFavoriteSaloonCard(),
            )
          : const FavoriteSaloonsList(),
    );
  }
}

class FavoriteSaloonsList extends StatelessWidget {
  const FavoriteSaloonsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<FavoriteSaloonsCustomerController>();
    return Observer(
      builder: (_) {
        final favoriteSalons = controller.favoriteSalons.toList();
        return favoriteSalons.isEmpty
            ? const NotResultsWidget(
                title: 'Пока не добавлено ни одного любимого салона',
                subTitle:
                    'Перейдите на экран любого понравившегося салона и нажмите иконку «сердечко»',
              )
            : ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: favoriteSalons.length,
                itemBuilder: (_, index) {
                  final saloon = favoriteSalons[index];
                  return SaloonCardFavoriteWidget(
                    saloon: saloon,
                    onTapFavorite: () =>
                        controller.updateFavoriteSaloon(saloon.id),
                  );
                },
              );
      },
    );
  }
}
