// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_saloon_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSaloonListBody _$GetSaloonListBodyFromJson(Map<String, dynamic> json) =>
    GetSaloonListBody(
      polygon: json['polygon'] as String?,
      point: json['point'] as String?,
      distance: json['distance'] as int?,
      services: json['services'] as String?,
      sort: json['sort'] as String?,
      windows: json['windows'] as String?,
      owner: json['owner'] as bool?,
      search: json['search'] as String?,
      cost: json['cost'] as int?,
      windowsDate: json['windows_date'] as String?,
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
    );

Map<String, dynamic> _$GetSaloonListBodyToJson(GetSaloonListBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('polygon', instance.polygon);
  writeNotNull('point', instance.point);
  writeNotNull('distance', instance.distance);
  writeNotNull('services', instance.services);
  writeNotNull('sort', instance.sort);
  writeNotNull('windows', instance.windows);
  writeNotNull('owner', instance.owner);
  writeNotNull('search', instance.search);
  writeNotNull('cost', instance.cost);
  writeNotNull('windows_date', instance.windowsDate);
  writeNotNull('page', instance.page);
  writeNotNull('page_size', instance.pageSize);
  return val;
}
