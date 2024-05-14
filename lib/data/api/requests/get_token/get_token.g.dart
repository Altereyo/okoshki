// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenBody _$GetTokenBodyFromJson(Map<String, dynamic> json) => GetTokenBody(
      registrationId: json['registration_id'] as String,
      deviceId: json['device_id'] as String,
      deviceType: json['device_type'] as String,
      phoneNumber: json['phone_number'] as String?,
      smsCode: json['sms_code'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$GetTokenBodyToJson(GetTokenBody instance) {
  final val = <String, dynamic>{
    'registration_id': instance.registrationId,
    'device_id': instance.deviceId,
    'device_type': instance.deviceType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('sms_code', instance.smsCode);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  return val;
}
