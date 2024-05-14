import 'package:okoshki/domain/entities/calenadar_event.dart';

abstract class CalendarRepository {
  Future<void> addEventToCalendar({
    required CalendarEvent calendarEvent,
  });
}
