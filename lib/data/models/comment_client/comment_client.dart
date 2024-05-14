import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/comment_client.dart';

part 'comment_client.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CommentClientModel extends CommentClient {
  const CommentClientModel({
    required super.id,
    required super.username,
  });

  factory CommentClientModel.fromJson(Map<String, dynamic> json) =>
      _$CommentClientModelFromJson(json);
}
