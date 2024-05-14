import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/domain/repository/api/saloon_repository.dart';
import 'package:okoshki/domain/repository/api/user_profile_repository.dart';

part 'favorite_saloons_store.g.dart';

// ignore: library_private_types_in_public_api
class FavoriteSaloonsCustomerStore = _FavoriteSaloonsCustomerStore
    with _$FavoriteSaloonsCustomerStore;

abstract class _FavoriteSaloonsCustomerStore with Store {
  _FavoriteSaloonsCustomerStore({
    required UserProfileRepository userProfileRepository,
    required SaloonRepository saloonRepository,
  })  : _userProfileRepository = userProfileRepository,
        _saloonRepository = saloonRepository;

  final UserProfileRepository _userProfileRepository;
  final SaloonRepository _saloonRepository;

  Future<void> init() async {
    await _getFavoriteSaloonsList();

    isLoading = false;
  }

  @observable
  bool isLoading = true;

  @observable
  ObservableList<Saloon> favoriteSaloonsList = ObservableList();

  @computed
  String get counterFavoriteSaloons => favoriteSaloonsList.length.toString();

  @action
  Future<void> _getFavoriteSaloonsList() async {
    final res = await _saloonRepository.getFavoriteSaloons();
    
    if (res.success) {
      favoriteSaloonsList = ObservableList.of(res.data!);
    }
  }

  @action
  Future<void> updateFavoriteSaloon({
    int? favoriteSalonId,
  }) async {
    final res = await _userProfileRepository.updateUserProfile(
      favoriteSalons: favoriteSalonId == null ? null : [favoriteSalonId],
    );

    if (res.success) {
      _getFavoriteSaloonsList();
    }
   
  }
}
