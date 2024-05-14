import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/street.dart';

part 'street.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StreetModel extends Street {
  const StreetModel({
    required super.title,
  });

  factory StreetModel.fromJson(Map<String, dynamic> json) =>
      _$StreetModelFromJson(json);
}
