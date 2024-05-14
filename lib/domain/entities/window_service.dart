import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/entities/service.dart';

class WindowService {
  final int? id;
  final Service service;
  final SaloonMaster master;
  final String price;

  const WindowService({
    this.id,
    required this.service,
    required this.master,
    required this.price,
  });

  @override
  String toString() {
    return 'winSerId: $id serId:${service.id} masterid: ${master.id} prise: $price';
  }
}
