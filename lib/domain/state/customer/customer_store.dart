import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/city.dart';
import 'package:okoshki/domain/entities/user_profile.dart';
import 'package:okoshki/domain/repository/api/address_repository.dart';
import 'package:okoshki/domain/repository/api/user_profile_repository.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';

part 'customer_store.g.dart';

// ignore: library_private_types_in_public_api
class CustomerStore = _CustomerStore with _$CustomerStore;

abstract class _CustomerStore with Store {
  _CustomerStore({
    required UserProfileRepository userProfileRepository,
    required AddressRepository addressRepository,
    required LocalDataRepository localDataRepository,
  })  : _userProfileRepository = userProfileRepository,
        _addressRepository = addressRepository,
        _localDataRepository = localDataRepository;

  final UserProfileRepository _userProfileRepository;
  final AddressRepository _addressRepository;
  final LocalDataRepository _localDataRepository;

  Future<void> init() async {
    if (_localDataRepository.getToken() != null) {
      await _getUserProfile();
      await _updateTargetCity();
      await _getCitiesList();
    }
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  //user profile
  @observable
  UserProfile? userProfile;

  Future<void> _getUserProfile() async {
    final res = await _userProfileRepository.getUserProfile();

    if (res.success) {
      userProfile = res.data;
    }
  }

  @action
  Future<void> updateUserProfile({
    String? userName,
    int? targetCity,
  }) async {
    final res = await _userProfileRepository.updateUserProfile(
      username: userName,
      targetCity: targetCity,
    );

    if (res.success) {
      userProfile = res.data!;
    }
  }

  Future<void> deleteUserProfile() async {
    final res = await _userProfileRepository.deleteUserProfile();

    if (res.success) {}
  }

  //city

  @observable
  List<City> citiesList = [];

  @computed
  String get nameCity {
    final idTargetCity = userProfile!.targetCity;
    for (var city in citiesList) {
      if (city.id == idTargetCity) {
        return city.title;
      }
    }
    return 'null';
  }

  Future<void> _getCitiesList() async {
    final res = await _addressRepository.getCities();

    if (res.success) {
      citiesList = res.data!;
    }
  }

  Future<void> _updateTargetCity() async {
    final resUser = await _userProfileRepository.getUserProfile();

    if (resUser.data!.targetCity == null) {
      //Список доступных городов
      final listCity = await _addressRepository.getCities();
      if (listCity.success) {
        //Ближайщий город
        final nearestCity =
            await _addressRepository.getNearestCity(listCity.data!);
        //Обновление города
        await updateUserProfile(targetCity: nearestCity.id);
        // final resUserProfile = await _userProfileRepository.updateUserProfile(
        //   targetCity: nearestCity.id,
        // );
      }
    }
  }
}
