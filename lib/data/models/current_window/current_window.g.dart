// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_window.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWindowModel _$CurrentWindowModelFromJson(Map<String, dynamic> json) =>
    CurrentWindowModel(
      id: json['id'] as int,
      startDt: json['start_dt'] as String,
      endDt: json['end_dt'] as String,
      servicesModel: (json['services'] as List<dynamic>)
          .map((e) =>
              CurrentWindowServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrentWindowModelToJson(CurrentWindowModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_dt': instance.startDt,
      'end_dt': instance.endDt,
      'services': instance.servicesModel,
    };
