import 'dart:io';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/stock/stock.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/stock.dart';
import 'package:okoshki/domain/repository/api/stock_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class StockRepositoryImpl extends StockRepository {
  final RestClientApi _restClientApi;

  StockRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<StockModel>>> getStockList({
    required int saloonId,
  }) async {
    final apiToBeCalled = _restClientApi.getStockList(
      saloonId: saloonId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<StockModel>> createStock({
    required int saloonId,
    required String title,
    required String duration,
    String? description,
    File? logo,
  }) async {
    final apiToBeCalled = _restClientApi.createStock(
      saloonId: saloonId,
      title: title,
      duration: duration,
      description: description,
      logo: logo,
    );

    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<StockModel>> updateStock({
    required int stockId,
    String? title,
    String? duration,
    String? description,
    File? logo,
  }) async {
    final apiToBeCalled = _restClientApi.updateStock(
      stockId: stockId,
      title: title,
      duration: duration,
      description: description,
      logo: logo,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<Stock>> deleteLogoStock({
    required int stockId,
  }) async {
    final apiToBeCalled = _restClientApi.deleteLogoStock(
      stockId: stockId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> deleteStock({
    required int stockId,
  }) async {
    final apiToBeCalled = _restClientApi.deleteStock(
      stockId: stockId,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
