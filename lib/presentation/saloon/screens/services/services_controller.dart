import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/domain/state/app/services_store.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';

part 'services_controller.g.dart';

// ignore: library_private_types_in_public_api
class ServicesSaloonController = _ServicesSaloonController
    with _$ServicesSaloonController;

abstract class _ServicesSaloonController with Store {
  _ServicesSaloonController({
    required SaloonStore saloonStore,
    required ServicesAppStore servicesAppStore,
  })  : _saloonStore = saloonStore,
        _servicesAppStore = servicesAppStore;

  final SaloonStore _saloonStore;
  final ServicesAppStore _servicesAppStore;

  @computed
  bool get isLoading => _saloonStore.isLoading || _servicesAppStore.isLoading;

  SaloonDetail get saloonDetail => _saloonStore.saloonDetail;

  List<ServiceType> get servicesTypeList => _servicesAppStore.servicesTypeList;

  Future<void> removeServiseType(ServiceType serviseType) async {
    final List<int> removeServices = [];

    for (Service service in saloonDetail.services ?? []) {
      if (service.serviceType.id == serviseType.id) {
        removeServices.add(service.id);
      }
    }
    await _saloonStore.updateSaloonDetail(removeServices: removeServices);
  }
}
