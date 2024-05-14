// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_window_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWindowListBody _$GetWindowListBodyFromJson(Map<String, dynamic> json) =>
    GetWindowListBody(
      salon: json['salon'] as int,
      status: json['status'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$GetWindowListBodyToJson(GetWindowListBody instance) {
  final val = <String, dynamic>{
    'salon': instance.salon,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('from', instance.from);
  writeNotNull('to', instance.to);
  return val;
}
