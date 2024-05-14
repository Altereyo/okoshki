// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockModel _$StockModelFromJson(Map<String, dynamic> json) => StockModel(
      id: json['id'] as int,
      title: json['title'] as String,
      duration: json['duration'] as String,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$StockModelToJson(StockModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'description': instance.description,
      'logo': instance.logo,
    };
