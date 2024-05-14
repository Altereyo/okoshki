// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_addresses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAddressesBody _$GetAddressesBodyFromJson(Map<String, dynamic> json) =>
    GetAddressesBody(
      polygon: json['polygon'] as String?,
      city: json['city'] as int?,
    );

Map<String, dynamic> _$GetAddressesBodyToJson(GetAddressesBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('polygon', instance.polygon);
  writeNotNull('city', instance.city);
  return val;
}
