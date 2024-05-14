import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/city.dart';
import 'package:okoshki/domain/entities/house_number.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';
import 'package:okoshki/domain/entities/saloon_photo.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';
import 'package:okoshki/domain/entities/social_network.dart';
import 'package:okoshki/domain/entities/street.dart';
import 'package:okoshki/domain/state/app/addresses_store.dart';
import 'package:okoshki/domain/state/saloon/photo_store.dart';
import 'package:okoshki/domain/state/saloon/shedule_store.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/domain/state/saloon/social_networks_store.dart';

part 'basic_data_controller.g.dart';

// ignore: library_private_types_in_public_api
class BasicDataSaloonController = _BasicDataSaloonController
    with _$BasicDataSaloonController;

abstract class _BasicDataSaloonController with Store {
  _BasicDataSaloonController({
    required SaloonStore saloonStore,
    required PhotoSaloonStore photoSaloonStore,
    required SheduleSaloonStore sheduleSaloonStore,
    required AddressesAppStore addressesAppStore,
    required SocialNetworksSaloonStore socialNetworksSaloonStore,
  })  : _saloonStore = saloonStore,
        _photoSaloonStore = photoSaloonStore,
        _sheduleSaloonStore = sheduleSaloonStore,
        _addressesAppStore = addressesAppStore,
        _socialNetworksSaloonStore = socialNetworksSaloonStore;

  final SaloonStore _saloonStore;
  final PhotoSaloonStore _photoSaloonStore;
  final SheduleSaloonStore _sheduleSaloonStore;
  final AddressesAppStore _addressesAppStore;
  final SocialNetworksSaloonStore _socialNetworksSaloonStore;

  @computed
  bool get isLoading =>
      _saloonStore.isLoading ||
      _photoSaloonStore.isLoading ||
      _sheduleSaloonStore.isLoading ||
      _addressesAppStore.isLoading || 
      _socialNetworksSaloonStore.isLoading;

  SaloonDetail get saloonDetail => _saloonStore.saloonDetail;

  List<SaloonSchedule> get saloonSheduleList =>
      _sheduleSaloonStore.saloonSheduleList;

  List<SaloonPhoto> get saloonPhotosList => _photoSaloonStore.saloonPhotosList;

  List<SocialNetwork> get socialNetworkList => _socialNetworksSaloonStore.socialNetworksList;

  Future<void> updateSaloonDetail(
      {String? title, String? site, String? description}) async {
    await _saloonStore.updateSaloonDetail(
      title: title,
      site: site,
      description: description,
    );
  }

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

  //addresses store
  List<City> get citiesList => _addressesAppStore.citiesList;

  Future<List<Street>> getListStreet(
      String cityName, String streetInput) async {
    return await _addressesAppStore.getStreetsList(cityName, streetInput);
  }

  Future<List<HouseNumber>> getListHouse(
      String cityName, String streetTitle, String houseNumber) async {
    return await _addressesAppStore.getHousesList(
        cityName, streetTitle, houseNumber);
  }

  Future<void> createAddress(
      City city, Street street, HouseNumber house) async {
    await _addressesAppStore.createAddress(city, street, house);
  }

  //social_networks_store
  List<SocialNetwork> get socialNetworksList => _socialNetworksSaloonStore.socialNetworksList;
}
