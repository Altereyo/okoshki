import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/domain/state/saloon/auth_store.dart';
import 'package:validators2/validators2.dart';

part 'auth_controller.g.dart';

// ignore: library_private_types_in_public_api
class AuthSaloonController = _AuthSaloonController with _$AuthSaloonController;

abstract class _AuthSaloonController with Store {
  _AuthSaloonController({
    required LocalDataRepository localDataRepository,
    required AuthSaloonStore authSaloonStore,
  })  : _localDataRepository = localDataRepository,
        _authSaloonStore = authSaloonStore;

  final LocalDataRepository _localDataRepository;
  final AuthSaloonStore _authSaloonStore;

  @observable
  String email = 'saloonRF@mail.ru';

  @observable
  String password = '1234554321';

  @computed
  String get errorAuthorize => _authSaloonStore.errorAuthorize;

  set errorAuthorize(String val) => _authSaloonStore.errorAuthorize = val;

  @observable
  bool isHidenPasswordView = true;

  @computed
  bool get isEnabledButtonToComeIn => isEmail(email) && isLength(password, 6);

  Future<void> authorize() async {
    await _authSaloonStore.authorize(email: email, password: password);
  }

  bool get isIntroShown => _localDataRepository.getIsIntroShown();

  bool get isSaloonSettingsPassed =>
      _localDataRepository.getIsSaloonSettingsPassed();

  Future<void> setIsSaloon() async {
    await _localDataRepository.setIsSaloon(true);
  }
}
