import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/booking.dart';
import 'package:okoshki/domain/entities/window.dart';

abstract class BookingRepository {
  Future<ApiResource<List<Booking>>> getBookingList({
   int? saloonId,
    String? from,
    String? to,
  });

  Future<ApiResource<Booking>> createBooking({
    required int windowId,
    required int windowServiceId,
  });

  Future<ApiResource<Booking>> updateBookingStatus({
    required int bookingId,
    required String status,
  });

  Future<ApiResource<Window>> updateBookingQr({
    required String bookingUid,
  });

}

