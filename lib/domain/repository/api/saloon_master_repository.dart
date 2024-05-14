import 'dart:io';

import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';

abstract class SaloonMasterRepository {
  Future<ApiResource<List<SaloonMaster>>> getMasterList([
    int? salonId,
  ]);

  Future<ApiResource<SaloonMaster>> createMaster({
    required int salonId,
    required String name,
    String? specialization,
    File? avatar,
  });

  Future<ApiResource<SaloonMaster>> getSaloonMaster({
    required int masterId,
  });

  Future<ApiResource> deleteSaloonMaster({
    required int masterId,
  });

  Future<ApiResource> deleteSaloonMasterAvatar({
    required int masterId,
  });

  Future<ApiResource<SaloonMaster>> updateSaloonMaster({
    required int masterId,
    required int salonId,
    String? name,
    String? specialization,
    File? avatar,
  });
}
