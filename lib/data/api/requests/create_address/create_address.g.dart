// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAddressBody _$CreateAddressBodyFromJson(Map<String, dynamic> json) =>
    CreateAddressBody(
      city: json['city'] as int,
      street: json['street'] as String,
      houseNumber: json['house_number'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateAddressBodyToJson(CreateAddressBody instance) =>
    <String, dynamic>{
      'city': instance.city,
      'street': instance.street,
      'house_number': instance.houseNumber,
      'lat': instance.lat,
      'lon': instance.lon,
    };
