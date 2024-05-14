// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_window_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWindowServiceModel _$CurrentWindowServiceModelFromJson(
        Map<String, dynamic> json) =>
    CurrentWindowServiceModel(
      id: json['id'] as int,
      service: json['service'] as int,
      master: json['master'] as int,
      price: json['price'] as String,
    );

Map<String, dynamic> _$CurrentWindowServiceModelToJson(
        CurrentWindowServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'master': instance.master,
      'price': instance.price,
    };
