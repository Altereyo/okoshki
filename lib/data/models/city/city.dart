import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/city.dart';

part 'city.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CityModel extends City {
  const CityModel({
    required super.id,
    required super.title,
    required super.centerLat,
    required super.centerLon,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
