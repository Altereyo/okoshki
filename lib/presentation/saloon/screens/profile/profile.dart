import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/domain/entities/extensions/saloon_detail.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/card_app.dart';
import 'package:okoshki/presentation/app/widgets/list_tile_app.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/app/bottomsheets/contact_us/contact_us.dart';
import 'package:okoshki/presentation/app/widgets/saloon_card.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/balance_top_up/balance_top_up.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/history_balance/history_balance.dart';
import 'package:okoshki/presentation/saloon/screens/profile/profile_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_icon_app.dart';

@RoutePage()
class ProfileSaloonScreen extends StatelessWidget {
  const ProfileSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<ProfileSaloonController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const CircularLoadingWidget(
                isSaloon: true,
              )
            : const ViewScreen(),
      ),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: sl<ProfileSaloonController>().refreshDetails,
      color: AppColors.hexFFFFFF,
      backgroundColor: AppColors.hex385EO,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: const [
          ViewSaloon(),
          SaloonBalance(),
          ProfileMenu(),
          BottomOfScreen(),
        ],
      ),
    );
  }
}

class ViewSaloon extends StatelessWidget {
  const ViewSaloon({super.key});

  @override
  Widget build(BuildContext context) {
    final saloon = sl<ProfileSaloonController>().saloonDetails;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Так клиенты видят ваш салон',
            style: AppTextStyles.s14w600h696969,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Observer(
              builder: (_) => SaloonCardWidget(
                logo: saloon.logo,
                isPremium: saloon.isPremium!,
                title: saloon.title!,
                address: saloon.address.toString(),
                rating: saloon.rating.toString(),
                usersLiked: saloon.usersLiked!.toInt(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<ProfileSaloonController>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      child: Column(
        children: [
          Observer(
            builder: (_) => ListTileApp(
              pathIcon: AppAssets.iconInfo,
              title: 'Основные данные',
              isSaloon: true,
              counter: controller.isSaloonData ? 'Не всё заполнено' : null,
              onTap: () => appRouter.pushNamed(PathRoute.basicDataSaloonScreen),
            ),
          ),
          const Divider(),
          Observer(
            builder: (_) => ListTileApp(
              pathIcon: AppAssets.iconServices,
              title: 'Услуги салона',
              isSaloon: true,
              onTap: () => appRouter.pushNamed(PathRoute.servicesSaloonScreen),
              counter: controller.numServices,
            ),
          ),
          const Divider(),
          Observer(
            builder: (_) => ListTileApp(
              pathIcon: AppAssets.iconMasters,
              title: 'Мастера',
              isSaloon: true,
              onTap: () => appRouter.pushNamed(PathRoute.mastersSaloonScreen),
              counter: controller.numMastersSaloon,
            ),
          ),
          const Divider(),
          Observer(
            builder: (_) => ListTileApp(
              pathIcon: AppAssets.iconStock,
              title: 'Акции',
              isSaloon: true,
              onTap: () => appRouter.pushNamed(PathRoute.stocksSaloonScreen),
              counter: controller.numStock,
            ),
          ),
          const Divider(),
          Observer(
            builder: (_) => ListTileApp(
              pathIcon: AppAssets.iconFeedbacks,
              title: 'Отзывы клиентов',
              isSaloon: true,
              onTap: () =>
                  appRouter.pushNamed(PathRoute.commentsCustomerSaloonScreen),
              counter: controller.numComments,
            ),
          ),
          const Divider(),
          ListTileApp(
            pathIcon: AppAssets.iconStats,
            title: 'История и статистика',
            isSaloon: true,
            onTap: () => appRouter.pushNamed(PathRoute.historyStatSaloonScreen),
          ),
          const Divider(),
          ListTileApp(
            pathIcon: AppAssets.iconSettings,
            title: 'Настройки',
            isSaloon: true,
            onTap: () => appRouter.pushNamed(PathRoute.settingsSaloonScreen),
          ),
        ],
      ),
    );
  }
}

class SaloonBalance extends StatelessWidget {
  const SaloonBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<ProfileSaloonController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CardApp(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Баланс',
                      style: AppTextStyles.s16w600h262626,
                    ),
                    Text(
                      controller.saloonDetails.dateTimeUpdateBalance(),
                      style: AppTextStyles.s12w400h696969,
                    )
                  ],
                ),
                ButtonIconApp.add(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      context: context,
                      builder: (context) => const BalanceTopUpBottomSheet(),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _balance(controller.saloonDetails.balance!),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      context: context,
                      builder: (context) => const HistoryBalanceBottomSheet(),
                    );
                  },
                  icon: SvgPicture.asset(
                    AppAssets.iconHistory,
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Комиссия с продаж',
                  style: AppTextStyles.s12w400h696969,
                ),
                const SizedBox(width: 8),
                Text(
                  '${controller.saloonDetails.appliedCommission}%',
                  style: AppTextStyles.s16w600h262626,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _balance(String textBalance) {
    final controller = sl<ProfileSaloonController>();
    final balance = double.parse(textBalance);
    if (balance > 0) {
      return Text(
        '${controller.saloonDetails.balance!} ₽',
        style: AppTextStyles.s18w600h385EO,
      );
    } else if (balance < 0) {
      return Text(
        '${controller.saloonDetails.balance!} ₽',
        style: AppTextStyles.s18w600hF64C4C,
      );
    } else {
      return Text(
        '${controller.saloonDetails.balance!} ₽',
        style: AppTextStyles.s18w600h262626,
      );
    }
  }
}

class BottomOfScreen extends StatelessWidget {
  const BottomOfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: AppColors.hexEFF2FF,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          ListTileApp(
            title: 'Документы',
            isSaloon: true,
            onTap: () => appRouter.pushNamed(PathRoute.documentsSaloonScreen),
          ),
          ListTileApp(
            title: 'Помощь и советы',
            isSaloon: true,
            onTap: () => appRouter.pushNamed(PathRoute.helpTipSaloonScreen),
          ),
          ListTileApp(
            title: 'Правила и соглашения',
            isSaloon: true,
            onTap: () => appRouter.push(RulesContractsRoute(isSaloon: true)),
          ),
          ButtonApp.large(
            title: 'Связаться с нами',
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) => ContactUsBottomSheet(
                isSaloon: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
