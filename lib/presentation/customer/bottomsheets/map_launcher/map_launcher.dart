import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:okoshki/internal/ui/app_text_styles.dart';
import 'package:okoshki/presentation/app/widgets/layout_bottom_sheet.dart';
import 'package:okoshki/presentation/app/widgets/loading_widget.dart';
import 'package:okoshki/presentation/customer/bottomsheets/map_launcher/map_launcher_controller.dart';

class MapLauncherSheet extends StatelessWidget {
  const MapLauncherSheet({super.key, required this.controller});
  final MapLauncherCustomerController controller;
  @override
  Widget build(BuildContext context) {
    return LayoutBottomSheet.customer(
      title: '',
      children: [
        Observer(
          builder: (_) => controller.isLoading
              ? const CircularLoadingWidget(isSaloon: false)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...controller.availableMapList.map(
                      (availableMap) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: SvgPicture.asset(
                          availableMap.icon,
                          height: 40.0,
                          width: 40.0,
                        ),
                        title: Text(
                          availableMap.mapName,
                          style: AppTextStyles.s14w400h696969,
                        ),
                        onTap: () {
                          final title = controller.saloonRecords.title;
                          final address = controller.saloonRecords.address;
                          final coords = Coords(address.lat, address.lon);

                          availableMap.showMarker(
                            coords: coords,
                            title: title,
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
