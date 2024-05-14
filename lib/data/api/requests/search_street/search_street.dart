import 'package:json_annotation/json_annotation.dart';

part 'search_street.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class SearchStreetBody {
  final String? city;
  final String? street;

  const SearchStreetBody({
    this.city,
    this.street,
  });

  Map<String, dynamic> toJson() => _$SearchStreetBodyToJson(this);
}