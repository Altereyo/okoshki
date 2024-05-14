// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      id: json['id'] as int,
      uid: json['uid'] as String,
      status: json['status'] as String,
      serviceModel:
          WindowServiceModel.fromJson(json['service'] as Map<String, dynamic>),
      windowModel: WindowModel.fromJson(json['window'] as Map<String, dynamic>),
      salonModel: SaloonModel.fromJson(json['salon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'status': instance.status,
      'service': instance.serviceModel,
      'window': instance.windowModel,
      'salon': instance.salonModel,
    };
