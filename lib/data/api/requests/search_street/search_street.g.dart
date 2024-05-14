// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_street.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchStreetBody _$SearchStreetBodyFromJson(Map<String, dynamic> json) =>
    SearchStreetBody(
      city: json['city'] as String?,
      street: json['street'] as String?,
    );

Map<String, dynamic> _$SearchStreetBodyToJson(SearchStreetBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('city', instance.city);
  writeNotNull('street', instance.street);
  return val;
}
