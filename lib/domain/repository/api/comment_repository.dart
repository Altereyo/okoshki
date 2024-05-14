import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/comment.dart';

abstract class CommentRepository {
  Future<ApiResource<List<Comment>>> getCommentList({
    int? clientId,
    int? saloonId,
  });

  Future<ApiResource<Comment>> createComment({
    required int salonId,
    required int rating,
    required String text,
  });

  Future<ApiResource<Comment>> updateComment({
    required int commentId,
    required String text,
    required int rating,
  });

  Future<ApiResource> deleteComment(
    int commentId,
  );
}
