// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_saloon_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSaloonProfileBody _$UpdateSaloonProfileBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateSaloonProfileBody(
      title: json['title'] as String?,
      addServices: json['add_services'] as String?,
      removeServices: json['remove_services'] as String?,
      site: json['site'] as String?,
      description: json['description'] as String?,
      setAddress: json['set_address'] as String?,
    );

Map<String, dynamic> _$UpdateSaloonProfileBodyToJson(
    UpdateSaloonProfileBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('add_services', instance.addServices);
  writeNotNull('remove_services', instance.removeServices);
  writeNotNull('site', instance.site);
  writeNotNull('description', instance.description);
  writeNotNull('set_address', instance.setAddress);
  return val;
}
