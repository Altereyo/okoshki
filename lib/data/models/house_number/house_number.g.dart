// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseNumberModel _$HouseNumberModelFromJson(Map<String, dynamic> json) =>
    HouseNumberModel(
      houseNumber: json['house_number'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$HouseNumberModelToJson(HouseNumberModel instance) =>
    <String, dynamic>{
      'house_number': instance.houseNumber,
      'lat': instance.lat,
      'lon': instance.lon,
    };
