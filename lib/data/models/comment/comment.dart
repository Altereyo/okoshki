import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/comment_client/comment_client.dart';
import 'package:okoshki/data/models/comment_moderate/comment_moderate.dart';
import 'package:okoshki/data/models/saloon/saloon.dart';
import 'package:okoshki/domain/entities/comment.dart';

part 'comment.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CommentModel extends Comment {
  @JsonKey(name: 'moderate_comment')
  final CommentModerateModel? moderateCommentModel;

  @JsonKey(name: 'salon')
  final SaloonModel saloonModel;

  @JsonKey(name: 'client')
  final CommentClientModel clientModel;

  const CommentModel({
    required super.id,
    required this.clientModel,
    required this.saloonModel,
    required super.text,
    required super.rating,
    required super.isClientEdited,
    required super.created,
    required super.updated,
    required super.status,
    required this.moderateCommentModel,
  }) : super(
          moderateComment: moderateCommentModel,
          salon: saloonModel,
          client: clientModel,
        );

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
