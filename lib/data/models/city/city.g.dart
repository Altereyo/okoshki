// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: json['id'] as int,
      title: json['title'] as String,
      centerLat: (json['center_lat'] as num).toDouble(),
      centerLon: (json['center_lon'] as num).toDouble(),
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'center_lat': instance.centerLat,
      'center_lon': instance.centerLon,
    };
