import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/repository/api/window_repository.dart';
import 'package:okoshki/internal/constants/status_window.dart';
import 'package:okoshki/internal/utils/logger.dart';

part 'windows_list_store.g.dart';

// ignore: library_private_types_in_public_api
class WindowsListCustomerStore = _WindowsListCustomerStore
    with _$WindowsListCustomerStore;

abstract class _WindowsListCustomerStore with Store {
  _WindowsListCustomerStore({
    required int saloonId,
    required int windowId,
    required WindowRepository windowRepository,
  })  : _saloonId = saloonId,
        _windowId = windowId,
        _windowRepository = windowRepository;

  final int _saloonId;
  final int _windowId;
  final WindowRepository _windowRepository;

  Future<void> init() async {
    await _getWindowDetail();
    await _getWindowsList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  late Window window; //selected window
  final List<Window> windowsList = [];

  Future<void> _getWindowsList() async {
    final res = await _windowRepository.getWindowList(
        saloonId: _saloonId,
        from: window.startDateTime,
        to: window.endDateTime,
        status: StatusWindowEnum.WAITING.name);

    if (!res.success) {
      logger.e(res.message);
    }
    windowsList.addAll(res.data!);
  }

  Future<void> _getWindowDetail() async {
    final res = await _windowRepository.getWindowDetails(
      windowId: _windowId,
    );

    if (!res.success) {
      logger.e(res.message);
    }
    window = res.data!;
   
  }
}
