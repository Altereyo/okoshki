// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_tip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelpTipModel _$HelpTipModelFromJson(Map<String, dynamic> json) => HelpTipModel(
      id: json['id'] as int,
      question: json['question'] as String,
      answer: json['answer'] as String,
      order: json['order'] as int,
    );

Map<String, dynamic> _$HelpTipModelToJson(HelpTipModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'order': instance.order,
    };
