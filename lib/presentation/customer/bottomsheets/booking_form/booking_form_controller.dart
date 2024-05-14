import 'package:group_button/group_button.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/booking.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/entities/service.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/entities/window_service.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/domain/state/customer/windows_list_store.dart';
import 'package:okoshki/domain/state/customer/my_bookings_store.dart';

part 'booking_form_controller.g.dart';

// ignore: library_private_types_in_public_api
class BookingFormController = _BookingFormController
    with _$BookingFormController;

abstract class _BookingFormController with Store {
  _BookingFormController({
    required LocalDataRepository localDataRepository,
    required WindowsListCustomerStore windowsListCustomerStore,
    required MyBookingsCustomerStore myBookingsCustomerStore,
  })  : _localDataRepository = localDataRepository,
        _windowsListCustomerStore = windowsListCustomerStore,
        _myBookingsCustomerStore = myBookingsCustomerStore;

  final LocalDataRepository _localDataRepository;
  final WindowsListCustomerStore _windowsListCustomerStore;
  final MyBookingsCustomerStore _myBookingsCustomerStore;

  late GroupButtonController buttonTimeWindowController;
  late GroupButtonController buttonServicesController;
  late GroupButtonController buttonMasterController;

  Future<void> init() async {
    _initReaction();
    await _initWindow();
  }

  @action
  Future<void> _initWindow() async {
    await asyncWhen((_) => _windowsListCustomerStore.isLoading == false);
    //window
    final index = windowsList.indexWhere(
      (element) => element.id == _windowsListCustomerStore.window.id,
    );
    if (index != -1) {
      buttonTimeWindowController = GroupButtonController(
        selectedIndex: index,
      );
      selectWindow = windowsList[index];
    } else {
      buttonTimeWindowController = GroupButtonController(
        //selectedIndex: 0,
      );
      // selectWindow = windowsList.first;
    }

    //serviceWindow
    buttonServicesController = GroupButtonController();
    //master
    buttonMasterController = GroupButtonController();
  }

  @action
  void _initReaction() {
    //switch window
    reaction((p0) => selectWindow, (selWindow) {
      buttonServicesController.unselectAll();
      buttonMasterController.unselectAll();
      windowServicesList.clear();
      selectWindowService = null;
      if (selectWindow != null) {
        servicesList = ObservableList.of(selWindow!.allServicesWindow);
      }
    });
    // //Меняет лист услуг окошка
    reaction((p0) => selectService, (service) {
      if (service != null) {
        final list = selectWindow!.services
            .where((element) => element.service.id == selectService!.id)
            .toList();
        windowServicesList = ObservableList.of(list);
        buttonMasterController.selectIndex(0);
        selectWindowService = windowServicesList[0];
      }
    });
  }

  @computed
  bool get isLoading =>
      _windowsListCustomerStore.isLoading || _myBookingsCustomerStore.isLoading;

  List<Window> get windowsList => _windowsListCustomerStore.windowsList;

  //Выбранное окошко(время)
  @observable
  Window? selectWindow;

  //Выбранная услуга
  @observable
  Service? selectService;

  //Выбранная услуга окошка
  @observable
  WindowService? selectWindowService;

  //Уникальныe услуги выбранного окошка
  @observable
  ObservableList<Service> servicesList = ObservableList();

  //Услуги окошка выбраной услуги
  @observable
  ObservableList<WindowService> windowServicesList = ObservableList();

  Future<Booking?> createBooking() async {
    if (_localDataRepository.getToken() != null) {
      return await _myBookingsCustomerStore.createBooking(
        windowId: selectWindow!.id!,
        windowServiceId: selectWindowService!.id!,
      );
    }
    return null;
  }
}
