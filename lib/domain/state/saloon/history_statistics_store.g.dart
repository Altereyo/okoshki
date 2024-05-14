// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_statistics_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryStatisticsSaloonStore on _HistoryStatisticsSaloonStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HistoryStatisticsSaloonStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$periodDateAtom =
      Atom(name: '_HistoryStatisticsSaloonStore.periodDate', context: context);

  @override
  ({DateTime from, DateTime to}) get periodDate {
    _$periodDateAtom.reportRead();
    return super.periodDate;
  }

  @override
  set periodDate(({DateTime from, DateTime to}) value) {
    _$periodDateAtom.reportWrite(value, super.periodDate, () {
      super.periodDate = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_HistoryStatisticsSaloonStore.status', context: context);

  @override
  String? get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String? value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$isFilterAtom =
      Atom(name: '_HistoryStatisticsSaloonStore.isFilter', context: context);

  @override
  bool get isFilter {
    _$isFilterAtom.reportRead();
    return super.isFilter;
  }

  @override
  set isFilter(bool value) {
    _$isFilterAtom.reportWrite(value, super.isFilter, () {
      super.isFilter = value;
    });
  }

  late final _$saloonStatisticsAtom = Atom(
      name: '_HistoryStatisticsSaloonStore.saloonStatistics', context: context);

  @override
  SaloonStatistics? get saloonStatistics {
    _$saloonStatisticsAtom.reportRead();
    return super.saloonStatistics;
  }

  @override
  set saloonStatistics(SaloonStatistics? value) {
    _$saloonStatisticsAtom.reportWrite(value, super.saloonStatistics, () {
      super.saloonStatistics = value;
    });
  }

  late final _$windowsListAtom =
      Atom(name: '_HistoryStatisticsSaloonStore.windowsList', context: context);

  @override
  ObservableList<Window> get windowsList {
    _$windowsListAtom.reportRead();
    return super.windowsList;
  }

  @override
  set windowsList(ObservableList<Window> value) {
    _$windowsListAtom.reportWrite(value, super.windowsList, () {
      super.windowsList = value;
    });
  }

  late final _$_getSaloonStatisticsAsyncAction = AsyncAction(
      '_HistoryStatisticsSaloonStore._getSaloonStatistics',
      context: context);

  @override
  Future<void> _getSaloonStatistics() {
    return _$_getSaloonStatisticsAsyncAction
        .run(() => super._getSaloonStatistics());
  }

  late final _$_getWindowsListAsyncAction = AsyncAction(
      '_HistoryStatisticsSaloonStore._getWindowsList',
      context: context);

  @override
  Future<void> _getWindowsList() {
    return _$_getWindowsListAsyncAction.run(() => super._getWindowsList());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
periodDate: ${periodDate},
status: ${status},
isFilter: ${isFilter},
saloonStatistics: ${saloonStatistics},
windowsList: ${windowsList}
    ''';
  }
}
