import 'package:intl/intl.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/saloon_balance.dart';
import 'package:okoshki/domain/repository/api/saloon_balance_repository.dart';
import 'package:okoshki/internal/functions/download_storage_directory.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class SaloonBalanceRepositoryImpl extends SaloonBalanceRepository {
  final RestClientApi _restClientApi;

  SaloonBalanceRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<SaloonBalance>>> getSaloonBalanceList({
    required int saloonId,
    DateTime? from,
    DateTime? to,
  }) async {
    final apiToBeCalled = _restClientApi.getSaloonBalanceList(
      saloonId: saloonId,
      from: from != null ? DateFormat('yyyy-MM-dd').format(from) : null,
      to: to != null ? DateFormat('yyyy-MM-dd').format(to) : null,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<void> getSaloonPaymentPdf({
    required int saloonId,
    required String sum,
  }) async {
    final apiToBeCalled = _restClientApi.getSaloonPaymentPdf(
      saloonId: saloonId,
      sum: sum,
    );
    final res = await safeApiCall(apiToBeCalled);
    if (res.success) {
      final title = DateTime.now().microsecondsSinceEpoch.toString();
      await downloadStorageDirectory(
        bytes: res.data!,
        title: title,
      );
    }
  }
}
