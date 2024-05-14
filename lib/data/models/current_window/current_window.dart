import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/current_window_service/current_window_service.dart';
import 'package:okoshki/domain/entities/current_window.dart';

part 'current_window.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrentWindowModel extends CurrentWindow {
  @JsonKey(name: 'services')
  final List<CurrentWindowServiceModel> servicesModel;

  const CurrentWindowModel({
    required super.id,
    required super.startDt,
    required super.endDt,
    required this.servicesModel,
  }) : super(
          services: servicesModel,
        );

  factory CurrentWindowModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWindowModelFromJson(json);
}
