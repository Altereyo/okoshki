import 'package:json_annotation/json_annotation.dart';

part 'create_saloon_master_service.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateSaloonMasterServiceBody {
  final int master;
  final int service;
  final String price;
  final int isActive;

  const CreateSaloonMasterServiceBody({
    required this.master,
    required this.service,
    required this.price,
    required this.isActive,
  });

  Map<String, dynamic> toJson () => _$CreateSaloonMasterServiceBodyToJson(this);
}
