// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      id: json['id'] as int,
      title: json['title'] as String,
      serviceTypeModel: ServiceTypeModel.fromJson(
          json['service_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'service_type': instance.serviceTypeModel,
    };
