import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/saloon_master_service/saloon_master_service.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';

part 'saloon_master.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class SaloonMasterModel extends SaloonMaster {
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'services')
  final List<SaloonMasterServiceModel>? servicesModel;

  const SaloonMasterModel({
    required super.id,
    required super.salon,
    required this.firstName,
    super.specialization,
    super.avatar,
    this.servicesModel,
  }) : super(
          name: firstName,
          services: servicesModel,
        );

  factory SaloonMasterModel.fromJson(Map<String, dynamic> json) =>
      _$SaloonMasterModelFromJson(json);
}
