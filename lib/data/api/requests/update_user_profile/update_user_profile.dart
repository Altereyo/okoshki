import 'package:json_annotation/json_annotation.dart';

part 'update_user_profile.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class UpdateUserProfileBody {
  final String? phoneNumber;
  final String? firstName;
  final String? lastName;
  final String? username;
  final List<int>? favoriteSalons;
  final int? targetCity;

  const UpdateUserProfileBody({
    required this.phoneNumber,
    required this.lastName,
    required this.firstName,
    required this.username,
    required this.favoriteSalons,
    required this.targetCity,
  });

  Map<String, dynamic> toJson() => _$UpdateUserProfileBodyToJson(this);
}