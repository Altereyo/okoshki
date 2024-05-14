// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_blocking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientBlockingModel _$ClientBlockingModelFromJson(Map<String, dynamic> json) =>
    ClientBlockingModel(
      blockingTo: json['blocking_to'] as String,
      created: json['created'] as String,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$ClientBlockingModelToJson(
        ClientBlockingModel instance) =>
    <String, dynamic>{
      'blocking_to': instance.blockingTo,
      'created': instance.created,
      'is_active': instance.isActive,
    };
