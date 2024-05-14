import 'package:json_annotation/json_annotation.dart';

part 'update_saloon_master_service.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UpdateSaloonMasterServiceBody {
  final String? price;
  final int? isActive;

  const UpdateSaloonMasterServiceBody({
    required this.price,
    required this.isActive,
  });

  Map<String, dynamic> toJson () => _$UpdateSaloonMasterServiceBodyToJson(this);
}
