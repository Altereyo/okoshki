import 'package:okoshki/data/api/requests/get_booking_list/get_booking_list.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/booking/booking.dart';
import 'package:okoshki/data/models/window/window.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/repository/api/booking_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class BookingRepositoryImpl extends BookingRepository {
  final RestClientApi _restClientApi;

  BookingRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<BookingModel>>> getBookingList({
    int? saloonId,
    String? from,
    String? to,
  }) async {
    final body = GetBookingListBody(
      salon: saloonId,
      from: from,
      to: to,
    );
    final apiToBeCalled = _restClientApi.getBookingList(
      body.toJson(),
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<BookingModel>> createBooking({
    required int windowId,
    required int windowServiceId,
  }) async {
    final apiToBeCalled = _restClientApi.createBooking(
      windowId: windowId,
      windowServiceId: windowServiceId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<BookingModel>> updateBookingStatus({
    required int bookingId,
    required String status,
  }) async {
    final apiToBeCalled = _restClientApi.updateBookingStatus(
      bookingId: bookingId,
      status: status,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<WindowModel>> updateBookingQr({
    required String bookingUid,
  }) async {
    final apiToBeCalled = _restClientApi.updateBookingQr(
      bookingUid: bookingUid,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
