import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/app_setting.dart';

part 'app_setting.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AppSettingModel extends AppSetting {
  AppSettingModel({
    required super.telegramId,
    required super.phoneNumber,
  });

  factory AppSettingModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingModelFromJson(json);
}
