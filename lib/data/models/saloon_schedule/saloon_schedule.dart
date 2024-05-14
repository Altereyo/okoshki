import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';

part 'saloon_schedule.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class SaloonScheduleModel extends SaloonSchedule {
  SaloonScheduleModel({
    required super.id,
    required super.weekDay,
    required super.startTime,
    required super.endTime,
    required super.weekend,
  });

  factory SaloonScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$SaloonScheduleModelFromJson(json);
}
