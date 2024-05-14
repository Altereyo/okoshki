import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/window_service/window_service.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/repository/api/window_service_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class WindowServiceRepositoryImpl extends WindowServiceRepository {
  final RestClientApi _restClientApi;

  WindowServiceRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<WindowServiceModel>> getWindowServiceDetail({
    required int windowServiceId,
  }) async {
    final apiToBeCalled = _restClientApi.getWindowServiceDetail(
      windowServiceId: windowServiceId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<WindowServiceModel>> createWindowService({
    required int windowId,
    required int masterId,
    required int serviceId,
    required double price,
  }) async {
    final apiToBeCalled = _restClientApi.createWindowService(
      windowId: windowId,
      masterId: masterId,
      serviceId: serviceId,
      price: price,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<WindowServiceModel>> updateWindowService({
    required int windowServiceId,
    int? masterId,
    double? price,
  }) async {
    final apiToBeCalled = _restClientApi.updateWindowService(
      windowServiceId: windowServiceId,
      masterId: masterId,
      price: price,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> deleteWindowService(
      {required int windowServiceId}) async {
    final apiToBeCalled = _restClientApi.deleteWindowService(
      windowServiceId: windowServiceId,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
