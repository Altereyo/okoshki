import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/button_app.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/saloon/screens/primary_settings/primary_settings_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/add_logo.dart';
import 'package:okoshki/presentation/saloon/widgets/add_saloon_photo.dart';
import 'package:okoshki/presentation/saloon/widgets/address_widget.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_saloon/add_service_saloon.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_saloon/add_service_saloon_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/create_master/create_master_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_master/edit_master.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_master/edit_master_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_service/edit_service.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_service/edit_service_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/button_text_icon.dart';
import 'package:okoshki/presentation/saloon/widgets/list_of_masters.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/create_master/create_master.dart';
import 'package:okoshki/presentation/saloon/widgets/list_of_services_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/social_network_widget.dart';
import 'package:okoshki/presentation/saloon/widgets/text_field_bloc_edit_save.dart';
import 'package:okoshki/presentation/saloon/widgets/text_field_description_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/title_bloc_page_profile_info.dart';
import 'package:okoshki/presentation/saloon/widgets/title_page_profile_info.dart';
import 'package:okoshki/presentation/saloon/widgets/work_shedule_saloon.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

@RoutePage()
class PrimarySettingsSaloonScreen extends StatelessWidget {
  const PrimarySettingsSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<PrimarySettingsSaloonController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настроим ваш профиль'),
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
    final appRouter = sl<AppRouter>();
    final controller = sl<PrimarySettingsSaloonController>();
    return Stack(
      children: [
        _viewPage(),
        KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            return isKeyboardVisible
                ? Container()
                : Observer(
                    builder: (_) => NavigationPrimarySettingsSaloon(
                      indexPage: controller.indexPage,
                      onChangesPage: (indexPage) {
                        controller.indexPage = indexPage;
                      },
                      isEnabledButNextPageTwo:
                          controller.enabledButtonNextPageTwo,
                      isEnabledButNextPageThree: true,
                      isEnabledButNextPageFour:
                          controller.enabledButtonNextPageFour,
                      isEnabledButNextPageFive:
                          controller.enabledButtonNextPageFive,
                      onPressedButComplete: () async {
                        await controller.setIsSaloonSettingsPassed();
                        appRouter.replaceNamed(PathRoute.homeSaloonScreen);
                      },
                    ),
                  );
          },
        ),
      ],
    );
  }

  Widget _viewPage() {
    return Observer(
      builder: (_) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
        child: _bodyPage(),
      ),
    );
  }

  Widget _bodyPage() {
    final controller = sl<PrimarySettingsSaloonController>();
    switch (controller.indexPage) {
      case 1:
        return const BodyPageProfileInfoOne();
      case 2:
        return const BodyPageProfileInfoTwo();
      case 3:
        return const BodyPageProfileInfoThree();
      case 4:
        return const BodyPageProfileInfoFour();
      case 5:
        return const BodyPageProfileInfoFive();
      default:
        return Container();
    }
  }
}

class BodyPageProfileInfoOne extends StatelessWidget {
  const BodyPageProfileInfoOne({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<PrimarySettingsSaloonController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitlePageProfileInfo(
          title: 'Проверьте и дополните информацию о вашем салоне',
        ),
        TextFielBlocdEditSave(
          titleBloc: 'Название',
          text: controller.saloonDetail.title,
          hintText: 'Введите название салона',
          onSave: (title) => controller.updateSaloonDetail(title: title),
        ),
        Observer(
          builder: (_) => AddressWidget(
            address: controller.saloonDetail.address,
            citiesList: controller.citiesList,
            getStreetList: controller.getStreetsList,
            getHouseList: controller.getHousesList,
            onAddress: controller.createAddress,
          ),
        ),
        Observer(
          builder: (_) => AddLogo(
            pathLogo: controller.saloonDetail.logo,
            onCreateLogo: controller.createLogo,
            onRemoveLogo: controller.deleteLogo,
          ),
        ),
        const Divider(),
        Observer(
          builder: (_) => AddSaloonPhoto(
            saloonPhotosList: controller.saloonPhotosList.toList(),
            onCreatePhoto: controller.createPhoto,
            onRemovePhoto: controller.deletePhoto,
          ),
        ),
      ],
    );
  }
}

class BodyPageProfileInfoTwo extends StatelessWidget {
  const BodyPageProfileInfoTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<PrimarySettingsSaloonController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitlePageProfileInfo(
          title: 'Укажите дополнительную информацию.',
          subTitle: 'Можно пропустить',
        ),
        TextFielBlocdEditSave(
          titleBloc: 'Сайт салона (необязательно)',
          text: controller.saloonDetail.site,
          hintText: 'www.salon.com',
          onSave: (site) => controller.updateSaloonDetail(site: site),
        ),
        Observer(
          builder: (_) => SocialNetworkWidget(
            socialNetworkList: controller.socialNetworksList.toList(),
          ),
        ),
        const Divider(),
        Observer(
          builder: (_) => WorkSheduleSaloon(
              saloonSheduleList: controller.saloonSheduleList.toList()),
        ),
      ],
    );
  }
}

