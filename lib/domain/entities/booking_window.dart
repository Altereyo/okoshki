import 'package:okoshki/domain/entities/booking_client.dart';
//История бронирования у окошка
class BookingWindow {
  final int id;
  final String uid;
  final int windowServiceId;
  final BookingClient client;
  final String status;
  final double? commissionAmount;

  const BookingWindow({
    required this.id,
    required this.uid,
    required this.windowServiceId,
    required this.client,
    required this.status,
    this.commissionAmount,
  });

  @override
  String toString() {
    return '$id $uid $windowServiceId $client $status $commissionAmount';
  }
}
