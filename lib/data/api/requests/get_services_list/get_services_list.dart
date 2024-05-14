import 'package:json_annotation/json_annotation.dart';

part 'get_services_list.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetServicesListBody {
  final int? type;
  final int? salon;
  final int? master;
  final String? exclude;

  const GetServicesListBody({
    this.type,
    this.salon,
    this.master,
    this.exclude,
  });

  Map<String, dynamic> toJson() => _$GetServicesListBodyToJson(this);
}