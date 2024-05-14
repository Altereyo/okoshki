import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/date_time.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/state/saloon/window_store.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_day_time_window/select_day_time_window_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_window_service/select_window_service_controller.dart';

part 'edit_window_controller.g.dart';

// ignore: library_private_types_in_public_api
class EditWindowController = _EditWindowController with _$EditWindowController;

abstract class _EditWindowController with Store {
  _EditWindowController({
    required WindowSaloonStore windowSaloonStore,
    required Window window,
    required SelectDayTimeWindowController selectDayTimeController,
    required SelectWindowServiceController selectWindowServiceController,
  })  : _windowSaloonStore = windowSaloonStore,
        _window = window,
        _selectDayTimeController = selectDayTimeController,
        _selectWindowServiceController = selectWindowServiceController;

  final WindowSaloonStore _windowSaloonStore;
  final Window _window;
  final SelectDayTimeWindowController _selectDayTimeController;
  final SelectWindowServiceController _selectWindowServiceController;

  void init() {
    //daybutton
    final windowDateTime = _window.startDateTime;
    if (windowDateTime.isToday) {
      _selectDayTimeController.selectDayButton = 0;
    } else if (windowDateTime.isTomorrow) {
      _selectDayTimeController.selectDayButton = 1;
    } else if (windowDateTime.isAfterTomorrow) {
      _selectDayTimeController.selectDayButton = 2;
    }
    //datetime
    _selectDayTimeController.startDateTime = _window.startDateTime;
    _selectDayTimeController.endDateTime = _window.endDateTime;
    _selectDayTimeController.startHour =
        DateFormat('HH').format(_window.startDateTime);
    _selectDayTimeController.startMinute =
        DateFormat('mm').format(_window.startDateTime);
    _selectDayTimeController.endHour =
        DateFormat('HH').format(_window.endDateTime);
    _selectDayTimeController.endMinute =
        DateFormat('mm').format(_window.endDateTime);

    //windowService
    for (var element in _window.allServicesWindow) {
      final listSerWin = _window.services
          .where(
            (winSer) => winSer.service.id == element.id,
          )
          .toList();
      _selectWindowServiceController.windowServices.add(listSerWin);
    }
  }

  SelectDayTimeWindowController get selectDayTimeController =>
      _selectDayTimeController;
  SelectWindowServiceController get selectWindowServiceController =>
      _selectWindowServiceController;

  @computed
  bool get isCompleteButton =>
      _selectDayTimeController.selectDayButton != null &&
      _selectDayTimeController.startHour.isNotEmpty &&
      _selectDayTimeController.startMinute.isNotEmpty &&
      _selectDayTimeController.endHour.isNotEmpty &&
      _selectDayTimeController.endMinute.isNotEmpty &&
      _selectWindowServiceController.windowServices.isNotEmpty;

  String? get _updateStartDate {
    if (_selectDayTimeController.startDateTime != _window.startDateTime) {
      return selectDayTimeController.startDateTime.toString();
    } else {
      return null;
    }
  }

  String? get _updateEndDate {
    if (_selectDayTimeController.endDateTime != _window.endDateTime) {
      return selectDayTimeController.endDateTime.toString();
    } else {
      return null;
    }
  }

  Future<bool> updateWindow() async {
    //update window
    return await _windowSaloonStore.updateWindow(
      windowId: _window.id!,
      startDt: _updateStartDate,
      endDt: _updateEndDate,
      delete: _selectWindowServiceController.deleteWindowServicesList,
      update: _selectWindowServiceController.updateWindowServicesList,
      create: _selectWindowServiceController.createWindowServicesList,
    );
  }
}
