import 'package:okoshki/domain/entities/comment_client.dart';
import 'package:okoshki/domain/entities/comment_moderate.dart';
import 'package:okoshki/domain/entities/saloon.dart';

class Comment {
  final int id;
  final CommentClient client;
  final Saloon salon;
  final String text;
  final int rating;
  final bool isClientEdited;
  final String created;
  final String updated;
  final String status;
  final CommentModerate? moderateComment;

  const Comment({
    required this.id,
    required this.client,
    required this.salon,
    required this.text,
    required this.rating,
    required this.isClientEdited,
    required this.created,
    required this.updated,
    required this.status,
    required this.moderateComment,
  });

  @override
  String toString() {
    return 'Comment{id: $id, client: $client, salon: $salon, text: $text, rating: $rating, status: $status, moderateComment: ${moderateComment?.status} - ${moderateComment?.text}}';
  }
}