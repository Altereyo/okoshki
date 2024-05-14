import 'package:okoshki/data/api/requests/create_saloon_master_service/create_saloon_master_service.dart';
import 'package:okoshki/data/api/requests/update_saloon_master_service/update_saloon_master_service.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/saloon_master_service/saloon_master_service.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/repository/api/saloon_master_services_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class SaloonMasterServiceRepositoryImpl extends SaloonMasterServiceRepository {
  final RestClientApi _restClientApi;

  SaloonMasterServiceRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<SaloonMasterServiceModel>>> getMasterServiceList(
    int masterId,
  ) async {
    final apiToBeCalled = _restClientApi.getSaloonMasterServiceList(
      masterId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonMasterServiceModel>> createMasterService({
    required int masterId,
    required int serviceId,
    required String price,
    bool? isActive,
  }) async {
    final body = CreateSaloonMasterServiceBody(
      master: masterId,
      service: serviceId,
      price: price,
      isActive: (isActive ?? false) ? 1 : 0,
    );
    final apiToBeCalled = _restClientApi.createSaloonMasterService(
      body,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> deleteMasterService(
    int masterServiceId,
  ) async {
    final apiToBeCalled = _restClientApi.deleteSaloonMasterService(
      masterServiceId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonMasterServiceModel>> updateMasterService({
    required int masterServiceId,
    String? price,
    bool? isActive,
  }) async {
    final body = UpdateSaloonMasterServiceBody(
      price: price,
      isActive: (isActive ?? false) ? 1 : 0,
    );
    final apiToBeCalled = _restClientApi.updateSaloonMasterService(
      masterServiceId: masterServiceId,
      body: body,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
