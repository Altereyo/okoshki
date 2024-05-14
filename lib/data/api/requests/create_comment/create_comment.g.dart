// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCommentBody _$CreateCommentBodyFromJson(Map<String, dynamic> json) =>
    CreateCommentBody(
      salon: json['salon'] as int,
      rating: json['rating'] as int,
      text: json['text'] as String,
    );

Map<String, dynamic> _$CreateCommentBodyToJson(CreateCommentBody instance) =>
    <String, dynamic>{
      'salon': instance.salon,
      'rating': instance.rating,
      'text': instance.text,
    };
