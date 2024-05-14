// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaloonDocumentModel _$SaloonDocumentModelFromJson(Map<String, dynamic> json) =>
    SaloonDocumentModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      documentFile: json['document_file'] as String,
    );

Map<String, dynamic> _$SaloonDocumentModelToJson(
        SaloonDocumentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'document_file': instance.documentFile,
    };
