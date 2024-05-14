import 'package:json_annotation/json_annotation.dart';

part 'get_addresses.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GetAddressesBody {
  final String? polygon;
  final int? city;

  const GetAddressesBody({
    this.polygon,
    this.city,
  });

  Map<String, dynamic> toJson() => _$GetAddressesBodyToJson(this);
}