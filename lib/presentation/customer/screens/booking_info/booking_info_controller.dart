import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/booking.dart';
import 'package:okoshki/domain/entities/calenadar_event.dart';
import 'package:okoshki/domain/entities/extensions/booking.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/repository/services/calendar_repository.dart';
import 'package:okoshki/domain/repository/services/share_repository.dart';
import 'package:okoshki/domain/state/customer/my_bookings_store.dart';

part 'booking_info_controller.g.dart';

// ignore: library_private_types_in_public_api
class BookingInfoCustomerController = _BookingInfoCustomerController
    with _$BookingInfoCustomerController;

abstract class _BookingInfoCustomerController with Store {
  _BookingInfoCustomerController({
    required Booking booking,
    required MyBookingsCustomerStore myBookingsCustomerStore,
    required ShareRepository shareRepository,
    required CalendarRepository calendarRepository,
  })  : _booking = booking,
        _myBookingsCustomerStore = myBookingsCustomerStore,
        _shareRepository = shareRepository,
        _calendarRepository = calendarRepository;

  final Booking _booking;
  final MyBookingsCustomerStore _myBookingsCustomerStore;
  final ShareRepository _shareRepository;
  final CalendarRepository _calendarRepository;

  Booking get booking => _booking;

  Future<bool> updateBookingStatusCancelled() async {
    return await _myBookingsCustomerStore.updateBookingStatusCancelled(
        bookingId: _booking.id);
  }

  void shareBookingInfo() async {
    const text = 'Бронь на ';
    final date = _booking.dateTimeStartEnd;
    final masterName = _booking.service.master.name;
    final serviceTitle = _booking.service.service.title;
    await _shareRepository.opensTheSheetToShareTheText(
      text: '$text$date к $masterName на услугу $serviceTitle',
    );
  }

  void addingReservationToTheCalendar() async {
    final CalendarEvent calendarEvent = CalendarEvent(
      title: 'Салон "${_booking.salon.title}"',
      startDate: _booking.window.startDateTime,
      endDate: _booking.window.endDateTime,
      description:
          '${_booking.service.service.serviceType.title}, ${_booking.service.service.title}',
      location: _booking.salon.address.toString(),
    );

    await _calendarRepository.addEventToCalendar(calendarEvent: calendarEvent);
  }
}
