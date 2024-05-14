import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/comment_moderate.dart';

part 'comment_moderate.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CommentModerateModel extends CommentModerate {
 
  const CommentModerateModel({
    required super.text,
    required super.status,
    required super.updated,
  }) ;

  factory CommentModerateModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModerateModelFromJson(json);
}
