import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/address.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';

extension SaloonDetailExtension on SaloonDetail {
  SaloonDetail copyWith({
    String? title,
    String? description,
    Address? address,
    String? logo,
    String? site,
    List<Service>? services,
  }) {
    return SaloonDetail(
      id: id,
      uid: uid,
      title: title ?? this.title,
      balance: balance,
      description: description ?? this.description,
      balanceLastUpdate: balanceLastUpdate,
      address: address ?? this.address,
      logo: logo ?? this.logo,
      commission: commission,
      site: site ?? this.site,
      appliedCommission: appliedCommission,
      isPremium: isPremium,
      rating: rating,
      numComment: numComment,
      services: services ?? this.services,
      usersLiked: usersLiked,
      applyTariff: applyTariff,
    );
  }

  String get distanceToString => distance! < 1000
      ? '${NumberFormat('###').format(distance)} м'
      : '${NumberFormat('###.0').format(distance! / 1000)} км';

  String dateTimeUpdateBalance() {
    final dateTime = DateTime.parse(balanceLastUpdate ?? '').toLocal();
    return '${DateFormat.Hm().format(dateTime)}, ${DateFormat.yMd().format(dateTime)}';
  }

  //Все типы услуг салона
  List<ServiceType> servicesType() {
    final List<ServiceType> servicesType = [];
    for (Service service in services ?? []) {
      //Если данного элемента нет в листе то добавить
      final res = servicesType.where(
        (element) => element.id == service.serviceType.id,
      );
      if (res.isEmpty) {
        servicesType.add(service.serviceType);
      }
    }
    return servicesType;
  }

  //Все услги определленого типа услуг
  List<Service> servicesInServiceType(ServiceType serviceType) {
    final List<Service> servicesInServiceType = [];
    for (Service service in services ?? []) {
      if (serviceType.id == service.serviceType.id) {
        servicesInServiceType.add(service);
      }
    }
    return servicesInServiceType;
  }
}
