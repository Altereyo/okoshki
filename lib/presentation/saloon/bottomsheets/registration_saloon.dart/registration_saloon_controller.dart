import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/domain/state/app/services_store.dart';
import 'package:okoshki/domain/state/saloon/auth_store.dart';
import 'package:validators2/validators2.dart';

part 'registration_saloon_controller.g.dart';

/// [isEnabledButtonRegistration] -> Активная ли кнопка отправить заявку

// ignore: library_private_types_in_public_api
class RegistrationSaloonController = _RegistrationSaloonController
    with _$RegistrationSaloonController;

abstract class _RegistrationSaloonController with Store {
  _RegistrationSaloonController({
    required AuthSaloonStore authSaloonStore,
    required ServicesAppStore servicesAppStore,
  })  : _authSaloonStore = authSaloonStore,
        _servicesAppStore = servicesAppStore;

  final AuthSaloonStore _authSaloonStore;
  final ServicesAppStore _servicesAppStore;

  List<ServiceType> get servicesTypeList => _servicesAppStore.servicesTypeList;

  @computed
  bool get isLoading => _servicesAppStore.isLoading;

  @observable
  String _salonTitle = '';

  @observable
  String _phoneNumber = '';

  @observable
  String _email = '';

  @observable
  ObservableList<int> _servicesIdsList = ObservableList();

  @action
  void setSaloonTitle(String title) => _salonTitle = title;

  @action
  void setPhoneNumber(String phone) => _phoneNumber = phone;

  @action
  void setEmail(String email) => _email = email;

  @action
  void addServices(int serviceId) => _servicesIdsList.add(serviceId);

  @action
  void removeServices(int serviceId) => _servicesIdsList.remove(serviceId);

  @computed
  bool get isEnabledButtonRegistration =>
      isLength(_salonTitle, 2) &&
      _servicesIdsList.isNotEmpty &&
      isLength(_phoneNumber, 11) &&
      isEmail(_email);

  Future<void> registrationSaloon() async {
    await _authSaloonStore.registrationSaloon(
      phoneNumber: _phoneNumber,
      email: _email,
      salonTitle: _salonTitle,
      servicesIds: _servicesIdsList,
    );
  }
}
