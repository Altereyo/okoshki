import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/domain/state/app/services_store.dart';
import 'package:okoshki/domain/entities/extensions/saloon_detail.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';

part 'add_service_saloon_controller.g.dart';

/*
indexPage = 0 => показываются типы услуг
indexPage = 1 => показываются услуги выбраного типа услуг;
isSelectedSerType - выбранный тип услуги
setIndexPage() - устанавливает isSelectedSerType и изменятся indexPage
_selectedServicesId - лист id выбранных услуг
addListSelectedServices - добавляет id услуги в _listSelectedServices
removeListSelectedServices - удаляет id услуги из _listSelectedServices

listServicesSelectedSerType() - возращает лист услуг выбраного isSelectedSerType
addServicesToSaloonDetail() - добавить выбранные услуги в салон
*/

// ignore: library_private_types_in_public_api
class AddServiceSaloonController = _AddServiceSaloonController with _$AddServiceSaloonController;

abstract class _AddServiceSaloonController with Store {
  _AddServiceSaloonController({
    required ServicesAppStore servicesAppStore,
    required SaloonStore saloonStore,
  })  : _servicesAppStore = servicesAppStore,
        _saloonStore = saloonStore;
  final ServicesAppStore _servicesAppStore;
  final SaloonStore _saloonStore;

  List<ServiceType> get servicesTypeNotSaloonList =>
      _servicesAppStore.servicesTypeNotSaloonList(
        _saloonStore.saloonDetail.servicesType(),
      );

  @computed
  bool get isLoading =>
      _saloonStore.isLoading ||
      _servicesAppStore.isLoading;

  @observable
  int indexPage = 0;

  @observable
  ServiceType? selectedSerType;

  @action
  void setIndexPage(ServiceType? serviceType) {
    if (indexPage == 0) {
      indexPage++;
    } else {
      indexPage--;
      _selectedServicesId.clear();
    }
    selectedSerType = serviceType;
  }

  @computed
  bool get isEnabledButSaveServices => _selectedServicesId.isNotEmpty;

  @observable
  ObservableList<int> _selectedServicesId = ObservableList();

  @action
  void addListSelectedServices(int serviceId) {
    _selectedServicesId.add(serviceId);
  }

  @action
  void removeListSelectedServices(int serviceId) {
    _selectedServicesId.remove(serviceId);
  }

  List<Service> servicesSelectedSerTypeList() {
    final List<Service> list = [];
    for (var service in _servicesAppStore.servicesList) {
      if (service.serviceType.id == selectedSerType!.id) {
        list.add(service);
      }
    }
    return list;
  }

  Future<void> addServicesToSaloonDetail() async {
    await _saloonStore.updateSaloonDetail(addServices: _selectedServicesId);
  }
}
