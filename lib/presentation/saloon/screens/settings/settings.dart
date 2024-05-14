import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okoshki/domain/entities/extensions/premium.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/bottomsheets/logout.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/card_app.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/app/widgets/switch_app.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/premium_connect/premium_connect.dart';
import 'package:okoshki/presentation/saloon/screens/settings/settings_controller.dart';

@RoutePage()
class SettingsSaloonScreen extends StatelessWidget {
  const SettingsSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: const ViewScreen(),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              NotificationsWidget(),
              PremiumSaloonCard(),
            ],
          ),
          BottomButtons(),
        ],
      ),
    );
  }
}

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Уведомления',
          style: AppTextStyles.s14w600h696969,
        ),
        SwitchApp.saloon(
          title: 'Push о новых бронях',
          subTitle: 'Оповещения при бронировании окошек',
          isValue: true,
          onChanged: (val) {
            print(val);
          },
        ),
        SwitchApp.saloon(
          title: 'Push об отмене броней',
          subTitle: 'Оповещения при отмене брони клиентом',
          isValue: false,
          onChanged: (val) {
            print(val);
          },
        ),
        SwitchApp.saloon(
          title: 'Push об отзывах',
          subTitle: 'Оповещения при появлении нового отзыва о салоне',
          isValue: false,
          onChanged: (val) {
            print(val);
          },
        ),
        const Divider(),
      ],
    );
  }
}

class PremiumSaloonCard extends StatefulWidget {
  const PremiumSaloonCard({super.key});

  @override
  State<PremiumSaloonCard> createState() => _PremiumSaloonCardState();
}

class _PremiumSaloonCardState extends State<PremiumSaloonCard> {
  final controller = sl<SettingsSaloonController>();

  void _onTap() {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (context) => PremiumConnectBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => controller.isLoading
          ? const CircularLoadingWidget(
              isSaloon: true,
            )
          : controller.premium != null
              ? _premium()
              : _notPremium(),
    );
  }

  Widget _premium() {
    return CardApp(
      onTap: _onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'PREMIUM-салон',
                      style: AppTextStyles.s18w600h262626,
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      AppAssets.iconBadgePremium,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
                Text(
                  'Срок действия:  до ${controller.premium?.endPremium}',
                  style: AppTextStyles.s12w400h696969,
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            AppAssets.iconRenewal,
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }

  Widget _notPremium() {
    return CardApp(
      onTap: _onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.iconBadgePremium,
            height: 36,
            width: 36,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Стать PREMIUM',
                  style: AppTextStyles.s18w600h262626,
                ),
                Text(
                  'Салоны с таким статусом более заметны в списках салонов',
                  style: AppTextStyles.s12w400h696969,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: AppColors.hex385EO,
          ),
        ],
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<SettingsSaloonController>();
    return ButtonApp.large(
      title: 'Выйти из профиля',
      onPressed: () async {
        final bool? isRes = await showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) => const LogoutBottomSheet(
            isSaloon: true,
          ),
        );
        if (isRes == true) {
          await controller.logoutSaloon();
          if (context.mounted) {
            appRouter.popUntilRoot();
            appRouter.replaceNamed(PathRoute.authCustomerScreen);
          }
        }
      },
    );
  }
}
