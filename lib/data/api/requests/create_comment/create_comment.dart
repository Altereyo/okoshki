import 'package:json_annotation/json_annotation.dart';

part 'create_comment.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateCommentBody {
  final int salon;
  final int rating;
  final String text;

  const CreateCommentBody({
    required this.salon,
    required this.rating,
    required this.text,
  });

  Map<String, dynamic> toJson () => _$CreateCommentBodyToJson(this);
}
