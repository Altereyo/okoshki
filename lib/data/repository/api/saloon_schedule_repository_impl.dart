import 'package:intl/intl.dart';
import 'package:okoshki/data/api/requests/update_saloon_schedule/update_saloon_schedule.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/saloon_schedule/saloon_schedule.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/repository/api/saloon_schedule_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class SaloonScheduleRepositoryImpl extends SaloonScheduleRepository {
  final RestClientApi _restClientApi;

  SaloonScheduleRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<SaloonScheduleModel>>> getSaloonScheduleList({
    required int saloonId,
  }) async {
    final apiToBeCalled = _restClientApi.getSaloonScheduleList(
      saloonId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonScheduleModel>> updateSaloonSchedule({
    required int sheduleId,
    DateTime? startTime,
    DateTime? endTime,
    bool? weekend,
  }) async {
    final start =
        startTime != null ? DateFormat('HH:mm').format(startTime) : null;
    final end = endTime != null ? DateFormat('HH:mm').format(endTime) : null;
    final body = UpdateSaloonScheduleBody(
      startTime: start,
      endTime: end,
      weekend: (weekend ?? false) ? 1 : 0,
    );
    final apiToBeCalled = _restClientApi.updateSaloonSchedule(
      sheduleId,
      body,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
