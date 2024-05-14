import 'dart:io';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/saloon_detail/saloon_detail.dart';
import 'package:okoshki/data/models/saloon_photo/saloon_photo.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/repository/api/saloon_photo_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class SaloonPhotoRepositoryImpl extends SaloonPhotoRepository {
  final RestClientApi _restClientApi;

  SaloonPhotoRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<SaloonDetailModel>> createLogo({
    required int saloonId,
    required File logo,
  }) async {
    final apiToBeCalled = _restClientApi.updateSaloonLogo(
      saloonId: saloonId,
      logo: logo,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonDetailModel>> deleteLogo({
    required int saloonId,
  }) async {
    final apiToBeCalled = _restClientApi.deleteLogo(
      saloonId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonPhotoModel>> createPhoto({
    required int saloonId,
    required File photo,
  }) async {
    final apiToBeCalled = _restClientApi.createSaloonPhoto(
      salon: saloonId,
      image: photo,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> deleteSaloonPhoto({
    required int photoId,
  }) async {
    final apiToBeCalled = _restClientApi.deleteSaloonPhoto(
      photoId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<SaloonPhotoModel>>> getPhotoList({
    required int saloonId,
  }) async {
    final apiToBeCalled = _restClientApi.getSaloonPhotoList(
      saloonId,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
