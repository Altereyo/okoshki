import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/saloon_balance.dart';
import 'package:okoshki/domain/entities/saloon_balance.dart';
import 'package:okoshki/domain/state/saloon/balance_store.dart';
import 'package:okoshki/internal/utils/sl.dart';

part 'history_balance_controller.g.dart';

// ignore: library_private_types_in_public_api
class HistoryBalanceController = _HistoryBalanceController
    with _$HistoryBalanceController;

abstract class _HistoryBalanceController with Store {
  _HistoryBalanceController({
    required BalanceSaloonStore balanceSaloonStore,
  }) : _balanceSaloonStore = balanceSaloonStore;

  final BalanceSaloonStore _balanceSaloonStore;

  @computed
  bool get isLoading => _balanceSaloonStore.isLoading;

  DateTime? get fromDateTime => _balanceSaloonStore.fromDateTime;

  DateTime? get toDateTime => _balanceSaloonStore.toDateTime;

  set setFromDateTime(DateTime dateTime){
    _balanceSaloonStore.fromDateTime = dateTime;
  }

  set setToDateTime(DateTime dateTime){
    _balanceSaloonStore.toDateTime = dateTime;
  }

  ObservableList<SaloonBalance> get saloonBalanceList =>
      _balanceSaloonStore.saloonBalanceList;

  Map<String, List<SaloonBalance>> get saloonBalanceGroupSort {
    final group = groupBy(saloonBalanceList, (val) => val.monthYear);
    return SplayTreeMap<String, List<SaloonBalance>>.from(
        group, (keys1, keys2) => keys1.compareTo(keys2));
  }

  Future<void> init() async {
    await _balanceSaloonStore.getSaloonBalanceList();
  }

  Future<void> dispose() async {
    await sl.resetLazySingleton<BalanceSaloonStore>();
    await sl.resetLazySingleton<HistoryBalanceController>();
  }
}
