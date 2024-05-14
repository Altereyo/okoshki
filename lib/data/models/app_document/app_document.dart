import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/app_document.dart';

part 'app_document.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AppDocumentModel extends AppDocument {
  
  const AppDocumentModel({
    required super.id,
    required super.title,
    required super.documentFile,
  });

  factory AppDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$AppDocumentModelFromJson(json);
}
