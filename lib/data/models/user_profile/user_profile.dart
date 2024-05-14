import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/user_profile.dart';

part 'user_profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.id,
    required super.username,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.patronymic,
    required super.phoneNumber,
    required super.favoriteSalons,
    required super.targetCity,
    required super.detail,
    required super.salonsOwner,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}
