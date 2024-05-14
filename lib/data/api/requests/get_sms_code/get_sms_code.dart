import 'package:json_annotation/json_annotation.dart';

part 'get_sms_code.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetSmsCodeBody {
  final String phoneNumber;

  const GetSmsCodeBody({
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$GetSmsCodeBodyToJson(this);
}