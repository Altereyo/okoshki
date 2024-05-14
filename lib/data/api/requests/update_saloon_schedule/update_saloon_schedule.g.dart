// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_saloon_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSaloonScheduleBody _$UpdateSaloonScheduleBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateSaloonScheduleBody(
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      weekend: json['weekend'] as int?,
    );

Map<String, dynamic> _$UpdateSaloonScheduleBodyToJson(
    UpdateSaloonScheduleBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start_time', instance.startTime);
  writeNotNull('end_time', instance.endTime);
  writeNotNull('weekend', instance.weekend);
  return val;
}
