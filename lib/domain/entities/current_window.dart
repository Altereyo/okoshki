import 'package:okoshki/domain/entities/current_window_service.dart';

class CurrentWindow {
  final int id;
  final String startDt;
  final String endDt;
  final List<CurrentWindowService> services;

  const CurrentWindow({
    required this.id,
    required this.startDt,
    required this.endDt,
    required this.services,
  });
}
