import 'package:okoshki/domain/entities/api_response.dart';

abstract class AuthRepository {
  Future<ApiResource> checkToken(
    String token,
  );

  Future<ApiResource> getSmsCode({
    required String phoneNumber,
  });

  Future<ApiResource> authorizeCustomer({
    required String phoneNumber,
    required String code,
  });

  Future<ApiResource> authorizeSaloon({
    required String email,
    required String password,
  });

  Future<ApiResource> requestRegisterSaloon({
    required String phoneNumber,
    required String email,
    required String salonTitle,
    required List<int> servicesIds,
  });

  Future<ApiResource> changePassword({
    required String email,
  });

  Future<ApiResource> logout();
}
