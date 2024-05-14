// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindowServiceModel _$WindowServiceModelFromJson(Map<String, dynamic> json) =>
    WindowServiceModel(
      id: json['id'] as int?,
      serviceModel:
          ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
      masterModel:
          SaloonMasterModel.fromJson(json['master'] as Map<String, dynamic>),
      price: json['price'] as String,
    );

Map<String, dynamic> _$WindowServiceModelToJson(WindowServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'service': instance.serviceModel,
      'master': instance.masterModel,
    };
