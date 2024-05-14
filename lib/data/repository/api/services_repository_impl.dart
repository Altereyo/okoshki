import 'package:okoshki/data/api/requests/get_services_list/get_services_list.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/service/service.dart';
import 'package:okoshki/data/models/service_type/service_type.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/repository/api/services_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class ServicesRepositoryImpl extends ServicesRepository {
  final RestClientApi _restClientApi;

  ServicesRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<ServiceTypeModel>>> getServicesTypes() async {
    final apiToBeCalled = _restClientApi.getServicesTypes();
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<ServiceModel>>> getServicesList({
    int? serviceTypeId,
    int? saloonId,
    int? masterId,
    bool? exclude,
  }) async {
    final body = GetServicesListBody(
      type: serviceTypeId,
      salon: saloonId,
      master: masterId,
      exclude: (exclude ?? false) ? '_' : null,
    );
    final apiToBeCalled = _restClientApi.getServicesList(
      body.toJson(),
    );
    return await safeApiCall(apiToBeCalled);
  }
}
