import 'dart:io';

import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/saloon_document.dart';

abstract class SaloonDocumentsRepository {
  Future<ApiResource<SaloonDocument>> createSaloonDocument({
    required int saloonId,
    required String title,
    String? description,
    required File document,
  });

  Future<ApiResource<List<SaloonDocument>>> getSaloonDocumentList(
    int saloonId,
  );

  Future<ApiResource<SaloonDocument>> updateSaloonDocument({
    required int documentId,
    String? title,
    String? description,
    File? document,
  });

  Future<ApiResource> deleteSaloonDocument(
    int documentId,
  );
}
