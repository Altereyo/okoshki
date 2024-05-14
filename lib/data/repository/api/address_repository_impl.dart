import 'package:okoshki/data/api/requests/create_address/create_address.dart';
import 'package:okoshki/data/api/requests/get_addresses/get_addresses.dart';
import 'package:okoshki/data/api/requests/search_house_number/search_house_number.dart';
import 'package:okoshki/data/api/requests/search_street/search_street.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/address/address.dart';
import 'package:okoshki/data/models/city/city.dart';
import 'package:okoshki/data/services/geolocation_service.dart';
import 'package:okoshki/domain/entities/city.dart';
import 'package:okoshki/domain/entities/house_number.dart';
import 'package:okoshki/domain/entities/street.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/repository/api/address_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class AddressRepositoryImpl extends AddressRepository {
  final RestClientApi _restClientApi;
  final GeolocationService _geolocationService;

  AddressRepositoryImpl({
    required RestClientApi restClientApi,
    required GeolocationService geolocationService,
  })  : _restClientApi = restClientApi,
        _geolocationService = geolocationService;

  @override
  Future<ApiResource<List<CityModel>?>> getCities() async {
    final apiToBeCalled = _restClientApi.getCities();
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<AddressModel>?>> getAddresses({
    String? polygon,
    int? city,
  }) async {
    final body = GetAddressesBody(polygon: polygon, city: city);
    final apiToBeCalled = _restClientApi.getAddresses(
      body.toJson(),
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<CityModel> getNearestCity(
    List<City> cityList,
  ) async {
    return await _geolocationService.getNearestCity(
      cityList as List<CityModel>,
    );
  }

  @override
  Future<ApiResource<AddressModel>> createAddress({
    required int cityId,
    required String streetTitle,
    required String houseNumber,
    required double lat,
    required double lon,
  }) async {
    final body = CreateAddressBody(
      city: cityId,
      street: streetTitle,
      houseNumber: houseNumber,
      lat: lat,
      lon: lon,
    );
    final apiToBeCalled = _restClientApi.createAddress(
      body,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<HouseNumber>>> searchHouseNumber({
    required String cityName,
    required String streetTitle,
    required String houseNumber,
  }) async {
    final body = SearchHouseNumberBody(
      city: cityName,
      street: streetTitle,
      houseNumber: houseNumber,
    );
    final apiToBeCalled = _restClientApi.searchHouseNumber(
      body.toJson(),
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<Street>>> searchStreet({
    required String cityName,
    required String streetInput,
  }) async {
    final body = SearchStreetBody(
      city: cityName,
      street: streetInput,
    );
    final apiToBeCalled = _restClientApi.searchStreet(
      body.toJson(),
    );
    return await safeApiCall(apiToBeCalled);
  }
}
