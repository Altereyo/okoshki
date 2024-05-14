import 'package:okoshki/domain/entities/booking_window.dart';

extension BookingWindowExtension on BookingWindow {
  String get titleCommision => 'комиссия $commissionAmount ₽';
}
