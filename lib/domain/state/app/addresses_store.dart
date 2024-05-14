import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/city.dart';
import 'package:okoshki/domain/entities/house_number.dart';
import 'package:okoshki/domain/entities/street.dart';
import 'package:okoshki/domain/repository/api/address_repository.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/internal/utils/sl.dart';

part 'addresses_store.g.dart';

// ignore: library_private_types_in_public_api
class AddressesAppStore = _AddressesAppStore with _$AddressesAppStore;

abstract class _AddressesAppStore with Store {
  _AddressesAppStore({required AddressRepository addressRepository})
      : _addressRepository = addressRepository;

  final AddressRepository _addressRepository;

  Future<void> init() async {
    _getCitiesList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  List<City> citiesList = [];

  Future<void> _getCitiesList() async {
    final res = await _addressRepository.getCities();

    if (res.success) {
      citiesList.addAll(res.data!);
    }
  }

  Future<List<Street>> getStreetsList(
    String cityName,
    String streetInput,
  ) async {
    final res = await _addressRepository.searchStreet(
      cityName: cityName,
      streetInput: streetInput,
    );

    if (res.success) {
      return res.data!;
    }
    return [];
  }

  Future<List<HouseNumber>> getHousesList(
    String cityName,
    String streetTitle,
    String houseNumber,
  ) async {
    final res = await _addressRepository.searchHouseNumber(
      cityName: cityName,
      streetTitle: streetTitle,
      houseNumber: houseNumber,
    );

    if (res.success) {
      return res.data!;
    }
    return [];
  }

  Future<void> createAddress(
    City city,
    Street street,
    HouseNumber house,
  ) async {
    final res = await _addressRepository.createAddress(
      cityId: city.id,
      streetTitle: street.title,
      houseNumber: house.houseNumber,
      lat: house.lat,
      lon: house.lon,
    );

    if (res.success) {
      sl<SaloonStore>().updateSaloonDetail(
            setAddress: res.data!.id.toString(),
          );
    }
  }
}
