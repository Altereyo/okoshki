import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/city.dart';
import 'package:okoshki/domain/entities/user_profile.dart';
import 'package:okoshki/domain/state/customer/customer_store.dart';
import 'package:okoshki/domain/state/customer/saloons_list_store.dart';

part 'selection_city_customer_controller.g.dart';

// ignore: library_private_types_in_public_api
class SelectionCityCustomerController = _SelectionCityCustomerController
    with _$SelectionCityCustomerController;

abstract class _SelectionCityCustomerController with Store {
  _SelectionCityCustomerController({
    required CustomerStore customerStore,
    required SaloonsListCustomerStore saloonsListCustomerStore,
  })  : _customerStore = customerStore,
        _saloonsListCustomerStore = saloonsListCustomerStore;
  final CustomerStore _customerStore;
  final SaloonsListCustomerStore _saloonsListCustomerStore;

  UserProfile get userProfile => _customerStore.userProfile!;

  List<City> get citiesList => _customerStore.citiesList;

  Future<void> updateUserTargetCity(int targetCity) async {
    await _customerStore.updateUserProfile(targetCity: targetCity);
    _saloonsListCustomerStore.getSaloonsList();
  }
}
