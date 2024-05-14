import 'package:latlong2/latlong.dart';

abstract class GeoRepository {
  Future <bool> checkService();
  LatLng getInitialPosition();
  LatLng? getUserPosition();
  Future<String?> getPoint();
  Future<bool> isGeoOk();
}