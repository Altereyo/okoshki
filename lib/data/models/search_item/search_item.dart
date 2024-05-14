import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/search_item.dart';

part 'search_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchItemModel extends SearchItem {
  const SearchItemModel({
    required super.search,
    required super.type,
    required super.city,
  });

  factory SearchItemModel.fromJson(Map<String, dynamic> json) =>
      _$SearchItemModelFromJson(json);
}
