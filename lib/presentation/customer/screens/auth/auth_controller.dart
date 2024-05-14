import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/domain/state/customer/auth_store.dart';

part 'auth_controller.g.dart';

// ignore: library_private_types_in_public_api
class AuthCustomerController = _AuthCustomerController
    with _$AuthCustomerController;

abstract class _AuthCustomerController with Store {
  _AuthCustomerController({
    required LocalDataRepository localDataRepository,
    required AuthCustomerStore authCustomerStore,
  })  : _localDataRepository = localDataRepository,
        _authCustomerStore = authCustomerStore;

  final LocalDataRepository _localDataRepository;
  final AuthCustomerStore _authCustomerStore;

  @observable
  String phoneNumber = '89819810000';

  @computed
  bool get isEnabledButtonGetCode => phoneNumber.length == 11;

  Future<void> sendSms() async {
    await _authCustomerStore.sendSms(phoneNumber: phoneNumber);
  }

  bool get isIntroShown {
    _localDataRepository.setIsSaloon(false);
    return _localDataRepository.getIsIntroShown();
  }
}
