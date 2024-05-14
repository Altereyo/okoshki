import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/internal/functions/reset_dependencies.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/bottomsheets/logout.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/list_tile_app.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/customer/screens/profile/profile_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/rename_profile_customer/rename_profile_customer.dart';
import 'package:okoshki/presentation/customer/bottomsheets/selection_city_customer/selection_city_customer.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';
import 'package:okoshki/presentation/app/bottomsheets/contact_us/contact_us.dart';

@RoutePage()
class ProfileCustomerScreen extends StatelessWidget {
  const ProfileCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: const ViewScreen(),
    );
  }
}

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<ProfileCustomerController>();
    final height = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight!;
    return SingleChildScrollView(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            controller.isAuthorized
                ? const WidgetActiveProfile()
                : const WidgetUnactiveProfile(),
            const BottomOfScreen(),
          ],
        ),
      ),
    );
  }
}

class WidgetActiveProfile extends StatelessWidget {
  const WidgetActiveProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<ProfileCustomerController>();
    return Observer(
      builder: (_) => controller.isLoading
          ? const CircularLoadingWidget(isSaloon: false)
          : Column(
              children: [
                Observer(
                  builder: (_) => ListTile(
                    title: controller.userProfile.username == null ||
                            controller.userProfile.username!.isEmpty
                        ? Text('Как вас зовут?',
                            style: AppTextStyles.s26w400hC0C0C0)
                        : Text(
                            controller.userProfile.username!,
                            style: AppTextStyles.s26w600h262626,
                          ),
                    subtitle: Text(
                      controller.userProfile.phoneNumber!,
                      style: AppTextStyles.s14w400h262626,
                    ),
                    onTap: () => showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      context: context,
                      builder: (context) =>
                          const RenameProfileCustomerBottomSheet(),
                    ),
                  ),
                ),
                const SelectedCity(),
                const ProfileMenu(),
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
    final controller = sl<ProfileCustomerController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Observer(
            builder: (_) => ListTileApp(
              pathIcon: AppAssets.iconBooking,
              title: 'Мои брони',
              isSaloon: false,
              onTap: () =>
                  appRouter.pushNamed(PathRoute.myBookingsCustomerScreen),
              counter: controller.counterMyBooking,
            ),
          ),
          const Divider(),
          Observer(
            builder: (_) => ListTileApp(
              pathIcon: AppAssets.iconFavorite,
              title: 'Любимые салоны',
              isSaloon: false,
              onTap: () =>
                  appRouter.pushNamed(PathRoute.favoriteSaloonsCustomerScreen),
              counter: controller.counterFavoriteSaloons,
            ),
          ),
          const Divider(),
          Observer(
            builder: (_) => ListTileApp(
              pathIcon: AppAssets.iconFavorite,
              title: 'Мои отзывы',
              isSaloon: false,
              onTap: () =>
                  appRouter.pushNamed(PathRoute.myCommentsCustomerScreen),
              counter: controller.counterMyComment,
            ),
          ),
          const Divider(),
          ListTileApp(
            pathIcon: AppAssets.iconSettings,
            title: 'Настройки',
            isSaloon: false,
            onTap: () => appRouter.pushNamed(PathRoute.settingsCustomerScreen),
          ),
        ],
      ),
    );
  }
}

class WidgetUnactiveProfile extends StatelessWidget {
  const WidgetUnactiveProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          Text(
            'Авторизуйтесь и получите все возможности:',
            style: AppTextStyles.s16w600h262626,
          ),
          const SizedBox(height: 16),
          _intro('бронируйте окошки'),
          _intro('добавляйте салоны в «Любимые»'),
          _intro('оставляйте отзывы к салонам'),
          _intro('получайте пуш-уведомления'),
          ButtonCustomer.large(
            title: 'Авторизоваться',
            onPressed: () async {
              appRouter.popUntilRoot();
              appRouter.replaceNamed(PathRoute.authCustomerScreen);
              resetLazyDependencies();
            },
          ),
        ],
      ),
    );
  }

  Widget _intro(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.iconVerified,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: AppTextStyles.s14w400h262626,
          ),
        ],
      ),
    );
  }
}

class SelectedCity extends StatelessWidget {
  const SelectedCity({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<ProfileCustomerController>();
    return ListTile(
      title: Row(
        children: [
          Observer(
            builder: (_) => Text(
              controller.nameCity,
              style: AppTextStyles.s18w600h262626,
            ),
          ),
          Icon(
            Icons.expand_more_outlined,
            color: AppColors.hex43BCCE,
          )
        ],
      ),
      subtitle: Text(
        'Салоны показываются из этого города',
        style: AppTextStyles.s14w400h262626,
      ),
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (context) => const SelectionCityCustomerBottomsheet(),
      ),
    );
  }
}

class BottomOfScreen extends StatelessWidget {
  const BottomOfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<ProfileCustomerController>();
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: AppColors.hexE9FCFF,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          ListTileApp(
            title: 'Помощь и советы',
            isSaloon: false,
            onTap: () => appRouter.pushNamed(PathRoute.helpTipCustomerScreen),
          ),
          ListTileApp(
            title: 'Правила и соглашения',
            isSaloon: false,
            onTap: () => appRouter.push(RulesContractsRoute(isSaloon: false)),
          ),
          ListTileApp(
            title: 'Стать партнёром',
            isSaloon: false,
            onTap: () async {
              final bool? isRes = await showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => const LogoutBottomSheet(
                  isSaloon: false,
                ),
              );

              if (isRes == true) {
                if (controller.isAuthorized) {
                  await controller.logoutCustomer();
                }
                appRouter.popUntilRoot();
                appRouter.replaceNamed(PathRoute.authCustomerScreen);
                appRouter.replaceNamed(PathRoute.authSaloonScreen);
              }
            },
          ),
          ButtonApp.large(
            title: 'Связаться с нами',
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) => ContactUsBottomSheet(
                isSaloon: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
