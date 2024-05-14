import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/bottomsheets/logout.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/list_tile_app.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/app/widgets/switch_app.dart';
import 'package:okoshki/presentation/customer/screens/settings/settings_controller.dart';
import 'package:okoshki/presentation/customer/bottomsheets/rename_profile_customer/rename_profile_customer.dart';
import 'package:okoshki/presentation/customer/bottomsheets/selection_city_customer/selection_city_customer.dart';
import 'package:okoshki/presentation/customer/widgets/button_customer.dart';

@RoutePage()
class SettingsCustomerScreen extends StatelessWidget {
  const SettingsCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<SettingsCustomerController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Observer(
        builder: (_) => controller.isLoading
            ? const CircularLoadingWidget(
                isSaloon: false,
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
    final height = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight!;
    return SingleChildScrollView(
      child: SizedBox(
        height: height,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListWidget(),
            BottomOfScreenSettings(),
          ],
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<SettingsCustomerController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListTileApp(
            pathIcon: AppAssets.iconPhone,
            title: controller.userProfile.phoneNumber!,
            isSaloon: false,
            onTap: null,
          ),
          Observer(
            builder: (_) => ListTileApp(
              pathIcon: AppAssets.iconUser,
              title: controller.userProfile.username == null ||
                      controller.userProfile.username!.isEmpty
                  ? 'Как вас зовут?'
                  : controller.userProfile.username!,
              isSaloon: false,
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => const RenameProfileCustomerBottomSheet(),
              ),
            ),
          ),
          Observer(
            builder: (_) => ListTileApp(
              pathIcon: AppAssets.iconHome,
              title: controller.nameCity,
              isSaloon: false,
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => const SelectionCityCustomerBottomsheet(),
              ),
            ),
          ),
          const NotificationsWidget(),
        ],
      ),
    );
  }
}

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Уведомления',
            style: AppTextStyles.s14w600h696969,
          ),
          SwitchApp.customer(
            title: 'Push от любимых салонов',
            subTitle: 'Оповещения при появлении новых окошек у любимых салонов',
            isValue: false,
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}

class BottomOfScreenSettings extends StatelessWidget {
  const BottomOfScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final controller = sl<SettingsCustomerController>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ButtonApp.large(
            title: 'Выйти из профиля',
            onPressed: () async {
              final bool? isRes = await showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => const LogoutBottomSheet(
                  isSaloon: false,
                ),
              );
              if (isRes == true) {
                await controller.logoutCustomer();
                if (context.mounted) {
                  appRouter.popUntilRoot();
                  appRouter.replaceNamed(PathRoute.authCustomerScreen);
                }
              }
            },
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () async {
              final bool? isRes = await showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => const DeleteProfileBottomSheet(),
              );
              if (isRes == true) {
                if (controller.userProfile.salonsOwner && context.mounted) {
                  //Нельзя удалить аккаунт, так как есть салоны
                  showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    context: context,
                    builder: (context) =>
                        const ProhibitionDeletionBottomSheet(),
                  );
                } else {
                  await controller.deleteCustomer();
                  await controller.logoutCustomer();
                  if (context.mounted) {
                    appRouter.popUntilRoot();
                    appRouter.replaceNamed(PathRoute.authCustomerScreen);
                  }
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Удалить аккаунт',
                    style: AppTextStyles.s16w600hF64C4C,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeleteProfileBottomSheet extends StatelessWidget {
  const DeleteProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return LayoutBottomSheet.customer(
      title: 'Удалить аккаунт?',
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonCustomer.small(
              title: 'Отмена',
              onPressed: () async => appRouter.pop(false),
            ),
            ButtonApp.small(
              title: 'Удалить',
              onPressed: () => appRouter.pop(true),
            ),
          ],
        ),
      ],
    );
  }
}

class ProhibitionDeletionBottomSheet extends StatelessWidget {
  const ProhibitionDeletionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return LayoutBottomSheet.customer(
      title: 'Удалить аккаунт',
      children: [
        Text(
          'Вы не можете удалить аккаунт, так как у вас есть салоны. Для удаления обратитесь в службу поддержки сервиса "Окошки".',
          textAlign: TextAlign.center,
          style: AppTextStyles.s14w600h696969,
        ),
        ButtonApp.large(
          title: 'Закрыть',
          onPressed: () => appRouter.pop(),
        ),
      ],
    );
  }
}
