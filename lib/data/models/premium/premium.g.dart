// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PremiumModel _$PremiumModelFromJson(Map<String, dynamic> json) => PremiumModel(
      id: json['id'] as int,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
    );

Map<String, dynamic> _$PremiumModelToJson(PremiumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
