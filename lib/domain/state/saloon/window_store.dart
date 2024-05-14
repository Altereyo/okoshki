import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/date_time.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:okoshki/domain/repository/api/booking_repository.dart';
import 'package:okoshki/domain/repository/api/window_repository.dart';
import 'package:okoshki/domain/state/saloon/history_statistics_store.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/internal/constants/status_booking.dart';
import 'package:okoshki/internal/utils/logger.dart';
import 'package:okoshki/internal/utils/sl.dart';

part 'window_store.g.dart';

// ignore: library_private_types_in_public_api
class WindowSaloonStore = _WindowSaloonStore with _$WindowSaloonStore;

abstract class _WindowSaloonStore with Store {
  _WindowSaloonStore({
    required SaloonStore saloonStore,
    required WindowRepository windowRepository,
    required BookingRepository bookingRepository,
  })  : _saloonStore = saloonStore,
        _windowRepository = windowRepository,
        _bookingRepository = bookingRepository;

  final WindowRepository _windowRepository;
  final BookingRepository _bookingRepository;
  final SaloonStore _saloonStore;
  final dateTime = DateTime.now();

  @observable
  bool isLoading = true;

  @observable
  ObservableList<Window> windowsList = ObservableList();

  Future<void> init() async {
    await asyncWhen((_) => _saloonStore.isLoading == false);
    await _getWindowsList();
    isLoading = false;
  }

  Future<void> refresh() async {
    isLoading = true;
    init().whenComplete(() => isLoading = false);
  }

  @action
  Future<void> _getWindowsList() async {
    final res = await _windowRepository.getWindowList(
      saloonId: _saloonStore.saloonId,
      from: dateTime.toDay,
      to: dateTime.afterTomorrow,
    );
    windowsList = ObservableList.of(res.data!);
  }

  @action
  Future<bool> createWindow({required Window newWindow}) async {
    final res = await _windowRepository.createWindow(
      saloonId: _saloonStore.saloonId,
      window: newWindow,
    );
    if (res.success) {
      windowsList.add(res.data!);
    }
    return res.success;
  }

  @action
  Future<void> deleteWindow(int windowId) async {
    final res = await _windowRepository.deleteWindow(windowId: windowId);
    if (res.success) {
      //Удаление окошка в листе
      windowsList.removeWhere((element) => element.id == windowId);

      //Удаление окошка на экране истории и статистики (При изменение окошка)
      final windowsHistoryList = sl<HistoryStatisticsSaloonStore>().windowsList;
      if (windowsHistoryList.isNotEmpty) {
        windowsHistoryList.removeWhere((element) => element.id == windowId);
      }
    }
  }

  @action
  Future<bool> updateWindow({
    required int windowId,
    String? startDt,
    String? endDt,
    required List<WindowService> delete,
    required List<WindowService> update,
    required List<WindowService> create,
  }) async {
    final res = await _windowRepository.updateWindow(
      windowId: windowId,
      startDt: startDt,
      endDt: endDt,
      delete: delete,
      update: update,
      create: create,
    );
    if (res.success) {
      //Обновление окошка в листе
      final index = windowsList.indexWhere((element) => element.id == windowId);
      windowsList[index] = res.data!;

      //Обновления окошка на экране истории и статистики (При изменение окошка)
      final windowsHistoryList = sl<HistoryStatisticsSaloonStore>().windowsList;
      if (windowsHistoryList.isNotEmpty) {
        final index = windowsHistoryList.indexWhere(
          (element) => element.id == res.data!.id,
        );
        if (index != -1) {
          windowsHistoryList[index] = res.data!;
        }
      }
    }
    return res.success;
  }

  Window? getWindowById(int id) =>
      windowsList.firstWhere((element) => element.id == id);

  Future<Window> getWindowDetails({required int windowId}) async {
    final res = await _windowRepository.getWindowDetails(
      windowId: windowId,
    );
    if (!res.success) {
      logger.e(res.message);
    }
    return res.data!;
  }

  Future<Window?> getWindowTheBooking(String bookingUid) async {
    for (var window in windowsList) {
      final res = window.bookingsWindow!.any(
        (e) => e.uid == bookingUid && e.status == StatusBookingEnum.ACTIVE.name,
      );
      if (res) {
        return window;
      }
    }
    return null;
  }

  @action
  Future<bool> updateBookingQr({required String bookingUid}) async {
    final res = await _bookingRepository.updateBookingQr(
      bookingUid: bookingUid,
    );

    if (res.success) {
      //Обновление окошка в листе
      final index = windowsList.indexWhere(
        (element) => element.id == res.data!.id,
      );
      windowsList[index] = res.data!;

      //Обновления окошка на экране истории и статистики (При изменение окошка)
      final windowsHistoryList = sl<HistoryStatisticsSaloonStore>().windowsList;
      if (windowsHistoryList.isNotEmpty) {
        final index = windowsHistoryList.indexWhere(
          (element) => element.id == res.data!.id,
        );
        if (index != -1) {
          windowsHistoryList[index] = res.data!;
        }
      }
    }
    return res.success;
  }
}
