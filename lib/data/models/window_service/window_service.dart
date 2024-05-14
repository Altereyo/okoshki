import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/saloon_master/saloon_master.dart';
import 'package:okoshki/data/models/service/service.dart';
import 'package:okoshki/domain/entities/window_service.dart';

part 'window_service.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WindowServiceModel extends WindowService {
  @JsonKey(name: 'service')
  final ServiceModel serviceModel;
  @JsonKey(name: 'master')
  final SaloonMasterModel masterModel;

  const WindowServiceModel({
    required super.id,
    required this.serviceModel,
    required this.masterModel,
    required super.price,
  }) : super(
          service: serviceModel,
          master: masterModel,
        );

  factory WindowServiceModel.fromJson(Map<String, dynamic> json) =>
      _$WindowServiceModelFromJson(json);
}
