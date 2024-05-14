import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_master_service.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/domain/entities/extensions/saloon_detail.dart';

part 'add_service_master_controller.g.dart';

// ignore: library_private_types_in_public_api
class AddServiceMasterController = _AddServiceMasterController
    with _$AddServiceMasterController;

abstract class _AddServiceMasterController with Store {
  _AddServiceMasterController({
    required SaloonStore saloonStore,
    required List<SaloonMasterService> saloonMasterServicesList,
  })  : _saloonStore = saloonStore,
        _saloonMasterServicesList = saloonMasterServicesList;

  final SaloonStore _saloonStore;
  final List<SaloonMasterService> _saloonMasterServicesList;

  //лист всех типов услуг салона
  List<ServiceType> get servicesTypeSaloon =>
      _saloonStore.saloonDetail.servicesType();

  //услуги салона выбранного типа услуг
  List<Service> get servicesSaloon =>
      _saloonStore.saloonDetail.servicesInServiceType(isSelectedSerType!);

  //услуги салона минус услуги мастера
  List<Service> servSaloonSubtractingSerMaster() {

    final List<Service> list = [];
  
    for (var serSaloon in servicesSaloon) {
      final res = _saloonMasterServicesList.where(
        (element) => element.service.title == serSaloon.title,
      );

      if (res.isEmpty) {
        list.add(serSaloon);
      }
    }
    return list;
  }

  //Переключение виджета тип услуги/ услуга
  @observable
  int indexPage = 0;

  @observable
  ServiceType? isSelectedSerType;

  @action
  void setIndexPage(ServiceType? serviceType) {
    if (indexPage == 0) {
      indexPage++;
    } else {
      indexPage--;
      selectedServices.clear();
    }
    isSelectedSerType = serviceType;
  }

  @computed
  bool get isEnabledButSaveServices => selectedServices.isNotEmpty;

  //выбранные услуги
  @observable
  ObservableList<Service> selectedServices = ObservableList();

  @action
  void addListSelectedServices(Service service) {
    selectedServices.add(service);
  }

  @action
  void removeListSelectedServices(Service service) {
    selectedServices.removeWhere((element) => element.id == service.id);
  }
}
