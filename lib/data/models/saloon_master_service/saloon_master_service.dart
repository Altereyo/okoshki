import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/service/service.dart';
import 'package:okoshki/domain/entities/saloon_master_service.dart';

part 'saloon_master_service.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class SaloonMasterServiceModel extends SaloonMasterService {
  @JsonKey(name: 'service')
  final ServiceModel serviceModel;

  SaloonMasterServiceModel({
    required super.id,
    required super.master,
    required super.price,
    required this.serviceModel,
    required super.isActive,
  }) : super(
          service: serviceModel,
        );

  factory SaloonMasterServiceModel.fromJson(Map<String, dynamic> json) =>
      _$SaloonMasterServiceModelFromJson(json);
}
