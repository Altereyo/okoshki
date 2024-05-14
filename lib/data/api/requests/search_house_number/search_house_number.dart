import 'package:json_annotation/json_annotation.dart';

part 'search_house_number.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class SearchHouseNumberBody {
  final String? city;
  final String? street;
  final String? houseNumber;

  const SearchHouseNumberBody({
    this.city,
    this.street,
    this.houseNumber,
  });

  Map<String, dynamic> toJson() => _$SearchHouseNumberBodyToJson(this);
}