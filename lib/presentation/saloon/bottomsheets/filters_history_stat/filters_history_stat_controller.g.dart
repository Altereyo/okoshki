// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_history_stat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FiltersHistoryStatController on _FiltersHistoryStatController, Store {
  Computed<bool>? _$isResetButtonComputed;

  @override
  bool get isResetButton =>
      (_$isResetButtonComputed ??= Computed<bool>(() => super.isResetButton,
              name: '_FiltersHistoryStatController.isResetButton'))
          .value;

  late final _$isSelectPeriodAtom = Atom(
      name: '_FiltersHistoryStatController.isSelectPeriod', context: context);

  @override
  bool get isSelectPeriod {
    _$isSelectPeriodAtom.reportRead();
    return super.isSelectPeriod;
  }

  @override
  set isSelectPeriod(bool value) {
    _$isSelectPeriodAtom.reportWrite(value, super.isSelectPeriod, () {
      super.isSelectPeriod = value;
    });
  }

  late final _$fromDateTimeAtom = Atom(
      name: '_FiltersHistoryStatController.fromDateTime', context: context);

  @override
  DateTime? get fromDateTime {
    _$fromDateTimeAtom.reportRead();
    return super.fromDateTime;
  }

  @override
  set fromDateTime(DateTime? value) {
    _$fromDateTimeAtom.reportWrite(value, super.fromDateTime, () {
      super.fromDateTime = value;
    });
  }

  late final _$toDateTimeAtom =
      Atom(name: '_FiltersHistoryStatController.toDateTime', context: context);

  @override
  DateTime? get toDateTime {
    _$toDateTimeAtom.reportRead();
    return super.toDateTime;
  }

  @override
  set toDateTime(DateTime? value) {
    _$toDateTimeAtom.reportWrite(value, super.toDateTime, () {
      super.toDateTime = value;
    });
  }

  late final _$periodButtonAtom = Atom(
      name: '_FiltersHistoryStatController.periodButton', context: context);

  @override
  int? get periodButton {
    _$periodButtonAtom.reportRead();
    return super.periodButton;
  }

  @override
  set periodButton(int? value) {
    _$periodButtonAtom.reportWrite(value, super.periodButton, () {
      super.periodButton = value;
    });
  }

  late final _$statusSetAtom =
      Atom(name: '_FiltersHistoryStatController.statusSet', context: context);

  @override
  ObservableSet<int> get statusSet {
    _$statusSetAtom.reportRead();
    return super.statusSet;
  }

  @override
  set statusSet(ObservableSet<int> value) {
    _$statusSetAtom.reportWrite(value, super.statusSet, () {
      super.statusSet = value;
    });
  }

  late final _$_FiltersHistoryStatControllerActionController =
      ActionController(name: '_FiltersHistoryStatController', context: context);

  @override
  void onTapResetFilter() {
    final _$actionInfo = _$_FiltersHistoryStatControllerActionController
        .startAction(name: '_FiltersHistoryStatController.onTapResetFilter');
    try {
      return super.onTapResetFilter();
    } finally {
      _$_FiltersHistoryStatControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSelectPeriod: ${isSelectPeriod},
fromDateTime: ${fromDateTime},
toDateTime: ${toDateTime},
periodButton: ${periodButton},
statusSet: ${statusSet},
isResetButton: ${isResetButton}
    ''';
  }
}
