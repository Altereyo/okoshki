import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/state/saloon/auth_store.dart';
import 'package:validators2/validators2.dart';

part 'password_recovery_controller.g.dart';

// ignore: library_private_types_in_public_api
class PasswordRecoveryController = _PasswordRecoveryController
    with _$PasswordRecoveryController;

abstract class _PasswordRecoveryController with Store {
  _PasswordRecoveryController({
    required AuthSaloonStore authSaloonStore,
  }) : _authSaloonStore = authSaloonStore;

  final AuthSaloonStore _authSaloonStore;

  @observable
  String emailRecovery = '';

  @observable
  String? errorEmailRecovery;

  @computed
  bool get isEnabledButtonRecovery => isEmail(emailRecovery);

  Future<void> passwordRecovery() async {
    await _authSaloonStore.passwordRecovery(emailRecovery: emailRecovery);
  }
}
