// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestRegisterBody _$RequestRegisterBodyFromJson(Map<String, dynamic> json) =>
    RequestRegisterBody(
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      salonTitle: json['salon_title'] as String,
      services: json['services'] as String,
    );

Map<String, dynamic> _$RequestRegisterBodyToJson(
        RequestRegisterBody instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'salon_title': instance.salonTitle,
      'services': instance.services,
    };
