import 'package:json_annotation/json_annotation.dart';

part 'update_saloon_profile.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class UpdateSaloonProfileBody {
  final String? title;
  final String? addServices;
  final String? removeServices;
  final String? site;
  final String? description;
  final String? setAddress;

  const UpdateSaloonProfileBody({
    required this.title,
    required this.addServices,
    required this.removeServices,
    required this.site,
    required this.description,
    required this.setAddress,
  });

  Map<String, dynamic> toJson() => _$UpdateSaloonProfileBodyToJson(this);
}