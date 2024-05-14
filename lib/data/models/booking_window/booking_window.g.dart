// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_window.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingWindowModel _$BookingWindowModelFromJson(Map<String, dynamic> json) =>
    BookingWindowModel(
      id: json['id'] as int,
      uid: json['uid'] as String,
      service: json['service'] as int,
      clientModel:
          BookingClientModel.fromJson(json['client'] as Map<String, dynamic>),
      status: json['status'] as String,
      commissionAmount: (json['commission_amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookingWindowModelToJson(BookingWindowModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'status': instance.status,
      'commission_amount': instance.commissionAmount,
      'service': instance.service,
      'client': instance.clientModel,
    };
