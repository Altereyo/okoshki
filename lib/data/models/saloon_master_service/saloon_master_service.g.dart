// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon_master_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaloonMasterServiceModel _$SaloonMasterServiceModelFromJson(
        Map<String, dynamic> json) =>
    SaloonMasterServiceModel(
      id: json['id'] as int?,
      master: json['master'] as int?,
      price: json['price'] as String,
      serviceModel:
          ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$SaloonMasterServiceModelToJson(
    SaloonMasterServiceModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('master', instance.master);
  val['price'] = instance.price;
  val['is_active'] = instance.isActive;
  val['service'] = instance.serviceModel;
  return val;
}
