import 'package:okoshki/data/api/requests/create_comment/create_comment.dart';
import 'package:okoshki/data/api/requests/update_comment/update_comment.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/comment/comment.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/repository/api/comment_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class CommentRepositoryImpl extends CommentRepository {
  final RestClientApi _restClientApi;

  CommentRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<CommentModel>>> getCommentList({
    int? clientId,
    int? saloonId,
  }) async {
    final apiToBeCalled = _restClientApi.getCommentList(
      clientId: clientId,
      salonId: saloonId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<CommentModel>> createComment({
    required int salonId,
    required int rating,
    required String text,
  }) async {
    final body = CreateCommentBody(
      salon: salonId,
      rating: rating,
      text: text,
    );
    final apiToBeCalled = _restClientApi.createComment(body);
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<CommentModel>> updateComment({
    required int commentId,
    required String text,
    required int rating,
  }) async {
    final body = UpdateCommentBody(
      rating: rating,
      text: text,
    );
    final apiToBeCalled = _restClientApi.updateComment(
      commentId: commentId,
      body: body,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> deleteComment(
    int commentId,
  ) async {
    final apiToBeCalled = _restClientApi.deleteComment(commentId);
    return await safeApiCall(apiToBeCalled);
  }
}
