// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaloonMasterModel _$SaloonMasterModelFromJson(Map<String, dynamic> json) =>
    SaloonMasterModel(
      id: json['id'] as int,
      salon: json['salon'] as int?,
      firstName: json['first_name'] as String,
      specialization: json['specialization'] as String?,
      avatar: json['avatar'] as String?,
      servicesModel: (json['services'] as List<dynamic>?)
          ?.map((e) =>
              SaloonMasterServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaloonMasterModelToJson(SaloonMasterModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('salon', instance.salon);
  writeNotNull('specialization', instance.specialization);
  writeNotNull('avatar', instance.avatar);
  val['first_name'] = instance.firstName;
  writeNotNull('services', instance.servicesModel);
  return val;
}
