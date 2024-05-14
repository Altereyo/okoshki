// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialNetworkModel _$SocialNetworkModelFromJson(Map<String, dynamic> json) =>
    SocialNetworkModel(
      id: json['id'] as int,
      salon: json['salon'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$SocialNetworkModelToJson(SocialNetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salon': instance.salon,
      'url': instance.url,
      'title': instance.title,
      'is_active': instance.isActive,
    };
