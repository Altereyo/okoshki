import 'package:okoshki/data/services/calendar_service.dart';
import 'package:okoshki/domain/entities/calenadar_event.dart';
import 'package:okoshki/domain/repository/services/calendar_repository.dart';

class CalendarRepositoryImpl extends CalendarRepository {
  final CalendarService _calendarService;

  CalendarRepositoryImpl({required CalendarService calendarService})
      : _calendarService = calendarService;
  @override
  Future<void> addEventToCalendar({
    required CalendarEvent calendarEvent,
  }) {
    return _calendarService.addEventToCalendar(
      calendarEvent: calendarEvent,
    );
  }
}
