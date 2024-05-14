import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/user_profile.dart';

abstract class UserProfileRepository {
  Future<ApiResource<UserProfile>> getUserProfile();

  Future<ApiResource> deleteUserProfile();

  Future<ApiResource<UserProfile>> updateUserProfile({
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? username,
    List<int>? favoriteSalons,
    int? targetCity,
  });

  Future<ApiResource> changeNumberGetSmsCode({
    required String phoneNumber,
  });

  Future<ApiResource> changeNumberConfirmCode({
    required String phoneNumber,
    required String code,
  });
}
