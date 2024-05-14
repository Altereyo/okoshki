import 'package:group_button/group_button.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/state/saloon/history_statistics_store.dart';
import 'package:okoshki/internal/constants/status_window.dart';

part 'filters_history_stat_controller.g.dart';

// ignore: library_private_types_in_public_api
class FiltersHistoryStatController = _FiltersHistoryStatController
    with _$FiltersHistoryStatController;

abstract class _FiltersHistoryStatController with Store {
  _FiltersHistoryStatController({
    required HistoryStatisticsSaloonStore historyStatisticsSaloonStore,
  }) : _historyStatisticsSaloonStore = historyStatisticsSaloonStore;

  final HistoryStatisticsSaloonStore _historyStatisticsSaloonStore;
  final GroupButtonController periodController = GroupButtonController();
  final GroupButtonController statusController = GroupButtonController();
  final currentDateTime = DateTime.now();

  void init() {
    reaction((p0) => periodButton, (button) {
      if (button == 4) {
        isSelectPeriod = true;
      } else {
        isSelectPeriod = false;
      }
    });
  }
  
  //отображение кнопки сбросить фильтр
  @computed
  bool get isResetButton => periodButton != null || statusSet.isNotEmpty;

  //Выбор периода
  @observable
  bool isSelectPeriod = false;

  //Даты выбранного периода
  @observable
  DateTime? fromDateTime = DateTime.now();

  @observable
  DateTime? toDateTime = DateTime.now();

  //Фильтр период
  @observable
  int? periodButton;

  //Фильтр статус
  @observable
  ObservableSet<int> statusSet = ObservableSet();

  //сброс фильтра
  @action
  void onTapResetFilter() {
    statusController.unselectAll();
    statusSet.clear();

    periodController.unselectAll();
    periodButton = null;

    fromDateTime = DateTime.now();
    toDateTime = DateTime.now();
  }

  //применить сброс фильтра
  Future<void> applyResetFilter() async {
    _applyFilterPeriod();
    _applyFilterStatus();
    _historyStatisticsSaloonStore.isFilter = false;
    _historyStatisticsSaloonStore.init();
  }

  //применить фильтр
  Future<void> applyFilter() async {
    _applyFilterPeriod();
    _applyFilterStatus();
    _historyStatisticsSaloonStore.isFilter = true;
    _historyStatisticsSaloonStore.init();
  }

  void _applyFilterPeriod() {
    switch (periodButton) {
      case 0:
        _currentMounthPeriod();
      case 1:
        _lastQuarterPeriod();
      case 2:
        _lastHalfOfTheYearPeriod();
      case 3:
        _startYearPeriod();
      case 4:
        _selectedPeriod();
    }
  }

  void _applyFilterStatus() {
    final status = statusSet
        .map((element) => switch (element) {
              0 => StatusWindowEnum.DONE.name,
              1 => StatusWindowEnum.BOOKING.name,
              2 => StatusWindowEnum.WAITING.name,
              3 => StatusWindowEnum.CLIENT_NOT_COME.name,
              4 => StatusWindowEnum.WAS_NOT_BOOKING.name,
              5 => StatusWindowEnum.CLIENT_CANCELLED.name,
              _ => null,
            })
        .toList();

    _historyStatisticsSaloonStore.status =
        status.isEmpty ? null : status.join(',');
  }

  void _currentMounthPeriod() {
    _historyStatisticsSaloonStore.periodDate = (
      from: currentDateTime,
      to: currentDateTime,
    );
  }

  void _lastQuarterPeriod() {
    final quarter = _definesQuarter;
    if (quarter == 1) {
      _historyStatisticsSaloonStore.periodDate = (
        from: DateTime(currentDateTime.year),
        to: currentDateTime,
      );
      return;
    } else if (quarter == 2) {
      _historyStatisticsSaloonStore.periodDate = (
        from: DateTime(currentDateTime.year, 4),
        to: currentDateTime,
      );
      return;
    } else if (quarter == 3) {
      _historyStatisticsSaloonStore.periodDate = (
        from: DateTime(currentDateTime.year, 7),
        to: currentDateTime,
      );
      return;
    } else {
      _historyStatisticsSaloonStore.periodDate = (
        from: DateTime(currentDateTime.year, 10),
        to: currentDateTime,
      );
      return;
    }
  }

  void _lastHalfOfTheYearPeriod() {
    final halfYear = _halfYear;
    if (halfYear == 1) {
      _historyStatisticsSaloonStore.periodDate = (
        from: DateTime(currentDateTime.year),
        to: currentDateTime,
      );
    } else {
      _historyStatisticsSaloonStore.periodDate = (
        from: DateTime(currentDateTime.year, 7),
        to: currentDateTime,
      );
    }
  }

  void _startYearPeriod() {
    _historyStatisticsSaloonStore.periodDate = (
      from: DateTime(currentDateTime.year),
      to: currentDateTime,
    );
  }

  void _selectedPeriod() {
    _historyStatisticsSaloonStore.periodDate = (
      from: fromDateTime!,
      to: toDateTime!,
    );
  }

  int get _definesQuarter {
    final quarter = (currentDateTime.month + 2) / 3;
    if (quarter < 2.0) {
      return 1;
    } else if (quarter < 3.0) {
      return 2;
    } else if (quarter < 4.0) {
      return 3;
    } else {
      return 4;
    }
  }

  int get _halfYear {
    if (currentDateTime.month <= 6) {
      return 1;
    } else {
      return 2;
    }
  }
}
