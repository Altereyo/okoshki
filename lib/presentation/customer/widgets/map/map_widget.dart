import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latlong2/latlong.dart';
import 'package:okoshki/internal/constants/moscow_latlon.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/ui/app_colors.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/app/widgets/icon_buton_circle.dart';
import 'package:okoshki/presentation/customer/screens/home/home.dart';
import 'package:okoshki/presentation/customer/widgets/map/map_widget_controller.dart';
import 'package:okoshki/presentation/customer/widgets/map/pin_map_saloon.dart';
import 'package:okoshki/presentation/customer/widgets/map/pin_map_user.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final MapController _mapController = MapController();
  final controller = sl<MapWidgetController>();

  @override
  void initState() {
    super.initState();
    controller.checkIsGeoOk();
    controller.checkIsSearching();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: controller.initialPosition,
        initialZoom: 9.2,
        onTap: controller.onMapTap,
        onMapEvent: controller.onMapEvent,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.okoshki.app',
        ),
        Observer(
          builder: (_) => controller.isGeoEnabled
              ? CurrentLocationLayer(
                  style: LocationMarkerStyle(
                    accuracyCircleColor: AppColors.hex43BCCE.withOpacity(0.15),
                    headingSectorColor: AppColors.hex43BCCE,
                    marker: const PinMapUser(),
                  ),
                )
              : Container(),
        ),
        Observer(
          builder: (_) => MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              maxClusterRadius: 45,
              rotate: true,
              markers: controller.saloonList.map(
                (saloon) {
                  final address = saloon.address!;
                  return Marker(
                    rotate: true,
                    width: 80,
                    height: 80,
                    point: LatLng(address.lat, address.lon),
                    child: Observer(
                      builder: (context) => PinMapSaloon(
                        saloon: saloon,
                        onTap: controller.onPinTap,
                        isOpened: controller.openedSaloon == saloon,
                      ),
                    ),
                  );
                },
              ).toList(),
              builder: (context, markers) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.hex43BCCE,
                  ),
                  child: Center(
                    child: Text(
                      markers.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Observer(
          builder: (_) => Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.isGeoEnabled)
                  IconButtonCircle(
                    isSaloon: false,
                    icon: AppAssets.iconLocationMap,
                    onPressed: () {
                      _mapController.moveAndRotate(
                          controller.initialPosition ?? moscowLatLon, 13, 0);
                    },
                    isGrey: true,
                  ),
                const SizedBox(height: 10),
                IconButtonCircle(
                  isSaloon: false,
                  onPressed: () {
                    _mapController.rotate(0);
                  },
                  isGrey: true,
                  googleIcon: Icons.explore_outlined,
                ),
              ],
            ),
          ),
        ),
        if (!controller.isSearching)
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBarWidget(),
          ),
      ],
    );
  }
}
