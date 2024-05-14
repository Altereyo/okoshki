import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/house_number.dart';

part 'house_number.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HouseNumberModel extends HouseNumber {
  const HouseNumberModel({
    required super.houseNumber,
    required super.lat,
    required super.lon,
  });

  factory HouseNumberModel.fromJson(Map<String, dynamic> json) =>
      _$HouseNumberModelFromJson(json);
}
