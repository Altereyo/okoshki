import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/user_profile.dart';
import 'package:okoshki/domain/state/customer/customer_store.dart';

part 'rename_profile_customer_controller.g.dart';

// ignore: library_private_types_in_public_api
class RenameProfileCustomerController = _RenameProfileCustomerController
    with _$RenameProfileCustomerController;

abstract class _RenameProfileCustomerController with Store {
  _RenameProfileCustomerController({required CustomerStore customerStore})
      : _customerStore = customerStore;
  final CustomerStore _customerStore;

  UserProfile get userProfile => _customerStore.userProfile!;

  @observable
  String userName = '';

  @computed
  bool get enabledButtonSaveName => userName.isNotEmpty;

  Future<void> updateUserName() async {
    await _customerStore.updateUserProfile(userName: userName);
  }
}
