import 'package:json_annotation/json_annotation.dart';

part 'create_address.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateAddressBody {
  final int city;
  final String street;
  final String houseNumber;
  final double lat;
  final double lon;

  const CreateAddressBody({
    required this.city,
    required this.street,
    required this.houseNumber,
    required this.lat,
    required this.lon,
  });

  Map<String, dynamic> toJson () => _$CreateAddressBodyToJson(this);
}
