// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchItemModel _$SearchItemModelFromJson(Map<String, dynamic> json) =>
    SearchItemModel(
      search: json['search'] as String,
      type: json['type'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$SearchItemModelToJson(SearchItemModel instance) =>
    <String, dynamic>{
      'search': instance.search,
      'type': instance.type,
      'city': instance.city,
    };
