import 'package:json_annotation/json_annotation.dart';

part 'get_token.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetTokenBody {
  final String registrationId;
  final String deviceId;
  final String deviceType;
  final String? phoneNumber;
  final String? smsCode;
  final String? email;
  final String? password;

  const GetTokenBody({
    required this.registrationId,
    required this.deviceId,
    required this.deviceType,
    this.phoneNumber,
    this.smsCode,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => _$GetTokenBodyToJson(this);
}