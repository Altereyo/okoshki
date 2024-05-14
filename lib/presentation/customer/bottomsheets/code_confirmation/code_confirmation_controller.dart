import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/domain/state/customer/auth_store.dart';
import 'package:validators2/validators2.dart';

part 'code_confirmation_controller.g.dart';

// ignore: library_private_types_in_public_api
class CodeConfirmationController = _CodeConfirmationController
    with _$CodeConfirmationController;

abstract class _CodeConfirmationController with Store {
  _CodeConfirmationController({
    required LocalDataRepository localDataRepository,
    required AuthCustomerStore authCustomerStore,
    required this.phoneNumber,
  })  : _localDataRepository = localDataRepository,
        _authCustomerStore = authCustomerStore;

  final LocalDataRepository _localDataRepository;
  final AuthCustomerStore _authCustomerStore;
  final String phoneNumber;

  @observable
  String smsCode = '0000';

  @computed
  String get errorAuthorize => _authCustomerStore.errorAuthorize;

  set errorAuthorize(String val) => _authCustomerStore.errorAuthorize = val;

  @computed
  bool get isEnabledButtonConfirm => isLength(smsCode, 4);

  bool get isIntroShown => _localDataRepository.getIsIntroShown();

  Future<void> authorize() async {
    await _authCustomerStore.authorize(
        phoneNumber: phoneNumber, smsCode: smsCode);
  }
}
