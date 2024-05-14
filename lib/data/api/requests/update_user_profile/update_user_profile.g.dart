// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserProfileBody _$UpdateUserProfileBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateUserProfileBody(
      phoneNumber: json['phone_number'] as String?,
      lastName: json['last_name'] as String?,
      firstName: json['first_name'] as String?,
      username: json['username'] as String?,
      favoriteSalons: (json['favorite_salons'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      targetCity: json['target_city'] as int?,
    );

Map<String, dynamic> _$UpdateUserProfileBodyToJson(
    UpdateUserProfileBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('username', instance.username);
  writeNotNull('favorite_salons', instance.favoriteSalons);
  writeNotNull('target_city', instance.targetCity);
  return val;
}
