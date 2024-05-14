import 'dart:io';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/saloon_master/saloon_master.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/repository/api/saloon_master_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class SaloonMasterRepositoryImpl extends SaloonMasterRepository {
  final RestClientApi _restClientApi;

  SaloonMasterRepositoryImpl({required RestClientApi restClientApi})
      : _restClientApi = restClientApi;

  @override
  Future<ApiResource<SaloonMasterModel>> createMaster({
    required int salonId,
    required String name,
    String? specialization,
    File? avatar,
  }) async {
    final apiToBeCalled = _restClientApi.createSaloonMaster(
      salon: salonId,
      first_name: name,
      specialization: specialization,
      avatar: avatar,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<SaloonMasterModel>>> getMasterList([
    int? salonId,
  ]) async {
    final apiToBeCalled = _restClientApi.getSaloonMasterList(
      salonId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonMasterModel>> getSaloonMaster({
    required int masterId,
  }) async {
    final apiToBeCalled = _restClientApi.getSaloonMaster(
      masterId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> deleteSaloonMaster({
    required int masterId,
  }) async {
    final apiToBeCalled = _restClientApi.deleteSaloonMaster(
      masterId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> deleteSaloonMasterAvatar({
    required int masterId,
  }) async {
    final apiToBeCalled = _restClientApi.deleteSaloonMasterAvatar(
      masterId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonMasterModel>> updateSaloonMaster({
    required int masterId,
    required int salonId,
    String? name,
    String? specialization,
    File? avatar,
  }) async {
    final apiToBeCalled = _restClientApi.updateSaloonMaster(
      masterId: masterId,
      salon: salonId,
      first_name: name,
      specialization: specialization,
      avatar: avatar,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
