import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/saloon_balance.dart';

abstract class SaloonBalanceRepository {
  Future<ApiResource<List<SaloonBalance>>> getSaloonBalanceList({
    required int saloonId,
    DateTime? from,
    DateTime? to,
  });

  Future<void> getSaloonPaymentPdf({
    required int saloonId,
    required String sum,
  });

 
}
