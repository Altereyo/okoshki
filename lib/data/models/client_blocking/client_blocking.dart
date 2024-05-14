import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/client_blocking.dart';

part 'client_blocking.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ClientBlockingModel extends ClientBlocking {
  const ClientBlockingModel({
    required super.blockingTo,
    required super.created,
    required super.isActive,
  });

  factory ClientBlockingModel.fromJson(Map<String, dynamic> json) =>
      _$ClientBlockingModelFromJson(json);
}
