// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_tariff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PremiumTariffModel _$PremiumTariffModelFromJson(Map<String, dynamic> json) =>
    PremiumTariffModel(
      id: json['id'] as int,
      duration: json['duration'] as int,
      price: json['price'] as String,
    );

Map<String, dynamic> _$PremiumTariffModelToJson(PremiumTariffModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'duration': instance.duration,
      'price': instance.price,
    };
