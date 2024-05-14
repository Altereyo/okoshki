// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_sorting_saloons_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FiltersSortingSaloonsController
    on _FiltersSortingSaloonsController, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_FiltersSortingSaloonsController.isLoading'))
          .value;
  Computed<bool>? _$isResetButtonComputed;

  @override
  bool get isResetButton =>
      (_$isResetButtonComputed ??= Computed<bool>(() => super.isResetButton,
              name: '_FiltersSortingSaloonsController.isResetButton'))
          .value;

  late final _$servicesSelectedListAtom = Atom(
      name: '_FiltersSortingSaloonsController.servicesSelectedList',
      context: context);

  @override
  ObservableList<ServiceType> get servicesSelectedList {
    _$servicesSelectedListAtom.reportRead();
    return super.servicesSelectedList;
  }

  @override
  set servicesSelectedList(ObservableList<ServiceType> value) {
    _$servicesSelectedListAtom.reportWrite(value, super.servicesSelectedList,
        () {
      super.servicesSelectedList = value;
    });
  }

  late final _$isWindowsButtonAtom = Atom(
      name: '_FiltersSortingSaloonsController.isWindowsButton',
      context: context);

  @override
  bool get isWindowsButton {
    _$isWindowsButtonAtom.reportRead();
    return super.isWindowsButton;
  }

  @override
  set isWindowsButton(bool value) {
    _$isWindowsButtonAtom.reportWrite(value, super.isWindowsButton, () {
      super.isWindowsButton = value;
    });
  }

  late final _$isActiveRadiusAtom = Atom(
      name: '_FiltersSortingSaloonsController.isActiveRadius',
      context: context);

  @override
  bool get isActiveRadius {
    _$isActiveRadiusAtom.reportRead();
    return super.isActiveRadius;
  }

  @override
  set isActiveRadius(bool value) {
    _$isActiveRadiusAtom.reportWrite(value, super.isActiveRadius, () {
      super.isActiveRadius = value;
    });
  }

  late final _$distanceAtom =
      Atom(name: '_FiltersSortingSaloonsController.distance', context: context);

  @override
  double get distance {
    _$distanceAtom.reportRead();
    return super.distance;
  }

  @override
  set distance(double value) {
    _$distanceAtom.reportWrite(value, super.distance, () {
      super.distance = value;
    });
  }

  late final _$distanceButtonAtom = Atom(
      name: '_FiltersSortingSaloonsController.distanceButton',
      context: context);

  @override
  int get distanceButton {
    _$distanceButtonAtom.reportRead();
    return super.distanceButton;
  }

  @override
  set distanceButton(int value) {
    _$distanceButtonAtom.reportWrite(value, super.distanceButton, () {
      super.distanceButton = value;
    });
  }

  late final _$costButtonAtom = Atom(
      name: '_FiltersSortingSaloonsController.costButton', context: context);

  @override
  int get costButton {
    _$costButtonAtom.reportRead();
    return super.costButton;
  }

  @override
  set costButton(int value) {
    _$costButtonAtom.reportWrite(value, super.costButton, () {
      super.costButton = value;
    });
  }

  late final _$dayButtonAtom = Atom(
      name: '_FiltersSortingSaloonsController.dayButton', context: context);

  @override
  int get dayButton {
    _$dayButtonAtom.reportRead();
    return super.dayButton;
  }

  @override
  set dayButton(int value) {
    _$dayButtonAtom.reportWrite(value, super.dayButton, () {
      super.dayButton = value;
    });
  }

  late final _$sortButtonAtom = Atom(
      name: '_FiltersSortingSaloonsController.sortButton', context: context);

  @override
  int get sortButton {
    _$sortButtonAtom.reportRead();
    return super.sortButton;
  }

  @override
  set sortButton(int value) {
    _$sortButtonAtom.reportWrite(value, super.sortButton, () {
      super.sortButton = value;
    });
  }

  late final _$_FiltersSortingSaloonsControllerActionController =
      ActionController(
          name: '_FiltersSortingSaloonsController', context: context);

  @override
  void onTapResetFiltersSortings() {
    final _$actionInfo =
        _$_FiltersSortingSaloonsControllerActionController.startAction(
            name: '_FiltersSortingSaloonsController.onTapResetFiltersSortings');
    try {
      return super.onTapResetFiltersSortings();
    } finally {
      _$_FiltersSortingSaloonsControllerActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
servicesSelectedList: ${servicesSelectedList},
isWindowsButton: ${isWindowsButton},
isActiveRadius: ${isActiveRadius},
distance: ${distance},
distanceButton: ${distanceButton},
costButton: ${costButton},
dayButton: ${dayButton},
sortButton: ${sortButton},
isLoading: ${isLoading},
isResetButton: ${isResetButton}
    ''';
  }
}
