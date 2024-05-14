import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/service_type.dart';
import 'package:okoshki/domain/state/app/services_store.dart';
import 'package:okoshki/domain/state/customer/saloons_list_store.dart';

part 'filters_sorting_saloons_controller.g.dart';

// ignore: library_private_types_in_public_api
class FiltersSortingSaloonsController = _FiltersSortingSaloonsController
    with _$FiltersSortingSaloonsController;

abstract class _FiltersSortingSaloonsController with Store {
  _FiltersSortingSaloonsController({
    required ServicesAppStore servicesAppStore,
    required SaloonsListCustomerStore saloonListCustomerStore,
  })  : _servicesAppStore = servicesAppStore,
        _saloonListCustomerStore = saloonListCustomerStore;

  final ServicesAppStore _servicesAppStore;
  final SaloonsListCustomerStore _saloonListCustomerStore;

  late GroupButtonController buttonServicesController;
  late GroupButtonController buttonDistanceController;
  late GroupButtonController buttonCostController;
  late GroupButtonController buttonDayController;
  late GroupButtonController buttonSortController;

  void init() {
    //по удалености или по популярности
    sortButton = isGeolocation ? 0 : 2;

    buttonServicesController = GroupButtonController(
      selectedIndexes: selectedIndexesButtonsSerType(),
    );
    buttonDistanceController = GroupButtonController(
      selectedIndex: distanceButton,
    );
    buttonCostController = GroupButtonController(
      selectedIndex: costButton,
    );
    buttonDayController = GroupButtonController(
      selectedIndex: dayButton,
    );
    buttonSortController = GroupButtonController(
      selectedIndex: sortButton,
    );
  }

  @computed
  bool get isLoading => _servicesAppStore.isLoading;

  //отображение кнопки сбросить фильтр
  @computed
  bool get isResetButton =>
      servicesSelectedList.isNotEmpty ||
      (isWindowsButton == true) ||
      (distance != 0) ||
      (costButton != 0) ||
      (dayButton != 0) ||
      sortButton != (isGeolocation ? 0 : 2);

  //сброс фильтра
  @action
  void onTapResetFiltersSortings() {
    servicesSelectedList.clear();
    isWindowsButton = false;
    distance = 0;
    costButton = 0;
    dayButton = 0;
    sortButton = isGeolocation ? 0 : 2;

    buttonServicesController.unselectAll();

    buttonDistanceController.unselectAll();
    buttonDistanceController.selectIndex(0);

    buttonCostController.unselectAll();
    buttonCostController.selectIndex(0);

    buttonDayController.unselectAll();
    buttonDayController.selectIndex(0);

    buttonSortController.unselectAll();
    buttonSortController.selectIndex(isGeolocation ? 0 : 2);

    _saloonListCustomerStore.isLoading = false;
  }

  //применить фильтр
  Future<void> applySaloonFilters() async {
    final services = servicesSelectedList.map((element) => element.id).toList();
    _saloonListCustomerStore.isFiltersSorting = true;
    _saloonListCustomerStore.sortSaloon = sort;
    _saloonListCustomerStore.services = services;
    _saloonListCustomerStore.windows = windows;
    _saloonListCustomerStore.distance = distanceToInt;
    _saloonListCustomerStore.cost = cost;
    _saloonListCustomerStore.windowsDate = windowsDate();

    await _saloonListCustomerStore.getSaloonsList();
  }

  ///services
  List<ServiceType> get servicesTypeList => _servicesAppStore.servicesTypeList;

  @observable
  ObservableList<ServiceType> servicesSelectedList = ObservableList();

  //возращает индексы выбранных типов услуг
  List<int> selectedIndexesButtonsSerType() {
    List<int> list = [];
    for (var element in servicesSelectedList) {
      list.add(
        servicesTypeList.indexWhere(
          (serType) => serType.id == element.id,
        ),
      );
    }
    return list;
  }

  /// windows
  @observable
  bool isWindowsButton = false;

  String get windows => switch (isWindowsButton) {
        true => '1',
        false => '0',
      };

  ///distance
  @observable
  bool isActiveRadius = false;

  @observable
  double distance = 0;

  @observable
  int distanceButton = 0;

  int? get distanceToInt => distance == 0 ? null : distance.toInt();

  bool get isGeolocation => _saloonListCustomerStore.isGeolocation;

  ///price
  @observable
  int costButton = 0;

  int? get cost => switch (costButton) {
        0 => null,
        1 => 1000,
        2 => 2000,
        3 => 5000,
        _ => null,
      };

  ///day
  @observable
  int dayButton = 0;

  String? windowsDate() {
    final dateTime = DateTime.now();
    switch (dayButton) {
      case 1:
        return DateFormat('yyyy-MM-dd').format(dateTime);
      case 2:
        return DateFormat('yyyy-MM-dd').format(
          dateTime.add(const Duration(days: 1)),
        );
      case 3:
        return DateFormat('yyyy-MM-dd').format(
          dateTime.add(const Duration(days: 2)),
        );
      default:
        return null;
    }
  }

  ///sort
  @observable
  int sortButton = 0;

  String get sort => switch (sortButton) {
        0 => 'distance',
        1 => 'title',
        2 => '-rating',
        _ => '',
      };
}
