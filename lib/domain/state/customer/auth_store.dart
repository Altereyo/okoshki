import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/repository/api/auth_repository.dart';
import 'package:okoshki/internal/functions/reset_dependencies.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthCustomerStore = _AuthCustomerStore with _$AuthCustomerStore;

abstract class _AuthCustomerStore with Store {
  _AuthCustomerStore({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @observable
  String errorAuthorize = '';

  Future<void> sendSms({required String phoneNumber}) async {
    final res = await _authRepository.getSmsCode(
      phoneNumber: phoneNumber,
    );
    if (res.success) {}
  }

  @action
  Future<void> authorize({
    required String phoneNumber,
    required String smsCode,
  }) async {
    final res = await _authRepository.authorizeCustomer(
      phoneNumber: phoneNumber,
      code: smsCode,
    );

    if (!res.success) {
      errorAuthorize = res.message!;
    }
  }

  Future<void> logout() async {
    final res = await _authRepository.logout();

    if (res.success) {
      await resetLazyDependencies();
    }
  }
}
