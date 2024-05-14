import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:okoshki/data/models/city/city.dart';
import 'package:okoshki/internal/constants/moscow_latlon.dart';
import 'package:okoshki/internal/utils/logger.dart';

class GeolocationService {
  bool _serviceEnabled = false;
  LocationPermission? _permissionGranted;
  CityModel? _nearestCity;
  Position? _locationData;

  double? get _myLat => _locationData?.latitude;

  double? get _myLon => _locationData?.longitude;

  String? get point =>
      (_myLat == null && _myLon == null) ? null : '$_myLon,$_myLat';

  Future<void> initService() async {
    final isCheckGeoService = await checkGeoService();
    final isCheckGeoPermission = await checkGeoPermission();

    if (isCheckGeoService && isCheckGeoPermission) {
      _locationData = await Geolocator.getCurrentPosition();
    }
  }

  Future<String?> getCurrentPoint() async {
    final ischeckGeoPermission = await checkGeoPermission();
    if (!ischeckGeoPermission) {
      return null;
    }
    final lastPosition = await Geolocator.getLastKnownPosition();
    if (lastPosition != null) {
      return '${lastPosition.longitude},${lastPosition.latitude}';
    } else {
      final position = await Geolocator.getCurrentPosition();
      return '${position.longitude},${position.latitude}';
    }
  }

  Future<bool> checkGeoService() async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      logger.e('Location services are disabled.');
    }
    return _serviceEnabled;
  }

  Future<bool> checkGeoPermission() async {
    _permissionGranted = await Geolocator.checkPermission();
    if (_permissionGranted == LocationPermission.denied) {
      //_permissionGranted = await Geolocator.requestPermission();
      // if (_permissionGranted == LocationPermission.denied) {
      //   logger.e('Location permissions are denied');
      //   return false;
      // }
      return false;
    }

    if (_permissionGranted == LocationPermission.deniedForever) {
      logger.e(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  LatLng getMyOrNearestCityCoordinates() {
    if (_locationData != null) {
      return LatLng(_myLat!, _myLon!);
    } else if (_nearestCity != null) {
      return LatLng(_nearestCity!.centerLat, _nearestCity!.centerLon);
    }
    return moscowLatLon;
  }

  LatLng? getMyPosition() {
    if (_locationData != null) {
      return LatLng(_myLat!, _myLon!);
    } else {
      return null;
    }
  }

  Future<CityModel> getNearestCity(List<CityModel> cityList) async {
    if (!_serviceEnabled) initService();
    try {
      CityModel nearestCity =
          cityList.firstWhere((element) => element.title == 'Москва');
      double distance = Geolocator.distanceBetween(
          _myLat!, _myLon!, nearestCity.centerLat, nearestCity.centerLon);

      cityList.forEach((city) {
        if (nearestCity.id == city.id) return;

        double distanceInMeters = Geolocator.distanceBetween(
            _myLat!, _myLon!, city.centerLat, city.centerLon);
        if (distanceInMeters < distance) {
          nearestCity = city;
        }
      });
      logger.i('NEAREST CITY: ${nearestCity.title}');
      _nearestCity = nearestCity;
      return nearestCity;
    } catch (e, s) {
      logger.e('Error getting nearest city, returning Moscow',
          error: e, stackTrace: s);
      final nearestCity =
          cityList.firstWhere((element) => element.title == 'Москва');
      _nearestCity = nearestCity;
      return nearestCity;
    } finally {
      print('GOT CITY: ${_nearestCity!.title}');
    }
  }
}
