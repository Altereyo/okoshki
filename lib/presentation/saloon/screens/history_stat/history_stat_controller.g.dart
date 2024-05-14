// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_stat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryStatSaloonController on _HistoryStatSaloonController, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_HistoryStatSaloonController.isLoading'))
          .value;
  Computed<bool>? _$isFilterComputed;

  @override
  bool get isFilter =>
      (_$isFilterComputed ??= Computed<bool>(() => super.isFilter,
              name: '_HistoryStatSaloonController.isFilter'))
          .value;
  Computed<({DateTime from, DateTime to})>? _$periodDateComputed;

  @override
  ({DateTime from, DateTime to}) get periodDate => (_$periodDateComputed ??=
          Computed<({DateTime from, DateTime to})>(() => super.periodDate,
              name: '_HistoryStatSaloonController.periodDate'))
      .value;

  late final _$dateButtonAtom =
      Atom(name: '_HistoryStatSaloonController.dateButton', context: context);

  @override
  int get dateButton {
    _$dateButtonAtom.reportRead();
    return super.dateButton;
  }

  @override
  set dateButton(int value) {
    _$dateButtonAtom.reportWrite(value, super.dateButton, () {
      super.dateButton = value;
    });
  }

  @override
  String toString() {
    return '''
dateButton: ${dateButton},
isLoading: ${isLoading},
isFilter: ${isFilter},
periodDate: ${periodDate}
    ''';
  }
}
