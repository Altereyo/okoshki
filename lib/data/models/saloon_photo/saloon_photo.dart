import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/saloon_photo.dart';

part 'saloon_photo.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SaloonPhotoModel extends SaloonPhoto {
  const SaloonPhotoModel({
    required super.id,
    required super.salon,
    required super.image,
  });

  factory SaloonPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$SaloonPhotoModelFromJson(json);
}
