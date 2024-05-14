import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/state/saloon/window_store.dart';

part 'booking_window_qr_controller.g.dart';

// ignore: library_private_types_in_public_api
class BookingWindowQrController = _BookingWindowQrController
    with _$BookingWindowQrController;

abstract class _BookingWindowQrController with Store {
  _BookingWindowQrController({
    required Window window,
    required WindowSaloonStore windowSaloonStore,
  })  : _window = window,
        _windowSaloonStore = windowSaloonStore;
  final Window _window;
  final WindowSaloonStore _windowSaloonStore;
  String? bookingActiveUId; //uid активной брони у окошка

  Future<void> init() async {
    _updateBookingQr();
  }

  Window get window => _window;

  @observable
  bool isBookingWindow = false;

  Future<void> _updateBookingQr() async {
    await Future.delayed(const Duration(seconds: 2));
    if (bookingActiveUId != null) {
      await _windowSaloonStore.updateBookingQr(bookingUid: bookingActiveUId!);
      isBookingWindow = true;
    }
  }
}
