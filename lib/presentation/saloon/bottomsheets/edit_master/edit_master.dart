import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:okoshki/domain/entities/saloon_master_service.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/saloon/widgets/add_logo_button.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_master/add_service_master.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/add_service_master/add_service_master_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/edit_master/edit_master_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/button_saloon.dart';
import 'package:okoshki/presentation/saloon/widgets/button_text_icon.dart';
import 'package:okoshki/presentation/saloon/widgets/saloon_master_service_card.dart';
import 'package:okoshki/presentation/saloon/widgets/text_field_bloc.dart';
import 'package:okoshki/presentation/saloon/widgets/title_bloc_page_profile_info.dart';

class EditMasterBottomSheet extends StatelessWidget {
  const EditMasterBottomSheet({super.key, required this.controller});
  final EditMasterController controller;
  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return LayoutBottomSheet.saloon(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      title: 'Изменение мастера',
      children: [
        TextFieldBloc(
          titleBloc: 'Имя и фамилия',
          text: controller.name,
          hintText: 'Например, Светлана С.',
          onChanged: (name) => controller.name = name,
        ),
        AddLogoButton.circle(
          logo: controller.avatar,
          onPatchLogo: (pathLogo) => controller.avatar = pathLogo,
        ),
        TextFieldBloc(
          titleBloc: 'Специализация',
          text: controller.specialization,
          hintText: 'Например, массажист',
          onChanged: (specialization) =>
              controller.specialization = specialization,
        ),
        const TitleBlocPageProfileInfo(
          title: 'Перечень услуг',
          subTitle: null,
        ),
        const SizedBox(height: 8),
        Observer(
          builder: (_) => Column(
            children: controller.saloonMasterServicesList.map(
              (saloonMasterService) {
                return SaloonMasterServiceCard(
                  saloonMasterService: saloonMasterService,
                  onDeleteService: controller.removeSalonMasterSevice,
                );
              },
            ).toList(),
          ),
        ),
        ButtonTextIcon(
          title: 'Добавить услугу',
          onPressed: () async {
            final addServicesMasterController =
                sl<AddServiceMasterController>(
                    param1: controller.saloonMasterServicesList);
            final List<Service>? selectedServices = await showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) => AddServiceMasterBottomSheet(
                  controller: addServicesMasterController),
            );
            if (selectedServices != null) {
              //Добавление выбраных услуг к мастеру
              final list = selectedServices
                  .map(
                    (service) => SaloonMasterService(
                      id: null,
                      master: null,
                      service: service,
                      price: '0',
                      isActive: true,
                    ),
                  )
                  .toList();
              controller.saloonMasterServicesList.addAll(list);
            }
          },
        ),
        const SizedBox(height: 8),
        Observer(
          builder: (_) => ButtonSaloon.large(
            title: 'Сохранить',
            onPressed: controller.isEnabledButtonSave
                ? () async {
                    await controller.saveChangesMaster();
                    if (context.mounted) {
                      appRouter.pop();
                    }
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
