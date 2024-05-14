import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/repository/api/auth_repository.dart';
import 'package:okoshki/internal/functions/reset_dependencies.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthSaloonStore = _AuthSaloonStore with _$AuthSaloonStore;

abstract class _AuthSaloonStore with Store {
  _AuthSaloonStore({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @observable
  String errorAuthorize = '';

  @action
  Future<void> authorize({
    required String email,
    required String password,
  }) async {
    final res = await _authRepository.authorizeSaloon(
      email: email,
      password: password,
    );

    if (!res.success) {
      errorAuthorize = res.message!;
    }
  }

  Future<void> passwordRecovery({required String emailRecovery}) async {
    final res = await _authRepository.changePassword(email: emailRecovery);

    if (res.success) {}
  }

  Future<void> registrationSaloon(
      {required String phoneNumber,
      required String email,
      required String salonTitle,
      required List<int> servicesIds}) async {
    final res = await _authRepository.requestRegisterSaloon(
      phoneNumber: phoneNumber,
      email: email,
      salonTitle: salonTitle,
      servicesIds: servicesIds,
    );

    if (res.success) {}
  }

  Future<void> logoutSaloon() async {
    final res = await _authRepository.logout();

    if (res.success) {
      await resetLazyDependencies();
    }
  }
}
