// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_window_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateWindowServiceBody _$CreateWindowServiceBodyFromJson(
        Map<String, dynamic> json) =>
    CreateWindowServiceBody(
      id: json['id'] as int?,
      sId: json['s_id'] as int,
      mId: json['m_id'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateWindowServiceBodyToJson(
        CreateWindowServiceBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      's_id': instance.sId,
      'm_id': instance.mId,
      'price': instance.price,
    };
