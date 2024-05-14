/*
onEditServiseType - обратный вызов редактирования (ServiceType)
onRemoveServiseType - обратный вызов удаления (ServiceType)
*/

import 'package:flutter/material.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/domain/entities/extensions/saloon_detail.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/delete/delete.dart';
import 'package:okoshki/presentation/saloon/widgets/button_icon_app.dart';

class ListOfServicesSaloon extends StatelessWidget {
  const ListOfServicesSaloon(
      {super.key,
      required this.saloonDetail,
      required this.onEditServiseType,
      required this.onRemoveServiseType});
  final SaloonDetail saloonDetail;
  final ValueChanged<ServiceType> onEditServiseType;
  final ValueChanged<ServiceType> onRemoveServiseType;

  @override
  Widget build(BuildContext context) {
    final servicesType = saloonDetail.servicesType();

    return ListView.separated(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: servicesType.length,
      itemBuilder: (context, index) {
        final serviceType = servicesType[index];
        return CardServiceTypeSaloon(
          onEditServiseType: onEditServiseType,
          saloonDetail: saloonDetail,
          onRemoveServiseType: onRemoveServiseType,
          serviceType: serviceType,
          servicesSaloonList: saloonDetail.servicesInServiceType(serviceType),
        );
      },
    );
  }
}

class CardServiceTypeSaloon extends StatelessWidget {
  const CardServiceTypeSaloon({
    super.key,
    required this.onEditServiseType,
    required this.saloonDetail,
    required this.onRemoveServiseType,
    required this.serviceType,
    required this.servicesSaloonList,
  });

  final ServiceType serviceType;
  final SaloonDetail saloonDetail;
  final List<Service> servicesSaloonList;
  final ValueChanged<ServiceType> onEditServiseType;
  final ValueChanged<ServiceType> onRemoveServiseType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  serviceType.title,
                  style: AppTextStyles.s16w600h262626,
                ),
                const SizedBox(width: 8),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.hex696969,
                  ),
                  child: Center(
                    child: Text(
                      servicesSaloonList.length.toString(),
                      style: AppTextStyles.s12w700hFFFFFF,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ButtonIconApp.edit(
                  onPressed: () => onEditServiseType(serviceType),
                ),
                ButtonIconApp.delete(
                  onPressed: saloonDetail.servicesType().length > 1
                      ? () async {
                          final bool? isRes = await showModalBottomSheet(
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) => const DeleteBottomSheet(),
                          );
                          if (isRes == true) {
                            onRemoveServiseType(serviceType);
                          }
                        }
                      : null,
                )
              ],
            ),
          ],
        ),
        ListView.builder(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: servicesSaloonList.length,
          itemBuilder: (context, index) {
            if (index < 3) {
              return Text(
                servicesSaloonList[index].title,
                style: AppTextStyles.s14w400h696969,
              );
            } else {
              return null;
            }
          },
        ),
        servicesSaloonList.length > 3
            ? Text(
                'и еще ${servicesSaloonList.length - 3}',
                style: AppTextStyles.s14w400h696969,
              )
            : Container(),
        const SizedBox(height: 8),
      ],
    );
  }
}
