import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:group_button/group_button.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/entities/saloon_statistics.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/state/saloon/history_statistics_store.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/filters_history_stat/filters_history_stat_controller.dart';

part 'history_stat_controller.g.dart';

// ignore: library_private_types_in_public_api
class HistoryStatSaloonController = _HistoryStatSaloonController
    with _$HistoryStatSaloonController;

abstract class _HistoryStatSaloonController with Store {
  _HistoryStatSaloonController({
    required HistoryStatisticsSaloonStore historyStatisticsSaloonStore,
  }) : _historyStatisticsSaloonStore = historyStatisticsSaloonStore;

  final HistoryStatisticsSaloonStore _historyStatisticsSaloonStore;

  void init() {
    reaction((_) => dateButton, (button) {
      final dateTime = DateTime.now();
      switch (button) {
        case 0:
          _historyStatisticsSaloonStore.periodDate = (
            from: DateTime(dateTime.year, dateTime.month),
            to: DateTime(dateTime.year, dateTime.month),
          );
          _historyStatisticsSaloonStore.init();
        case 1:
          _historyStatisticsSaloonStore.periodDate = (
            from: DateTime(dateTime.year, dateTime.month - 1),
            to: DateTime(dateTime.year, dateTime.month - 1),
          );
          _historyStatisticsSaloonStore.init();
        case 2:
          _historyStatisticsSaloonStore.periodDate = (
            from: DateTime(dateTime.year, dateTime.month - 2),
            to: DateTime(dateTime.year, dateTime.month - 2),
          );
          _historyStatisticsSaloonStore.init();
      }
    });
  }

  @computed
  bool get isLoading => _historyStatisticsSaloonStore.isLoading;

  //dateTime
  final GroupButtonController groupButtonController =
      GroupButtonController(selectedIndex: 0);

  @observable
  int dateButton = 0;

  @computed
  bool get isFilter => _historyStatisticsSaloonStore.isFilter;

  @computed
  ({DateTime from, DateTime to}) get periodDate =>
      _historyStatisticsSaloonStore.periodDate;

  SaloonStatistics get saloonStatistics =>
      _historyStatisticsSaloonStore.saloonStatistics!;

  ObservableList<Window> get windowsList =>
      _historyStatisticsSaloonStore.windowsList;

  Map<String, List<Window>> get windowGroupSort {
    final group = groupBy(windowsList, (val) => val.monthYear);
    return SplayTreeMap<String, List<Window>>.from(
        group, (keys1, keys2) => keys1.compareTo(keys2));
  }

  Future<void> dispose() async {
    await sl.resetLazySingleton<HistoryStatisticsSaloonStore>();
    await sl.resetLazySingleton<FiltersHistoryStatController>();
  }

  //pdf download
  Future<void> getStatisticsPdf()async{
    await _historyStatisticsSaloonStore.getStatisticsPdf();
  }
}
