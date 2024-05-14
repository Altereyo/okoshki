import 'package:json_annotation/json_annotation.dart';

part 'update_saloon_schedule.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class UpdateSaloonScheduleBody {
  final String? startTime;
  final String? endTime;
  final int? weekend;

  UpdateSaloonScheduleBody({
    required this.startTime,
    required this.endTime,
    required this.weekend,
  });

  Map<String, dynamic> toJson() => _$UpdateSaloonScheduleBodyToJson(this);
}
