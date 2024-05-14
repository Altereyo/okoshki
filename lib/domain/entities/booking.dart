import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/entities/window_service.dart';
//Бронь клиента
class Booking {
  final int id;
  final String uid;
  final String status;
  final WindowService service;
  final Window window;
  final Saloon salon;

  const Booking({
    required this.id,
    required this.uid,
    required this.status,
    required this.service,
    required this.window,
    required this.salon,
  });

  @override
  String toString() {
    return 'id: $id uid: $uid status: $status  service: $service window: $window saloon $salon';
  }
}
