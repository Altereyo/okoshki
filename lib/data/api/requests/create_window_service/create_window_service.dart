import 'package:json_annotation/json_annotation.dart';

part 'create_window_service.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateWindowServiceBody {
  final int? id;
  final int sId;
  final int mId;
  final double price;

  CreateWindowServiceBody({
     this.id,
    required this.sId,
    required this.mId,
    required this.price,
  });

  Map<String, dynamic> toJson () => _$CreateWindowServiceBodyToJson(this);

}
