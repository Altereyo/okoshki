import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/help_tip.dart';

part 'help_tip.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HelpTipModel extends HelpTip {
  const HelpTipModel({
    required super.id,
    required super.question,
    required super.answer,
    required super.order,
  });

  factory HelpTipModel.fromJson(Map<String, dynamic> json) =>
      _$HelpTipModelFromJson(json);
}
