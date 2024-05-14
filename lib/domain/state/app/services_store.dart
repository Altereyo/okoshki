import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/domain/repository/api/services_repository.dart';

part 'services_store.g.dart';

// ignore: library_private_types_in_public_api
class ServicesAppStore = _ServicesAppStore with _$ServicesAppStore;

abstract class _ServicesAppStore with Store {
  _ServicesAppStore({required ServicesRepository servicesRepository})
      : _servicesRepository = servicesRepository;
  final ServicesRepository _servicesRepository;

  Future<void> init() async {
    await _getServicesTypesList();
    await _getServicesList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  final List<ServiceType> servicesTypeList = [];
  final List<Service> servicesList = [];

  List<Service> servicesInSerTypeList(ServiceType serviceType) {
    final List<Service> list = [];
    for (var service in servicesList) {
      if (service.serviceType.id == serviceType.id) {
        list.add(service);
      }
    }
    return list;
  }

  List<ServiceType> servicesTypeNotSaloonList(
    List<ServiceType> servicesTypeSaloonList,
  ) {
    final List<ServiceType> list = [];
    for (var serType in servicesTypeList) {
      final res =
          servicesTypeSaloonList.where((element) => element.id == serType.id);
      if (res.isEmpty) {
        list.add(serType);
      }
    }
    return list;
  }

  Future<void> _getServicesTypesList() async {
    final res = await _servicesRepository.getServicesTypes();

    if (res.success) {
      servicesTypeList.addAll(res.data!);
    }
  }

  Future<void> _getServicesList() async {
    final res = await _servicesRepository.getServicesList();

    if (res.success) {
      servicesList.addAll(res.data!);
    }
  }
}
