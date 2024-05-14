import 'package:okoshki/domain/entities/saloon_master_service.dart';

class SaloonMaster {
  final int id;
  final int? salon;
  final String name;
  final String? specialization;
  final String? avatar;
  final List<SaloonMasterService>? services;

  const SaloonMaster({
    required this.id,
    required this.salon,
    required this.name,
    this.specialization,
    this.avatar,
    this.services,
  });
}
