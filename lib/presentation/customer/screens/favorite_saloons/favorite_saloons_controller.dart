import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/domain/state/customer/favorite_saloons_store.dart';

part 'favorite_saloons_controller.g.dart';

// ignore: library_private_types_in_public_api
class FavoriteSaloonsCustomerController = _FavoriteSaloonsCustomerController
    with _$FavoriteSaloonsCustomerController;

abstract class _FavoriteSaloonsCustomerController with Store {
  _FavoriteSaloonsCustomerController({
    required FavoriteSaloonsCustomerStore favoriteSaloonsCustomerStore,
  }) : _favoriteSaloonsCustomerStore = favoriteSaloonsCustomerStore;

  final FavoriteSaloonsCustomerStore _favoriteSaloonsCustomerStore;

  @computed
  bool get isLoading => _favoriteSaloonsCustomerStore.isLoading;

  List<Saloon> get favoriteSalons =>
      _favoriteSaloonsCustomerStore.favoriteSaloonsList;

  Future<void> updateFavoriteSaloon(int saloonId) async {
    return await _favoriteSaloonsCustomerStore.updateFavoriteSaloon(
      favoriteSalonId: saloonId,
    );
  }
}
