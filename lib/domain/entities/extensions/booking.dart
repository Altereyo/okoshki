import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/booking.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';

extension BookingExtension on Booking {
  String get startTime => DateFormat('HH:mm').format(window.startDateTime);

  String get endTime => DateFormat('HH:mm').format(window.endDateTime);

  String get dateTimeBooking {
    final date = DateFormat.yMMMMd().format(window.startDateTime);
    return '$date c $startTime до $endTime';
  }

  String get titleService =>
      '${service.service.serviceType.title}: ${service.service.title}';

  //28.11.2022 (сегодня) с 14:00 до 15:30
  String get dateTimeStartEnd {
    final dateTime = DateFormat.yMd().format(
      DateTime.parse(window.startDt),
    );
    return '$dateTime (${window.dateDay}) c $startTime до $endTime';
  }
}
