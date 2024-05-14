import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/data/models/city/city.dart';
import 'package:okoshki/domain/entities/address.dart';

part 'address.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AddressModel extends Address {
  @JsonKey(name: 'city')
  final CityModel cityModel;

  const AddressModel({
    required super.id,
    required this.cityModel,
    required super.street,
    required super.houseNumber,
    required super.lat,
    required super.lon,
  }) : super(
          city: cityModel,
        );

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
