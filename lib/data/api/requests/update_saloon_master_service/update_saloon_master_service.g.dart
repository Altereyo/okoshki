// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_saloon_master_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSaloonMasterServiceBody _$UpdateSaloonMasterServiceBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateSaloonMasterServiceBody(
      price: json['price'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$UpdateSaloonMasterServiceBodyToJson(
        UpdateSaloonMasterServiceBody instance) =>
    <String, dynamic>{
      'price': instance.price,
      'is_active': instance.isActive,
    };
