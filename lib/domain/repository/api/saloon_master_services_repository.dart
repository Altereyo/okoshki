import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/saloon_master_service.dart';

abstract class SaloonMasterServiceRepository {
  Future<ApiResource<List<SaloonMasterService>>> getMasterServiceList(
    int masterId,
  );

  Future<ApiResource<SaloonMasterService>> createMasterService({
    required int masterId,
    required int serviceId,
    required String price,
    bool? isActive,
  });

  /// master-SERVICE-id, not master-id
  Future<ApiResource> deleteMasterService(
    int masterServiceId,
  );

  Future<ApiResource<SaloonMasterService>> updateMasterService({
    required int masterServiceId,
    String? price,
    bool? isActive,
  });
}
