import 'package:okoshki/domain/entities/service_type.dart';

class Service {
  final int id;
  final String title;
  final ServiceType serviceType;

  const Service({
    required this.id,
    required this.title,
    required this.serviceType,
  });
}
