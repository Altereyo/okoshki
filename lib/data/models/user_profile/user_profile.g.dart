// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      id: json['id'] as int,
      username: json['username'] as String?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      patronymic: json['patronymic'],
      phoneNumber: json['phone_number'] as String?,
      favoriteSalons: (json['favorite_salons'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      targetCity: json['target_city'] as int?,
      detail: json['detail'] as String?,
      salonsOwner: json['salons_owner'] as bool,
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'patronymic': instance.patronymic,
      'favorite_salons': instance.favoriteSalons,
      'target_city': instance.targetCity,
      'detail': instance.detail,
      'salons_owner': instance.salonsOwner,
    };
