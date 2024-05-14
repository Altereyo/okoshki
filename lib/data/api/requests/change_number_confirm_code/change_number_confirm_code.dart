import 'package:json_annotation/json_annotation.dart';

part 'change_number_confirm_code.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ChangeNumberConfirmCodeBody {
  final String? phoneNumber;
  final String? smsCode;

  const ChangeNumberConfirmCodeBody({
    this.phoneNumber,
    this.smsCode,
  });

  Map<String, dynamic> toJson() => _$ChangeNumberConfirmCodeBodyToJson(this);
}