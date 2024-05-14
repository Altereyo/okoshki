import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/repository/services/url_launcher_repository.dart';
import 'package:okoshki/domain/state/saloon/window_store.dart';
import 'package:okoshki/internal/constants/status_booking.dart';

part 'window_detail_controller.g.dart';

// ignore: library_private_types_in_public_api
class WindowDetailController = _WindowDetailController
    with _$WindowDetailController;

abstract class _WindowDetailController with Store {
  _WindowDetailController({
    required Window window,
    required WindowSaloonStore windowSaloonStore,
    required UrlLauncherRepository urlLauncherRepository,
  })  : _window = window,
        _windowSaloonStore = windowSaloonStore,
        _urlLauncherRepository = urlLauncherRepository;

  final Window _window;
  final WindowSaloonStore _windowSaloonStore;
  final UrlLauncherRepository _urlLauncherRepository;
  String? bookingActiveUId; //uid активной брони у окошка

  Window get window => _window;

  Future<void> deleteWindow() async {
    await _windowSaloonStore.deleteWindow(_window.id!);
  }

  Future<bool> updateBookingQr() async {
    if (bookingActiveUId != null) {
      return await _windowSaloonStore.updateBookingQr(
          bookingUid: bookingActiveUId!);
    }
    return false;
  }
  Future<void> makePhoneCall()async{
    final bookingWindow = window.bookingsWindow!.firstWhere(
      (element) => element.status == StatusBookingEnum.SERVICE_RENDERED.name,
    );
    final phone = bookingWindow.client.phoneNumber;
    _urlLauncherRepository.makePhoneCall(phone);
  }
}
