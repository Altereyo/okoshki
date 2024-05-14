// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaloonPhotoModel _$SaloonPhotoModelFromJson(Map<String, dynamic> json) =>
    SaloonPhotoModel(
      id: json['id'] as int,
      salon: json['salon'] as int,
      image: json['image'] as String,
    );

Map<String, dynamic> _$SaloonPhotoModelToJson(SaloonPhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salon': instance.salon,
      'image': instance.image,
    };
