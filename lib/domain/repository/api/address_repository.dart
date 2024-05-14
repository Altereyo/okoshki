import 'package:okoshki/domain/entities/address.dart';
import 'package:okoshki/domain/entities/city.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/house_number.dart';
import 'package:okoshki/domain/entities/street.dart';

abstract class AddressRepository {
  Future<ApiResource<List<City>?>> getCities();

  Future<ApiResource<List<Address>?>> getAddresses({String? polygon, int? city});

  Future<City> getNearestCity(List<City> cityList);

  Future<ApiResource<Address>> createAddress({
    required int cityId,
    required String streetTitle,
    required String houseNumber,
    required double lat,
    required double lon,
  });

  Future<ApiResource<List<Street>>> searchStreet({
    required String cityName,
    required String streetInput,
  });

  Future<ApiResource<List<HouseNumber>>> searchHouseNumber({
    required String cityName,
    required String streetTitle,
    required String houseNumber,
  });
}
