import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/state/saloon/window_store.dart';

part 'scanning_qr_controller.g.dart';

// ignore: library_private_types_in_public_api
class ScanningQrSaloonController = _ScanningQrSaloonController
    with _$ScanningQrSaloonController;

abstract class _ScanningQrSaloonController with Store {
  _ScanningQrSaloonController({
    required WindowSaloonStore windowSaloonStore,
  }) : _windowSaloonStore = windowSaloonStore;

  final WindowSaloonStore _windowSaloonStore;

  @observable
  bool? isError;

  Future<Window?> getWindowTheBooking(String bookingUid) async {
    return await _windowSaloonStore.getWindowTheBooking(bookingUid);
  }
}
