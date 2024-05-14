// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BalanceSaloonStore on _BalanceSaloonStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_BalanceSaloonStore.isLoading', context: context);

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

  late final _$fromDateTimeAtom =
      Atom(name: '_BalanceSaloonStore.fromDateTime', context: context);

  @override
  DateTime get fromDateTime {
    _$fromDateTimeAtom.reportRead();
    return super.fromDateTime;
  }

  @override
  set fromDateTime(DateTime value) {
    _$fromDateTimeAtom.reportWrite(value, super.fromDateTime, () {
      super.fromDateTime = value;
    });
  }

  late final _$toDateTimeAtom =
      Atom(name: '_BalanceSaloonStore.toDateTime', context: context);

  @override
  DateTime get toDateTime {
    _$toDateTimeAtom.reportRead();
    return super.toDateTime;
  }

  @override
  set toDateTime(DateTime value) {
    _$toDateTimeAtom.reportWrite(value, super.toDateTime, () {
      super.toDateTime = value;
    });
  }

  late final _$saloonBalanceListAtom =
      Atom(name: '_BalanceSaloonStore.saloonBalanceList', context: context);

  @override
  ObservableList<SaloonBalance> get saloonBalanceList {
    _$saloonBalanceListAtom.reportRead();
    return super.saloonBalanceList;
  }

  @override
  set saloonBalanceList(ObservableList<SaloonBalance> value) {
    _$saloonBalanceListAtom.reportWrite(value, super.saloonBalanceList, () {
      super.saloonBalanceList = value;
    });
  }

  late final _$getSaloonBalanceListAsyncAction =
      AsyncAction('_BalanceSaloonStore.getSaloonBalanceList', context: context);

  @override
  Future<void> getSaloonBalanceList() {
    return _$getSaloonBalanceListAsyncAction
        .run(() => super.getSaloonBalanceList());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
fromDateTime: ${fromDateTime},
toDateTime: ${toDateTime},
saloonBalanceList: ${saloonBalanceList}
    ''';
  }
}
