// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingClientModel _$BookingClientModelFromJson(Map<String, dynamic> json) =>
    BookingClientModel(
      id: json['id'] as int,
      username: json['username'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$BookingClientModelToJson(BookingClientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'phone_number': instance.phoneNumber,
    };
