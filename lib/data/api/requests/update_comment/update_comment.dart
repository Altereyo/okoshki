import 'package:json_annotation/json_annotation.dart';

part 'update_comment.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UpdateCommentBody {
  final int rating;
  final String text;

  const UpdateCommentBody({
    required this.rating,
    required this.text,
  });

  Map<String, dynamic> toJson () => _$UpdateCommentBodyToJson(this);
}
