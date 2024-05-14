// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_house_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHouseNumberBody _$SearchHouseNumberBodyFromJson(
        Map<String, dynamic> json) =>
    SearchHouseNumberBody(
      city: json['city'] as String?,
      street: json['street'] as String?,
      houseNumber: json['house_number'] as String?,
    );

Map<String, dynamic> _$SearchHouseNumberBodyToJson(
    SearchHouseNumberBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('city', instance.city);
  writeNotNull('street', instance.street);
  writeNotNull('house_number', instance.houseNumber);
  return val;
}
