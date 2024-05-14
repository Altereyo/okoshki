import 'package:okoshki/data/api/requests/update_social_network/update_social_network.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/social_network.dart';
import 'package:okoshki/domain/repository/api/social_networks_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class SocialNetworkRepositoryImpl extends SocialNetworkRepository {
  final RestClientApi _restClientApi;

  SocialNetworkRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<SocialNetwork>>> getSocialNetworkList(
    int salonId,
  ) async {
    final apiToBeCalled = _restClientApi.getSocialNetworkList(
      salonId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SocialNetwork>> updateSocialNetwork({
    required int socialId,
    String? url,
    bool? isActive,
  }) async {
    final body = UpdateSocialNetworkBody(
      url: url,
      isActive: (isActive ?? false) ? 1 : 0,
    );
    final apiToBeCalled = _restClientApi.updateSocialNetwork(
      socialId: socialId,
      body: body,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
