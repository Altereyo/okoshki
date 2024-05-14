import 'package:okoshki/domain/entities/booking_window.dart';
import 'package:okoshki/domain/entities/window_service.dart';

class Window {
  final int? id;
  final String startDt;
  final String endDt;
  final String? status;
  final List<WindowService> services;
  final List<BookingWindow>? bookingsWindow;

  Window({
    this.id,
    required this.startDt,
    required this.endDt,
    this.status,
    required this.services,
     this.bookingsWindow,
  });

  @override
  String toString() {
    return '$id $startDt $endDt $status $services, $bookingsWindow';
  }
}
