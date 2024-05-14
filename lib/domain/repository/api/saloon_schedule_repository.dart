import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';

abstract class SaloonScheduleRepository {
  Future<ApiResource<List<SaloonSchedule>>> getSaloonScheduleList({
    required int saloonId,
  });

  Future<ApiResource<SaloonSchedule>> updateSaloonSchedule({
    required int sheduleId,
    DateTime? startTime,
    DateTime? endTime,
    bool? weekend,
  });
}
