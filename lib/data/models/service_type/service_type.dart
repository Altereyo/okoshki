import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/service_type.dart';

part 'service_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ServiceTypeModel extends ServiceType {
 
  const ServiceTypeModel({
    required super.id,
    required super.title,
  }) ;

  factory ServiceTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeModelFromJson(json);
}
