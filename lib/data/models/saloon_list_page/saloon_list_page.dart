import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/saloon/saloon.dart';
import 'package:okoshki/domain/entities/saloon_list_page.dart';

part 'saloon_list_page.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SaloonListPageModel extends SaloonListPage {
  @JsonKey(name: 'results')
  final List<SaloonModel> resultsModel;

  SaloonListPageModel({
    required super.isLastPage,
    required super.page,
    required super.numPages,
    required this.resultsModel,
  }) : super(
          results: resultsModel,
        );

  factory SaloonListPageModel.fromJson(Map<String, dynamic> json) =>
      _$SaloonListPageModelFromJson(json);
}
