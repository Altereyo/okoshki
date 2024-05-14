import 'dart:io';

import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/stock.dart';

abstract class StockRepository {
  Future<ApiResource<List<Stock>>> getStockList({
    required int saloonId,
  });

  Future<ApiResource<Stock>> createStock({
    required int saloonId,
    required String title,
    required String duration,
    String? description,
    File? logo,
  });

  Future<ApiResource<Stock>> updateStock({
    required int stockId,
    String? title,
    String? duration,
    String? description,
    File? logo,
  });

  Future<ApiResource<Stock>> deleteLogoStock({
    required int stockId,
  });

  Future<ApiResource> deleteStock({
    required int stockId,
  });
}
