import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/saloon_statistics.dart';

abstract class SaloonStatisticsRepository {
  Future<ApiResource<SaloonStatistics>> getSaloonStatistics({
    required int saloonId,
    DateTime? from,
    DateTime? to,
  });

  Future<void> getSaloonStatisticsPdf({
    required int saloonId,
    DateTime? from,
    DateTime? to,
  });
}
