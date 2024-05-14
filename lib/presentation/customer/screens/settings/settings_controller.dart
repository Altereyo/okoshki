import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/user_profile.dart';
import 'package:okoshki/domain/state/customer/auth_store.dart';
import 'package:okoshki/domain/state/customer/customer_store.dart';

part 'settings_controller.g.dart';

// ignore: library_private_types_in_public_api
class SettingsCustomerController = _SettingsCustomerController
    with _$SettingsCustomerController;

abstract class _SettingsCustomerController with Store {
  _SettingsCustomerController({
    required CustomerStore customerStore,
    required AuthCustomerStore authCustomerStore,
  })  : _customerStore = customerStore,
        _authCustomerStore = authCustomerStore;

  final CustomerStore _customerStore;
  final AuthCustomerStore _authCustomerStore;
  

  @computed
  bool get isLoading => _customerStore.isLoading;

  UserProfile get userProfile => _customerStore.userProfile!;

  String get nameCity => _customerStore.nameCity;

  Future<void> logoutCustomer() async {
   await _authCustomerStore.logout();
  }

  Future<void> deleteCustomer() async {
   await _customerStore.deleteUserProfile();
  }
}
