import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/state/saloon/window_store.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_day_time_window/select_day_time_window_controller.dart';
import 'package:okoshki/presentation/saloon/widgets/window/select_window_service/select_window_service_controller.dart';

part 'create_windows_controller.g.dart';

// ignore: library_private_types_in_public_api
class CreateWindowController = _CreateWindowController
    with _$CreateWindowController;

abstract class _CreateWindowController with Store {
  _CreateWindowController({
    required WindowSaloonStore windowSaloonStore,
    required SelectDayTimeWindowController selectDayTimeController,
    required SelectWindowServiceController selectWindowServiceController,
  })  : _windowSaloonStore = windowSaloonStore,
        _selectDayTimeController = selectDayTimeController,
        _selectWindowServiceController = selectWindowServiceController;

  final WindowSaloonStore _windowSaloonStore;
  final SelectDayTimeWindowController _selectDayTimeController;
  final SelectWindowServiceController _selectWindowServiceController;

  SelectDayTimeWindowController get selectDayTimeController =>
      _selectDayTimeController;
  SelectWindowServiceController get selectWindowServiceController => _selectWindowServiceController;

  @computed
  bool get isCompleteButton =>
      _selectDayTimeController.selectDayButton != null &&
      _selectDayTimeController.startHour.isNotEmpty &&
      _selectDayTimeController.startMinute.isNotEmpty &&
      _selectDayTimeController.endHour.isNotEmpty &&
      _selectDayTimeController.endMinute.isNotEmpty &&
      _selectWindowServiceController.windowServices.isNotEmpty;


  Future<bool> createWindow() async {
    final window = Window(
      startDt: _selectDayTimeController.startDateTime.toString(),
      endDt: _selectDayTimeController.endDateTime.toString(),
      services: _selectWindowServiceController.windowServicesList,
    );
   return await _windowSaloonStore.createWindow(newWindow: window);
  }
}
