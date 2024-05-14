import 'package:okoshki/domain/entities/address.dart';
import 'package:okoshki/domain/entities/current_window.dart';

class Saloon {
  final int id;
  final String title;
  final Address? address;
  final bool isPremium;
  final double rating;
  final double? distance;
  final double? usersLiked;
  final String? logo;
  final bool? salonBlocking;
  final bool? maxActiveBooking;
  final List<CurrentWindow>? currentWindows;

  const Saloon({
    required this.id,
    required this.title,
    required this.address,
    required this.isPremium,
    required this.rating,
    required this.distance,
    required this.usersLiked,
    required this.logo,
    required this.salonBlocking,
    required this.maxActiveBooking,
    required this.currentWindows,
  });

  @override
  String toString() {
    return 'Saloon{id: $id, title: $title, address: $address, isPremium: $isPremium, rating: $rating, distance: $distance, usersLiked: $usersLiked, logo: $logo, salonBlocking: $salonBlocking, maxActiveBooking: $maxActiveBooking, currentWindow: $currentWindows}';
  }
}
