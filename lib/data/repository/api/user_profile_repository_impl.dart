import 'package:okoshki/data/api/requests/change_number_confirm_code/change_number_confirm_code.dart';
import 'package:okoshki/data/api/requests/get_sms_code/get_sms_code.dart';
import 'package:okoshki/data/api/requests/update_user_profile/update_user_profile.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/user_profile/user_profile.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/repository/api/user_profile_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class UserProfileRepositoryImpl extends UserProfileRepository {
  final RestClientApi _restClientApi;

  UserProfileRepositoryImpl({required RestClientApi restClientApi})
      : _restClientApi = restClientApi;

  @override
  Future<ApiResource<UserProfileModel>> getUserProfile() async {
    final apiToBeCalled = _restClientApi.getUserProfile();
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> deleteUserProfile() async {
    final apiToBeCalled = _restClientApi.deleteUserProfile();
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<UserProfileModel>> updateUserProfile({
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? username,
    List<int>? favoriteSalons,
    int? targetCity,
  }) async {
    final body = UpdateUserProfileBody(
      phoneNumber: phoneNumber,
      firstName: firstName,
      lastName: lastName,
      username: username,
      favoriteSalons: favoriteSalons,
      targetCity: targetCity,
    );
    final apiToBeCalled = _restClientApi.updateUserProfile(
      body,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> changeNumberGetSmsCode({
    required String phoneNumber,
  }) async {
    final body = GetSmsCodeBody(
      phoneNumber: phoneNumber,
    );
    final apiToBeCalled = _restClientApi.changeNumberGetSmsCode(
      body,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> changeNumberConfirmCode({
    required String phoneNumber,
    required String code,
  }) async {
    final body = ChangeNumberConfirmCodeBody(
      phoneNumber: phoneNumber,
      smsCode: code,
    );
    final apiToBeCalled = _restClientApi.changeNumberConfirmCode(
      body,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
