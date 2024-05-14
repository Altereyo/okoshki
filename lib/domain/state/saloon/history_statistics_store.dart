import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/date_time.dart';
import 'package:okoshki/domain/entities/saloon_statistics.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/repository/api/saloon_statistics_repository.dart';
import 'package:okoshki/domain/repository/api/window_repository.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';

part 'history_statistics_store.g.dart';

// ignore: library_private_types_in_public_api
class HistoryStatisticsSaloonStore = _HistoryStatisticsSaloonStore
    with _$HistoryStatisticsSaloonStore;

abstract class _HistoryStatisticsSaloonStore with Store {
  _HistoryStatisticsSaloonStore({
    required SaloonStore saloonStore,
    required SaloonStatisticsRepository saloonStatisticsRepository,
    required WindowRepository windowRepository,
  })  : _saloonStore = saloonStore,
        _saloonStatisticsRepository = saloonStatisticsRepository,
        _windowRepository = windowRepository;

  final SaloonStore _saloonStore;
  final SaloonStatisticsRepository _saloonStatisticsRepository;
  final WindowRepository _windowRepository;

  Future<void> init() async {
    isLoading = true;
    await asyncWhen((_) => _saloonStore.isLoading == false);
    await _getSaloonStatistics();
    await _getWindowsList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  @observable
  ({DateTime from, DateTime to}) periodDate = (
    from: DateTime.now(),
    to: DateTime.now(),
  );

  @observable
  String? status;

  //наличие фильтра
  @observable
  bool isFilter = false;

  @observable
  SaloonStatistics? saloonStatistics;

  @observable
  ObservableList<Window> windowsList = ObservableList();

  @action
  Future<void> _getSaloonStatistics() async {
    final res = await _saloonStatisticsRepository.getSaloonStatistics(
      saloonId: _saloonStore.saloonId,
      from: periodDate.from.getStartDateTimeInMonth,
      to: periodDate.to.getlastDateTimeInMonth,
    );
    saloonStatistics = res.data!;
  }

  @action
  Future<void> _getWindowsList() async {
    final res = await _windowRepository.getWindowList(
      saloonId: _saloonStore.saloonId,
      from: periodDate.from.getStartDateTimeInMonth,
      to: periodDate.to.getlastDateTimeInMonth,
      status: status,
    );
    windowsList = ObservableList.of(res.data!);
  }

  Future<void> getStatisticsPdf() async {
    await _saloonStatisticsRepository.getSaloonStatisticsPdf(
      saloonId: _saloonStore.saloonId,
      from: periodDate.from.getStartDateTimeInMonth,
      to: periodDate.to.getlastDateTimeInMonth,
    );
  }
}
