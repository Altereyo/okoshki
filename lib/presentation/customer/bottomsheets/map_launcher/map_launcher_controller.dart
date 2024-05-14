import 'package:map_launcher/map_launcher.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/address.dart';
import 'package:okoshki/domain/state/customer/map_launcher_store.dart';

part 'map_launcher_controller.g.dart';

// ignore: library_private_types_in_public_api
class MapLauncherCustomerController = _MapLauncherCustomerController
    with _$MapLauncherCustomerController;

abstract class _MapLauncherCustomerController with Store {
  _MapLauncherCustomerController({
    required this.saloonRecords,
    required MapLauncherCustomerStore mapLauncherCustomerStore,
  }) : _mapLauncherCustomerStore = mapLauncherCustomerStore;
  final ({String title, Address address}) saloonRecords;

  final MapLauncherCustomerStore _mapLauncherCustomerStore;

  @computed
  bool get isLoading => _mapLauncherCustomerStore.isLoading;

  List<AvailableMap> get availableMapList => _mapLauncherCustomerStore.availableMapList;
}
