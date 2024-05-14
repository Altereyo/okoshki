import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/domain/entities/extensions/saloon_master.dart';
import 'package:okoshki/presentation/app/widgets/image_network_circular.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/delete/delete.dart';
import 'package:okoshki/presentation/saloon/widgets/button_icon_app.dart';
import 'package:okoshki/presentation/saloon/widgets/button_service_number.dart';

class ListOfMasters extends StatelessWidget {
  const ListOfMasters({
    super.key,
    required this.saloonMastersList,
    required this.onDeleteMaster,
    required this.onEditMaster,
  });
  final List<SaloonMaster> saloonMastersList;
  final ValueChanged<SaloonMaster> onDeleteMaster;
  final ValueChanged<SaloonMaster> onEditMaster;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: saloonMastersList
          .map(
            (master) => CardMaster(
              saloonMaster: master,
              onDeleteMaster: onDeleteMaster,
              onEditMaster: onEditMaster,
              activeButtonDelMaster: saloonMastersList.length > 1,
            ),
          )
          .toList(),
    );
  }
}

class CardMaster extends StatelessWidget {
  const CardMaster({
    super.key,
    required this.saloonMaster,
    required this.onDeleteMaster,
    required this.onEditMaster,
    required this.activeButtonDelMaster,
  });
  final SaloonMaster saloonMaster;
  final ValueChanged<SaloonMaster> onDeleteMaster;
  final ValueChanged<SaloonMaster> onEditMaster;
  final bool activeButtonDelMaster;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Photo, name, specialization, edit, remove
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: saloonMaster.avatar != null
                    ? ImageNetworkIndicator(
                        src: saloonMaster.avatar!,
                        height: 46,
                        width: 46,
                      )
                    : SvgPicture.asset(AppAssets.avatarMaster),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      saloonMaster.name,
                      style: AppTextStyles.s16w600h262626,
                    ),
                    Text(
                      saloonMaster.specialization ?? '',
                      style: AppTextStyles.s14w400h262626,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtonIconApp.edit(
                    onPressed: () => onEditMaster(saloonMaster),
                  ),
                  ButtonIconApp.delete(
                    onPressed: activeButtonDelMaster
                        ? () async {
                            final bool? isRes = await showModalBottomSheet(
                              isScrollControlled: true,
                              useSafeArea: true,
                              context: context,
                              builder: (context) => const DeleteBottomSheet(),
                            );
                            if (isRes == true) {
                              onDeleteMaster(saloonMaster);
                            }
                          }
                        : null,
                  ),
                ],
              ),
            ],
          ),
          //services
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: SizedBox(
              height: 46,
              child: ListView.builder(
                itemCount: saloonMaster.servicesType().length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final serviceTypeMaster = saloonMaster.servicesType()[index];
                  final lenghtService = saloonMaster
                      .servicesInServiceType(serviceTypeMaster)
                      .length
                      .toString();
                  return ButtonServiceNumber(
                    title: serviceTypeMaster.title,
                    number: lenghtService,
                  );
                },
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
