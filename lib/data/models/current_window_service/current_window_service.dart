import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/current_window_service.dart';

part 'current_window_service.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrentWindowServiceModel extends CurrentWindowService {
  const CurrentWindowServiceModel({
    required super.id,
    required super.service,
    required super.master,
    required super.price,
  });

  factory CurrentWindowServiceModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWindowServiceModelFromJson(json);
}
