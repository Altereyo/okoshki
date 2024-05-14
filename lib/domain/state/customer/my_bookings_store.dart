import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/booking.dart';
import 'package:okoshki/domain/repository/api/booking_repository.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/internal/constants/status_booking.dart';
import 'package:okoshki/internal/utils/logger.dart';

part 'my_bookings_store.g.dart';

// ignore: library_private_types_in_public_api
class MyBookingsCustomerStore = _MyBookingsCustomerStore
    with _$MyBookingsCustomerStore;

abstract class _MyBookingsCustomerStore with Store {
  _MyBookingsCustomerStore({
    required BookingRepository bookingRepository,
    required LocalDataRepository localDataRepository,
  })  : _bookingRepository = bookingRepository,
        _localDataRepository = localDataRepository;

  final BookingRepository _bookingRepository;
  final LocalDataRepository _localDataRepository;

  Future<void> init() async {
    if (_localDataRepository.getToken() != null) {
      await getBookingList();
    }
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  //наличие фильтров
  @observable
  bool isFilters = false;

  @observable
  ObservableList<Booking> myBookingsList = ObservableList();

  @computed
  String get counterMyBooking => myBookingsList.length.toString();

  @action
  Future<void> getBookingList({
    String? from,
    String? to,
  }) async {
    final res = await _bookingRepository.getBookingList(
      from: from,
      to: to,
    );
    if (!res.success) {
      logger.e(res.message);
    }
    myBookingsList = ObservableList.of(res.data!);
  }

  @action
  Future<Booking> createBooking({
    required int windowId,
    required int windowServiceId,
  }) async {
    final res = await _bookingRepository.createBooking(
      windowId: windowId,
      windowServiceId: windowServiceId,
    );

    if (!res.success) {
      logger.e(res.message);
    }

    myBookingsList.add(res.data!);
    return res.data!;
  }

  @action
  Future<bool> updateBookingStatusCancelled({required int bookingId}) async {
    final res = await _bookingRepository.updateBookingStatus(
      bookingId: bookingId,
      status: StatusBookingEnum.CLIENT_CANCELLED.name,
    );
    if (res.success) {
      final index = myBookingsList.indexWhere(
        (element) => element.id == res.data!.id,
      );
      myBookingsList[index] = res.data!;
    }
    return res.success;
  }
}
