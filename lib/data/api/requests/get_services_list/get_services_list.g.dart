// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_services_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServicesListBody _$GetServicesListBodyFromJson(Map<String, dynamic> json) =>
    GetServicesListBody(
      type: json['type'] as int?,
      salon: json['salon'] as int?,
      master: json['master'] as int?,
      exclude: json['exclude'] as String?,
    );

Map<String, dynamic> _$GetServicesListBodyToJson(GetServicesListBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('salon', instance.salon);
  writeNotNull('master', instance.master);
  writeNotNull('exclude', instance.exclude);
  return val;
}
