import 'package:json_annotation/json_annotation.dart';

part 'change_password.g.dart';

@JsonSerializable()
class ChangePasswordBody {
  final String email;

  ChangePasswordBody({required this.email});

  Map<String, dynamic> toJson() => _$ChangePasswordBodyToJson(this);
}