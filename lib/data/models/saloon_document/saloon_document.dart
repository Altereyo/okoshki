import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/saloon_document.dart';

part 'saloon_document.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SaloonDocumentModel extends SaloonDocument {
  const SaloonDocumentModel({
    required super.id,
    required super.title,
    super.description,
    required super.documentFile,
  });
  factory SaloonDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$SaloonDocumentModelFromJson(json);
}
