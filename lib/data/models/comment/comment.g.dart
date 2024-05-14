// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: json['id'] as int,
      clientModel:
          CommentClientModel.fromJson(json['client'] as Map<String, dynamic>),
      saloonModel: SaloonModel.fromJson(json['salon'] as Map<String, dynamic>),
      text: json['text'] as String,
      rating: json['rating'] as int,
      isClientEdited: json['is_client_edited'] as bool,
      created: json['created'] as String,
      updated: json['updated'] as String,
      status: json['status'] as String,
      moderateCommentModel: json['moderate_comment'] == null
          ? null
          : CommentModerateModel.fromJson(
              json['moderate_comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'rating': instance.rating,
      'is_client_edited': instance.isClientEdited,
      'created': instance.created,
      'updated': instance.updated,
      'status': instance.status,
      'moderate_comment': instance.moderateCommentModel,
      'salon': instance.saloonModel,
      'client': instance.clientModel,
    };
