import 'package:json_annotation/json_annotation.dart';

part 'update_social_network.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class UpdateSocialNetworkBody {
  final String? url;
  final int? isActive;

  const UpdateSocialNetworkBody({
    required this.url,
    required this.isActive,
  });

  Map<String, dynamic> toJson () => _$UpdateSocialNetworkBodyToJson(this);
}
