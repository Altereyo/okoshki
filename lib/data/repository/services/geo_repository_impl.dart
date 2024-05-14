import 'package:latlong2/latlong.dart';
import 'package:okoshki/data/services/geolocation_service.dart';
import 'package:okoshki/domain/repository/services/geo_repository.dart';

class GeoRepositoryImpl extends GeoRepository {
  GeoRepositoryImpl({required GeolocationService geolocationService})
      : _geolocationService = geolocationService;

  final GeolocationService _geolocationService;

  @override
  LatLng getInitialPosition() {
    return _geolocationService.getMyOrNearestCityCoordinates();
  }

  @override
  LatLng? getUserPosition() {
    return _geolocationService.getMyPosition();
  }

  @override
  Future<bool> checkService() async {
    return await _geolocationService.checkGeoService();
  }

  @override
  Future<bool> isGeoOk() async {
    final serviceEnabled = await _geolocationService.checkGeoService();
    final permissionGot = await _geolocationService.checkGeoPermission();
    return serviceEnabled && permissionGot;
  }
  
  @override
  Future<String?> getPoint() async{
    return _geolocationService.getCurrentPoint();
  }
}