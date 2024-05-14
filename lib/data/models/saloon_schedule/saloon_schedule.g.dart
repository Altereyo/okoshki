// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaloonScheduleModel _$SaloonScheduleModelFromJson(Map<String, dynamic> json) =>
    SaloonScheduleModel(
      id: json['id'] as int,
      weekDay: json['week_day'] as int,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      weekend: json['weekend'] as bool,
    );

Map<String, dynamic> _$SaloonScheduleModelToJson(
        SaloonScheduleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'week_day': instance.weekDay,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'weekend': instance.weekend,
    };
