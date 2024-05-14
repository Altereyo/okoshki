import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/premium.dart';

part 'premium.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PremiumModel extends Premium {
  PremiumModel({
    required super.id,
    required super.startDate,
    required super.endDate,
  });

  factory PremiumModel.fromJson(Map<String, dynamic> json) =>
      _$PremiumModelFromJson(json);
}
