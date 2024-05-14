// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SheduleSaloonStore on _SheduleSaloonStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SheduleSaloonStore.isLoading', context: context);

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

  late final _$saloonSheduleListAtom =
      Atom(name: '_SheduleSaloonStore.saloonSheduleList', context: context);

  @override
  ObservableList<SaloonSchedule> get saloonSheduleList {
    _$saloonSheduleListAtom.reportRead();
    return super.saloonSheduleList;
  }

  @override
  set saloonSheduleList(ObservableList<SaloonSchedule> value) {
    _$saloonSheduleListAtom.reportWrite(value, super.saloonSheduleList, () {
      super.saloonSheduleList = value;
    });
  }

  late final _$updateSheduleSaloonAsyncAction =
      AsyncAction('_SheduleSaloonStore.updateSheduleSaloon', context: context);

  @override
  Future<void> updateSheduleSaloon(SaloonSchedule shedule) {
    return _$updateSheduleSaloonAsyncAction
        .run(() => super.updateSheduleSaloon(shedule));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
saloonSheduleList: ${saloonSheduleList}
    ''';
  }
}
