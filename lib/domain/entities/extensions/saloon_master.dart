import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/entities/saloon_master_service.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';

extension SaloonMasterExtension on SaloonMaster {

  // как пример, что так тоже можно)
  // 1 - мапим в массиве сервисы к их типам
  // 2 - приводим к Set, что позволяет удалить дубликаты, и обратно в List
  List<ServiceType> get _servicesType =>
      /*1*/(services?.map((masterService) => masterService.service.serviceType) ?? [])
      /*2*/.toSet().toList();

  List<ServiceType> servicesType() {
    final List<ServiceType> servicesType = [];
    
    for (SaloonMasterService service in services ?? []) {
      //Если данного элемента нет в листе то добавить
      final res = servicesType.where(
        (element) => element.id == service.service.serviceType.id,
      );
      if (res.isEmpty) {
        servicesType.add(service.service.serviceType);
      }
    }
    return servicesType;
  }

  // в качестве аргумента вместо объекта ServiceType можно прокинуть сразу id нужного serviceType
  List<Service> servicesInServiceType(ServiceType serviceType) {
    // чисто вкусовщина, но мне больше нравятся методы вместо циклов :)
    // return services
    //   ?.where((service) => serviceType.id == service.serviceType.id)
    //   .toList() ?? [];
    final List<Service> servicesInServiceType = [];
    for (SaloonMasterService service in services ?? []) {
      if (serviceType.id == service.service.serviceType.id) {
        servicesInServiceType.add(service.service);
      }
    }
    return servicesInServiceType;
  }
}
