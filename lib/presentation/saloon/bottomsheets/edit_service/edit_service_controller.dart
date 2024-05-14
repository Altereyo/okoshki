import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/domain/state/app/services_store.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/domain/entities/extensions/saloon_detail.dart';

part 'edit_service_controller.g.dart';

/*
listServiceSaloon -> лист услуг салона
listServices -> лист услуг из админки
selectedService(service) -> проверяет есть ли услуга в салоне
_selectedServicesId -> лист выбранных услуг
*/

// ignore: library_private_types_in_public_api
class EditServiceController = _EditServiceController
    with _$EditServiceController;

abstract class _EditServiceController with Store {
  _EditServiceController({
    required ServiceType serviceTypeEdit,
    required ServicesAppStore servicesAppStore,
    required SaloonStore saloonStore,
  })  : _serviceTypeEdit = serviceTypeEdit,
        _servicesAppStore = servicesAppStore,
        _saloonStore = saloonStore;

  final ServiceType _serviceTypeEdit;
  final SaloonStore _saloonStore;
  final ServicesAppStore _servicesAppStore;

  @computed
  bool get isLoading =>
      _saloonStore.isLoading ||
      _servicesAppStore.isLoading; 

  List<Service> get servicesSaloonList =>
      _saloonStore.saloonDetail.servicesInServiceType(_serviceTypeEdit);
  List<Service> get servicesList =>
      _servicesAppStore.servicesInSerTypeList(_serviceTypeEdit);

  bool selectedService(Service service) {
    final res = servicesSaloonList
        .where((element) => element.id == service.id)
        .toList();
    if (res.isEmpty) {
      return false;
    } else {
      addListSelectedServices(service.id);
      return true;
    }
  }

  @computed
  bool get isEnabledButSaveChanges => _selectedServicesId.isNotEmpty;

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

  Future<void> onPressedButSaveChanges() async {
    final List<int> addServ = []; //добавить услуги в салон
    final List<int> removeServ = []; //удалить из салона

    //Проходимся по всем услугам
    for (var service in servicesList) {
      //Проверяем, есть ли услуга в салоне
      final res = servicesSaloonList
          .where((element) => element.id == service.id)
          .toList();
      if (res.isEmpty) {
        //Услуги нет
        //Проверяем есть ли она в выбранных
        final res = _selectedServicesId
            .where((element) => element == service.id)
            .toList();
        if (res.isNotEmpty) {
          //Есть в выбранных -> add
          addServ.add(service.id);
        }
      } else {
        //Есть услуга
        //Проверяем есть ли она в выбранных
        final res = _selectedServicesId
            .where((element) => element == service.id)
            .toList();
        if (res.isEmpty) {
          //Нету в выбраных -> remove
          removeServ.add(service.id);
        }
      }
    }
    if (addServ.isNotEmpty) {
      await _addServicesToSaloonDetail(addServ);
    }
    if (removeServ.isNotEmpty) {
      await _removeServicesToSaloonDetail(removeServ);
    }
  }

  Future<void> _addServicesToSaloonDetail(List<int> addServices) async {
    await _saloonStore.updateSaloonDetail(addServices: addServices);
  }

  Future<void> _removeServicesToSaloonDetail(List<int> removeServices) async {
    await _saloonStore.updateSaloonDetail(removeServices: removeServices);
  }
}
