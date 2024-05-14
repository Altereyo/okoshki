import 'package:okoshki/domain/entities/service.dart';

class SaloonMasterService {
  final int? id;
  final int? master;
  final Service service;
  String price;
  bool isActive;

  SaloonMasterService({
    required this.id,
    required this.master,
    required this.service,
    required this.price,
    required this.isActive,
  });

  @override
  String toString() =>
      'SaloonMasterService{id: $id, master: $master, service: $service, price: $price, isActive: $isActive}';
}
