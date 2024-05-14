// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppDocumentModel _$AppDocumentModelFromJson(Map<String, dynamic> json) =>
    AppDocumentModel(
      id: json['id'] as int,
      title: json['title'] as String,
      documentFile: json['document_file'] as String,
    );

Map<String, dynamic> _$AppDocumentModelToJson(AppDocumentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'document_file': instance.documentFile,
    };
