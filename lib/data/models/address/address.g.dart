// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      id: json['id'] as int,
      cityModel: CityModel.fromJson(json['city'] as Map<String, dynamic>),
      street: json['street'] as String,
      houseNumber: json['house_number'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'house_number': instance.houseNumber,
      'lat': instance.lat,
      'lon': instance.lon,
      'city': instance.cityModel,
    };
