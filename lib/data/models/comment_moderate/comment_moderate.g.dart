// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_moderate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModerateModel _$CommentModerateModelFromJson(
        Map<String, dynamic> json) =>
    CommentModerateModel(
      text: json['text'] as String,
      status: json['status'] as String,
      updated: json['updated'] as String,
    );

Map<String, dynamic> _$CommentModerateModelToJson(
        CommentModerateModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'status': instance.status,
      'updated': instance.updated,
    };
