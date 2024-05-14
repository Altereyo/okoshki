import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:okoshki/domain/entities/calenadar_event.dart';

class CalendarService {
  Future<void> addEventToCalendar({
    required CalendarEvent calendarEvent,
  }) async {
    final event = Event(
      title: calendarEvent.title,
      description: calendarEvent.description,
      location: calendarEvent.location,
      startDate: calendarEvent.startDate,
      endDate: calendarEvent.endDate,
    );
    await Add2Calendar.addEvent2Cal(event);
  }
}
