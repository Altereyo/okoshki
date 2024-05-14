// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_saloon_master_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSaloonMasterServiceBody _$CreateSaloonMasterServiceBodyFromJson(
        Map<String, dynamic> json) =>
    CreateSaloonMasterServiceBody(
      master: json['master'] as int,
      service: json['service'] as int,
      price: json['price'] as String,
      isActive: json['is_active'] as int,
    );

Map<String, dynamic> _$CreateSaloonMasterServiceBodyToJson(
        CreateSaloonMasterServiceBody instance) =>
    <String, dynamic>{
      'master': instance.master,
      'service': instance.service,
      'price': instance.price,
      'is_active': instance.isActive,
    };
