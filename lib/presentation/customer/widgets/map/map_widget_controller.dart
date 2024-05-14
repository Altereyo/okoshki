import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/domain/repository/services/geo_repository.dart';
import 'package:okoshki/domain/state/customer/saloons_list_store.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/customer/bottomsheets/info_saloon/info_saloon.dart';

part 'map_widget_controller.g.dart';

// ignore: library_private_types_in_public_api
class MapWidgetController = _MapWidgetController with _$MapWidgetController;

abstract class _MapWidgetController with Store {
  _MapWidgetController({
    required GeoRepository geoRepository,
    required SaloonsListCustomerStore homeCustomerStore,

  })  : _geoRepository = geoRepository,
        _homeCustomerStore = homeCustomerStore;

  final GeoRepository _geoRepository;
  final SaloonsListCustomerStore _homeCustomerStore;
 

  @computed
  List<Saloon> get saloonList => isSearching ? _searchSaloons : _defaultSaloons;

  @computed
  List<Saloon> get _defaultSaloons =>
      _homeCustomerStore.mapSaloons.where((s) => s.address != null).toList();

  @computed
  List<Saloon> get _searchSaloons => _homeCustomerStore.saloonsSearchList;

  @observable
  bool isSearching = false;

  @observable
  bool isGeoEnabled = false;

  @observable
  Saloon? openedSaloon;

  PersistentBottomSheetController? openedSheetController;

  LatLng get initialPosition => _geoRepository.getInitialPosition();

  Future<void> checkIsGeoOk() async {
    isGeoEnabled = await _geoRepository.isGeoOk();
  }

  Future<void> checkIsSearching() async {
    isSearching = sl<AppRouter>().current.name == SearchSaloonsCustomerRoute.name;
  }

  Future<void> onPinTap(BuildContext context, Saloon saloon) async {
    if (openedSaloon?.id == saloon.id) {
      closeSaloon();
      return;
    }
    openSaloon(context, saloon);
  }

  Future<void> onMapTap(TapPosition pos, LatLng latLng) async {
    closeSaloon();
  }

  Future<void> onMapEvent(MapEvent event) async {
    if (isSearching) return;
    if (event is MapEventWithMove) {
      EasyThrottle.throttle(
        'map-move-throttler',
        const Duration(milliseconds: 400),
        () => updateMapPolygon(event),
      );
    }
  }

  Future<void> updateMapPolygon(MapEventWithMove event) async {
    final bounds = event.camera.visibleBounds;
    final topLeft =
        '${bounds.northWest.longitude},${bounds.northWest.latitude}';
    final topRight =
        '${bounds.northEast.longitude},${bounds.northEast.latitude}';
    final bottomRight =
        '${bounds.southEast.longitude},${bounds.southEast.latitude}';
    final bottomLeft =
        '${bounds.southWest.longitude},${bounds.southWest.latitude}';

    final polygon = '$topLeft,$topRight,$bottomRight,$bottomLeft';
    await _homeCustomerStore.getSaloonPolygon(polygon);
  }

  @action
  void openSaloon(BuildContext context, Saloon saloon) {
    openedSheetController = showBottomSheet(
      context: context,
      builder: (context) => InfoSaloonBottomSheet(
        saloon: saloon,
      ),
    );
    openedSheetController?.closed.then((value) => closeSaloon());
    openedSaloon = saloon;
  }

  @action
  void closeSaloon() {
    openedSaloon = null;
    if (openedSheetController != null) {
      openedSheetController!.close();
      openedSheetController = null;
    }
  }
}
