// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettingModel _$AppSettingModelFromJson(Map<String, dynamic> json) =>
    AppSettingModel(
      telegramId: json['telegram_id'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$AppSettingModelToJson(AppSettingModel instance) =>
    <String, dynamic>{
      'telegram_id': instance.telegramId,
      'phone_number': instance.phoneNumber,
    };
