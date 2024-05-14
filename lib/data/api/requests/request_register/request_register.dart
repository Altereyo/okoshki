import 'package:json_annotation/json_annotation.dart';

part 'request_register.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class RequestRegisterBody {
  final String phoneNumber;
  final String email;
  final String salonTitle;
  final String services;

  const RequestRegisterBody({
    required this.phoneNumber,
    required this.email,
    required this.salonTitle,
    required this.services,
  });

  Map<String, dynamic> toJson() => _$RequestRegisterBodyToJson(this);
}