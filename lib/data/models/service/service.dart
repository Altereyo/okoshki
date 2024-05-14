import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/service_type/service_type.dart';
import 'package:okoshki/domain/entities/service.dart';

part 'service.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ServiceModel extends Service {
  @JsonKey(name: 'service_type')
  final ServiceTypeModel serviceTypeModel;

  const ServiceModel({
    required super.id,
    required super.title,
    required this.serviceTypeModel,
  }) : super(
          serviceType: serviceTypeModel,
        );

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
}
