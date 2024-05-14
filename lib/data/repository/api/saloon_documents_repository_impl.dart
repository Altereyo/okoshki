import 'dart:io';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/saloon_document/saloon_document.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/repository/api/saloon_documents_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class SaloonDocumentsRepositoryImpl extends SaloonDocumentsRepository {
  final RestClientApi _restClientApi;

  SaloonDocumentsRepositoryImpl({required RestClientApi restClientApi})
      : _restClientApi = restClientApi;

  @override
  Future<ApiResource<SaloonDocumentModel>> createSaloonDocument({
    required int saloonId,
    required String title,
    String? description,
    required File document,
  }) async {
    final apiToBeCalled = _restClientApi.createSaloonDocument(
      saloonId: saloonId,
      title: title,
      description: description,
      document: document,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<SaloonDocumentModel>>> getSaloonDocumentList(
    int saloonId,
  ) async {
    final apiToBeCalled = _restClientApi.getSaloonDocumentList(
      saloonId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonDocumentModel>> updateSaloonDocument({
    required int documentId,
    String? title,
    String? description,
    File? document,
  }) async {
    final apiToBeCalled = _restClientApi.updateSaloonDocument(
      documentId: documentId,
      title: title,
      description: description,
      document: document,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> deleteSaloonDocument(
    int documentId,
  ) async {
    final apiToBeCalled = _restClientApi.deleteSaloonDocument(
      documentId,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
