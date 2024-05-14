// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon_list_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaloonListPageModel _$SaloonListPageModelFromJson(Map<String, dynamic> json) =>
    SaloonListPageModel(
      isLastPage: json['is_last_page'] as bool,
      page: json['page'] as int,
      numPages: json['num_pages'] as int,
      resultsModel: (json['results'] as List<dynamic>)
          .map((e) => SaloonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaloonListPageModelToJson(
        SaloonListPageModel instance) =>
    <String, dynamic>{
      'is_last_page': instance.isLastPage,
      'page': instance.page,
      'num_pages': instance.numPages,
      'results': instance.resultsModel,
    };
