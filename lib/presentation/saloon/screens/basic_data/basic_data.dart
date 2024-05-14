import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/saloon/screens/basic_data/basic_data_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/add_logo.dart';
import 'package:okoshki/presentation/saloon/widgets/add_saloon_photo.dart';
import 'package:okoshki/presentation/saloon/widgets/address_widget.dart';
import 'package:okoshki/presentation/saloon/widgets/social_network_widget.dart';
import 'package:okoshki/presentation/saloon/widgets/text_field_description_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/text_field_bloc_edit_save.dart';
import 'package:okoshki/presentation/saloon/widgets/work_shedule_saloon.dart';

@RoutePage()
class BasicDataSaloonScreen extends StatelessWidget {
  const BasicDataSaloonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = sl<BasicDataSaloonController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Основные данные'),
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
    final controller = sl<BasicDataSaloonController>();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
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
            getStreetList: controller.getListStreet,
            getHouseList: controller.getListHouse,
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
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
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
        const Divider(),
        TextFieldDescriptionSaloon(
          description: controller.saloonDetail.description,
          onSave: (description) =>
              controller.updateSaloonDetail(description: description),
        ),
      ],
    );
  }
}