class BodyPageProfileInfoThree extends StatelessWidget {
  const BodyPageProfileInfoThree({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<PrimarySettingsSaloonController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitlePageProfileInfo(
          title: 'Перечислите направления услуг салона.',
          subTitle: 'Выберите хотя бы одно',
        ),
        const TitleBlocPageProfileInfo(
          title: 'Виды оказываемых услуг',
          subTitle: 'Минимум одна',
        ),
        Observer(
          builder: (_) => ListOfServicesSaloon(
            saloonDetail: controller.saloonDetail,
            onEditServiseType: (editServiceType) {
              final controllerEditService =
                  sl<EditServiceController>(param1: editServiceType);
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) => EditServiceBottomSheet(
                  controller: controllerEditService,
                ),
              );
            },
            onRemoveServiseType: controller.removeServiseType,
          ),
        ),
        ButtonTextIcon(
          title: 'Добавить услугу',
          onPressed: () {
            final addServiceController = sl<AddServiceSaloonController>();
            showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) => AddServiceSaloonBottomSheet(
                controller: addServiceController,
              ),
            );
          },
        ),
      ],
    );
  }
}

class BodyPageProfileInfoFour extends StatelessWidget {
  const BodyPageProfileInfoFour({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<PrimarySettingsSaloonController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitlePageProfileInfo(
          title: 'Добавьте мастеров.',
        ),
        const TitleBlocPageProfileInfo(
          title: 'Мастера',
          subTitle: 'Минимум один',
        ),
        Observer(
          builder: (_) => ListOfMasters(
            saloonMastersList: controller.saloonMastersList.toList(),
            onDeleteMaster: (master) {
              controller.deleteMaster(master.id);
            },
            onEditMaster: (master) {
              final controllerMaster =
                  sl<EditMasterController>(param1: master);
              showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => EditMasterBottomSheet(
                        controller: controllerMaster,
                      ));
            },
          ),
        ),
        ButtonTextIcon(
          title: 'Добавить мастера',
          onPressed: () {
            final controllerMaster =
                sl<CreateMasterController>(param1: null);
            showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) => CreateMasterBottomSheet(
                controller: controllerMaster,
              ),
            );
          },
        ),
      ],
    );
  }
}

class BodyPageProfileInfoFive extends StatelessWidget {
  const BodyPageProfileInfoFive({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<PrimarySettingsSaloonController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitlePageProfileInfo(
          title: 'Наконец, коротко расскажите о себе.',
          subTitle: 'Можно пропустить',
        ),
        TextFieldDescriptionSaloon(
          description: controller.saloonDetail.description,
          onSave: (description) =>
              controller.updateSaloonDetail(description: description),
        ),
      ],
    );
  }
}

class NavigationPrimarySettingsSaloon extends StatelessWidget {
  const NavigationPrimarySettingsSaloon(
      {super.key,
      required this.indexPage,
      required this.onChangesPage,
      required this.isEnabledButNextPageTwo,
      required this.isEnabledButNextPageThree,
      required this.isEnabledButNextPageFour,
      required this.isEnabledButNextPageFive,
      required this.onPressedButComplete});

  final int indexPage;
  final ValueChanged<int> onChangesPage;
  final bool isEnabledButNextPageTwo;
  final bool isEnabledButNextPageThree;
  final bool isEnabledButNextPageFour;
  final bool isEnabledButNextPageFive;
  final Future<void> Function() onPressedButComplete;

  Future<void> nextPage() async {
    if (indexPage != 5) {
      onChangesPage(indexPage + 1);
    }
  }

  void backPage() {
    if (indexPage != 1) {
      onChangesPage(indexPage - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: AppColors.hexFFFFFF,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              _rowDots(),
              _viewButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rowDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dots(1),
        _dots(2),
        _dots(3),
        _dots(4),
        _dots(5),
      ],
    );
  }

  Widget _dots(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 8, 0),
      child: Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: indexPage == index
              ? AppColors.hex385EO
              : AppColors.hexC0C0C0, // inner circle color
        ),
      ),
    );
  }

  Widget _viewButton() {
    switch (indexPage) {
      case 1:
        return _buttonsInfo1();
      case 2:
        return _buttonsInfo2();
      case 3:
        return _buttonsInfo3();
      case 4:
        return _buttonsInfo4();
      case 5:
        return _buttonsInfo5();
      default:
        return Container();
    }
  }

  Widget _buttonsInfo1() {
    return ButtonSaloon.small(
      title: 'Далее',
      onPressed: isEnabledButNextPageTwo ? nextPage : null,
    );
  }

  Widget _buttonsInfo2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonApp.small(
          title: 'Назад',
          onPressed: backPage,
        ),
        ButtonSaloon.small(
          title: 'Далее',
          onPressed: isEnabledButNextPageThree ? nextPage : null,
        ),
      ],
    );
  }

  Widget _buttonsInfo3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonApp.small(
          title: 'Назад',
          onPressed: backPage,
        ),
        ButtonSaloon.small(
          title: 'Далее',
          onPressed: isEnabledButNextPageFour ? nextPage : null,
        ),
      ],
    );
  }

  Widget _buttonsInfo4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonApp.small(
          title: 'Назад',
          onPressed: backPage,
        ),
        ButtonSaloon.small(
          title: 'Далее',
          onPressed: isEnabledButNextPageFive ? nextPage : null,
        ),
      ],
    );
  }

  Widget _buttonsInfo5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonApp.small(
          title: 'Назад',
          onPressed: () {
            backPage();
          },
        ),
        ButtonSaloon.small(
          title: 'Завершить',
          onPressed: onPressedButComplete,
        ),
      ],
    );
  }
}
