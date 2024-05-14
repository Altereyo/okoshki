// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindowModel _$WindowModelFromJson(Map<String, dynamic> json) => WindowModel(
      id: json['id'] as int?,
      startDt: json['start_dt'] as String,
      endDt: json['end_dt'] as String,
      status: json['status'] as String?,
      servicesModel: (json['services'] as List<dynamic>)
          .map((e) => WindowServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingsModel: (json['bookings'] as List<dynamic>?)
          ?.map((e) => BookingWindowModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WindowModelToJson(WindowModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_dt': instance.startDt,
      'end_dt': instance.endDt,
      'status': instance.status,
      'services': instance.servicesModel,
      'bookings': instance.bookingsModel,
    };
