import 'package:intl/intl.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/saloon_statistics.dart';
import 'package:okoshki/domain/repository/api/saloon_statistics_repository.dart';
import 'package:okoshki/internal/functions/download_storage_directory.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class SaloonStatisticsRepositoryImpl extends SaloonStatisticsRepository {
  final RestClientApi _restClientApi;

  SaloonStatisticsRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<SaloonStatistics>> getSaloonStatistics({
    required int saloonId,
    DateTime? from,
    DateTime? to,
  }) async {
    final apiToBeCalled = _restClientApi.getSaloonStatistics(
      saloonId: saloonId,
      from: from != null ? DateFormat('yyyy-MM-dd').format(from) : null,
      to: to != null ? DateFormat('yyyy-MM-dd').format(to) : null,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<void> getSaloonStatisticsPdf({
    required int saloonId,
    DateTime? from,
    DateTime? to,
  }) async {
    final apiToBeCalled = _restClientApi.getSaloonStatisticsPDF(
      saloonId: saloonId,
      from: from != null ? DateFormat('yyyy-MM-dd').format(from) : null,
      to: to != null ? DateFormat('yyyy-MM-dd').format(to) : null,
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
