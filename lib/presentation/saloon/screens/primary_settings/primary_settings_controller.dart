import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/city.dart';
import 'package:okoshki/domain/entities/house_number.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/entities/saloon_photo.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/domain/entities/social_network.dart';
import 'package:okoshki/domain/entities/street.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/domain/state/app/addresses_store.dart';
import 'package:okoshki/domain/state/saloon/master_store.dart';
import 'package:okoshki/domain/state/saloon/photo_store.dart';
import 'package:okoshki/domain/state/saloon/shedule_store.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/domain/state/saloon/social_networks_store.dart';

part 'primary_settings_controller.g.dart';

// ignore: library_private_types_in_public_api
class PrimarySettingsSaloonController = _PrimarySettingsSaloonController
    with _$PrimarySettingsSaloonController;

abstract class _PrimarySettingsSaloonController with Store {
  _PrimarySettingsSaloonController({
    required LocalDataRepository localDataRepository,
    required SaloonStore saloonStore,
    required PhotoSaloonStore photoSaloonStore,
    required SheduleSaloonStore sheduleSaloonStore,
    required MasterSaloonStore masterSaloonStore,
    required AddressesAppStore addressesAppStore,
    required SocialNetworksSaloonStore socialNetworksSaloonStore,
  })  : _localDataRepository = localDataRepository,
        _saloonStore = saloonStore,
        _photoSaloonStore = photoSaloonStore,
        _sheduleSaloonStore = sheduleSaloonStore,
        _masterSaloonStore = masterSaloonStore,
        _addressesAppStore = addressesAppStore,
        _socialNetworksSaloonStore = socialNetworksSaloonStore;

  final LocalDataRepository _localDataRepository;
  final SaloonStore _saloonStore;
  final PhotoSaloonStore _photoSaloonStore;
  final SheduleSaloonStore _sheduleSaloonStore;
  final MasterSaloonStore _masterSaloonStore;
  final AddressesAppStore _addressesAppStore;
  final SocialNetworksSaloonStore _socialNetworksSaloonStore;

  //Screen
  //Наличие название и адрес
  @computed
  bool get enabledButtonNextPageTwo =>
      saloonDetail.title!.isNotEmpty && saloonDetail.address != null;
  //Наличие одной услуги
  @computed
  bool get enabledButtonNextPageFour => saloonDetail.services!.isNotEmpty;
  //Наличие одного мастера
  @computed
  bool get enabledButtonNextPageFive => saloonMastersList.isNotEmpty;

  @observable
  int indexPage = 1;

  @action
  void setIndex(int index) => indexPage = index;

  @computed
  bool get isLoading =>
      _saloonStore.isLoading ||
      _photoSaloonStore.isLoading ||
      _sheduleSaloonStore.isLoading ||
      _masterSaloonStore.isLoading ||
      _addressesAppStore.isLoading ||
      _socialNetworksSaloonStore.isLoading;

  //SaloonStore
  SaloonDetail get saloonDetail => _saloonStore.saloonDetail;

  Future<void> updateSaloonDetail({
    String? title,
    String? site,
    String? description,
    List<int>? removeServices,
  }) async {
    await _saloonStore.updateSaloonDetail(
      title: title,
      site: site,
      description: description,
      removeServices: removeServices,
    );
  }

  Future<void> removeServiseType(ServiceType serviseType) async {
    final List<int> removeServices = [];

    for (Service service in saloonDetail.services ?? []) {
      if (service.serviceType.id == serviseType.id) {
        removeServices.add(service.id);
      }
    }
    await updateSaloonDetail(removeServices: removeServices);
  }

  //SaloonPhotoStore
  List<SaloonPhoto> get saloonPhotosList => _photoSaloonStore.saloonPhotosList;

  Future<void> createLogo(File file) async {
    await _photoSaloonStore.createLogo(file);
  }

  Future<void> deleteLogo() async {
    await _photoSaloonStore.deleteLogo();
  }

  Future<void> createPhoto(File file) async {
    await _photoSaloonStore.createPhoto(file);
  }

  Future<void> deletePhoto(SaloonPhoto saloonPhoto) async {
    await _photoSaloonStore.deletePhoto(saloonPhoto);
  }

  //SaloonSheduleStore
  List<SaloonSchedule> get saloonSheduleList =>
      _sheduleSaloonStore.saloonSheduleList;

  //SaloonMasterStore
  ObservableList<SaloonMaster> get saloonMastersList =>
      _masterSaloonStore.saloonMastersList;

  Future<void> deleteMaster(int masterId) async {
    await _masterSaloonStore.deleteMaster(masterId: masterId);
  }

  //addresses store
  List<City> get citiesList => _addressesAppStore.citiesList;

  Future<List<Street>> getStreetsList(
      String cityName, String streetInput) async {
    return await _addressesAppStore.getStreetsList(cityName, streetInput);
  }

  Future<List<HouseNumber>> getHousesList(
      String cityName, String streetTitle, String houseNumber) async {
    return await _addressesAppStore.getHousesList(
        cityName, streetTitle, houseNumber);
  }

  Future<void> createAddress(
      City city, Street street, HouseNumber house) async {
    await _addressesAppStore.createAddress(city, street, house);
  }

  //social_networks_store
  List<SocialNetwork> get socialNetworksList =>
      _socialNetworksSaloonStore.socialNetworksList;

  //local
  Future<void> setIsSaloonSettingsPassed() async {
    await _localDataRepository.setIsSaloonSettingsPassed(true);
  }
}
