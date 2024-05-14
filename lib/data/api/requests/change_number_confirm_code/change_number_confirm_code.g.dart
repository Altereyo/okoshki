// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_number_confirm_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeNumberConfirmCodeBody _$ChangeNumberConfirmCodeBodyFromJson(
        Map<String, dynamic> json) =>
    ChangeNumberConfirmCodeBody(
      phoneNumber: json['phone_number'] as String?,
      smsCode: json['sms_code'] as String?,
    );

Map<String, dynamic> _$ChangeNumberConfirmCodeBodyToJson(
    ChangeNumberConfirmCodeBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('sms_code', instance.smsCode);
  return val;
}
