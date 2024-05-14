import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/saloon_detail.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:okoshki/domain/state/saloon/master_store.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_master_window/master_window_controller.dart';

part 'add_service_to_window_controller.g.dart';

// ignore: library_private_types_in_public_api
class AddServiceToWindowController = _AddServiceToWindowController
    with _$AddServiceToWindowController;

abstract class _AddServiceToWindowController with Store {
  _AddServiceToWindowController({
    required SaloonStore saloonStore,
    required MasterSaloonStore masterSaloonStore,
  })  : _saloonStore = saloonStore,
        _masterSaloonStore = masterSaloonStore;

  final SaloonStore _saloonStore;
  final MasterSaloonStore _masterSaloonStore;

  @action
  Future<void> init() async {
    await asyncWhen((_) => _masterSaloonStore.isLoading == false);
    
    for (var saloonMaster in _masterSaloonStore.saloonMastersList) {
      final master = MasterWindowController(saloonMaster: saloonMaster);
      mastersWindowControllerList.add(master);
    }
  }

  //0-> типы услуг, 1-> услуги, 2-> мастера
  @observable
  int indexPage = 0;

  @observable
  ServiceType? selectSerType;

  @observable
  Service? selectService;

  ObservableList<MasterWindowController> mastersWindowControllerList =
      ObservableList();

  @computed
  bool get isSelectMaster => mastersWindowControllerList.any(
        (element) => element.isSelect == true,
      );

  @computed
  bool get isLoading => _saloonStore.isLoading || _masterSaloonStore.isLoading;

  @computed
  bool get isEnabledButtonConfirm => indexPage == 2 && isSelectMaster != false;

  //Лист всех типов услуг салона
  List<ServiceType> get servicesTypeSaloon =>
      _saloonStore.saloonDetail.servicesType();

  //Лист услуг салона определенного типа
  List<Service> get servicesSaloon =>
      _saloonStore.saloonDetail.servicesInServiceType(selectSerType!);

  //Выбранные услуги и мастера
  List<WindowService> get getWindowsServiceList {
    final isSelectMaster = mastersWindowControllerList.where(
      (element) => element.isSelect,
    );
    return isSelectMaster
        .map(
          (masterStore) => WindowService(
              id: masterStore.windowServiceId,
              service: selectService!,
              master: masterStore.saloonMaster,
              price: masterStore.prise ?? '0'),
        )
        .toList();
  }
}
