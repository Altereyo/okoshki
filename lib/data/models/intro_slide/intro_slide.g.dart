// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_slide.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntroSlideModel _$IntroSlideModelFromJson(Map<String, dynamic> json) =>
    IntroSlideModel(
      id: json['id'] as int,
      title: json['title'] as String,
      text: json['text'] as String,
      slide: json['slide'] as String,
      order: json['order'] as int,
    );

Map<String, dynamic> _$IntroSlideModelToJson(IntroSlideModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'slide': instance.slide,
      'order': instance.order,
    };
