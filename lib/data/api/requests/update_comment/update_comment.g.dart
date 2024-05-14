// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommentBody _$UpdateCommentBodyFromJson(Map<String, dynamic> json) =>
    UpdateCommentBody(
      rating: json['rating'] as int,
      text: json['text'] as String,
    );

Map<String, dynamic> _$UpdateCommentBodyToJson(UpdateCommentBody instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'text': instance.text,
    };
