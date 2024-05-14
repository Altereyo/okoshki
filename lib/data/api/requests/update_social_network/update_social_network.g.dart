// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_social_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSocialNetworkBody _$UpdateSocialNetworkBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateSocialNetworkBody(
      url: json['url'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$UpdateSocialNetworkBodyToJson(
    UpdateSocialNetworkBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('is_active', instance.isActive);
  return val;
}
