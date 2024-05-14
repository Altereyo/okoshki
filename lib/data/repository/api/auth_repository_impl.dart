import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/api/requests/change_password/change_password.dart';
import 'package:okoshki/domain/repository/api/auth_repository.dart';
import 'package:okoshki/data/api/requests/get_sms_code/get_sms_code.dart';
import 'package:okoshki/data/api/requests/get_token/get_token.dart';
import 'package:okoshki/data/api/requests/request_register/request_register.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/internal/functions/get_auth_data.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RestClientApi _restClientApi;

  AuthRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource> checkToken(
    String token,
  ) async {
    final apiToBeCalled = _restClientApi.checkToken(
      token,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> getSmsCode({
    required String phoneNumber,
  }) async {
    final body = GetSmsCodeBody(
      phoneNumber: phoneNumber,
    );
    final apiToBeCalled = _restClientApi.getSmsCode(
      body,
    );
    // we can return phoneNumber and sms_code here, but for what?
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> authorizeCustomer({
    required String? phoneNumber,
    required String? code,
  }) async {
    final authData = await getAuthData();
    final body = GetTokenBody(
      phoneNumber: phoneNumber,
      smsCode: code,
      registrationId: authData.firebaseToken,
      deviceId: authData.deviceId,
      deviceType: authData.deviceType,
    );
    final apiToBeCalled = _restClientApi.confirmCode(
      body,
    );
    // presentation layer shouldn't know about token, so sending empty successful response
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> authorizeSaloon({
    required String? email,
    required String? password,
  }) async {
    final authData = await getAuthData();
    final body = GetTokenBody(
      email: email,
      password: password,
      registrationId: authData.firebaseToken,
      deviceId: authData.deviceId,
      deviceType: authData.deviceType,
    );
    final apiToBeCalled = _restClientApi.confirmCode(body);
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> requestRegisterSaloon({
    required String phoneNumber,
    required String email,
    required String salonTitle,
    required List<int> servicesIds,
  }) async {
    final body = RequestRegisterBody(
      phoneNumber: phoneNumber,
      email: email,
      salonTitle: salonTitle,
      services: servicesIds.join(','),
    );
    final apiToBeCalled = _restClientApi.requestRegisterSaloon(body);
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> changePassword({
    required String email,
  }) async {
    final body = ChangePasswordBody(
      email: email,
    );
    final apiToBeCalled = _restClientApi.changePassword(body);
    // we'll receive our mail, we don't need it
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource> logout() async {
    final apiToBeCalled = _restClientApi.logout();
    // we don't need it, really
    return await safeApiCall(apiToBeCalled);
  }
}
