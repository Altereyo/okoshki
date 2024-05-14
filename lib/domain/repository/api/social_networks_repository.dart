import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/social_network.dart';

abstract class SocialNetworkRepository {
  Future<ApiResource<List<SocialNetwork>>> getSocialNetworkList(
    int salonId,
  );

  Future<ApiResource<SocialNetwork>> updateSocialNetwork({
    required int socialId,
    String? url,
    bool? isActive,
  });
}
