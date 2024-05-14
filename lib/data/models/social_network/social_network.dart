import 'package:json_annotation/json_annotation.dart';
import 'package:okoshki/domain/entities/social_network.dart';

part 'social_network.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SocialNetworkModel extends SocialNetwork {
  SocialNetworkModel({
    required super.id,
    required super.salon,
    required super.url,
    required super.title,
    required super.isActive,
  });

  factory SocialNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$SocialNetworkModelFromJson(json);
}
