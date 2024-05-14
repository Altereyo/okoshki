import 'package:okoshki/domain/entities/city.dart';

class Address {
  final int id;
  final City city;
  final String street;
  final String houseNumber;
  final double lat;
  final double lon;

  const Address({
    required this.id,
    required this.city,
    required this.street,
    required this.houseNumber,
    required this.lat,
    required this.lon,
  });
  
  @override
  String toString() {
    return '${city.title}, $street, $houseNumber';
  }
}
