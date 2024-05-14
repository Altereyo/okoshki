import 'package:map_launcher/map_launcher.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/repository/services/map_launcher_repository.dart';

part 'map_launcher_store.g.dart';

// ignore: library_private_types_in_public_api
class MapLauncherCustomerStore = _MapLauncherCustomerStore
    with _$MapLauncherCustomerStore;

abstract class _MapLauncherCustomerStore with Store {
  _MapLauncherCustomerStore({
    required MapLauncherRepository mapLauncherRepository,
  }) : _mapLauncherRepository = mapLauncherRepository;

  final MapLauncherRepository _mapLauncherRepository;

  List<AvailableMap> availableMapList = [];

  Future<void> init() async {
    await _getAvailableMapList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  @action
  Future<void> _getAvailableMapList() async {
    final res = await _mapLauncherRepository.getAvailableMapList();
    availableMapList = res;
  }
}
