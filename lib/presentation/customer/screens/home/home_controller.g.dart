// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeCustomerController on _HomeCustomerController, Store {
  Computed<bool?>? _$isLastPageComputed;

  @override
  bool? get isLastPage =>
      (_$isLastPageComputed ??= Computed<bool?>(() => super.isLastPage,
              name: '_HomeCustomerController.isLastPage'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_HomeCustomerController.isLoading'))
          .value;
  Computed<bool>? _$isFiltersSortingComputed;

  @override
  bool get isFiltersSorting => (_$isFiltersSortingComputed ??= Computed<bool>(
          () => super.isFiltersSorting,
          name: '_HomeCustomerController.isFiltersSorting'))
      .value;

  late final _$isNavigationBarAtom =
      Atom(name: '_HomeCustomerController.isNavigationBar', context: context);

  @override
  bool get isNavigationBar {
    _$isNavigationBarAtom.reportRead();
    return super.isNavigationBar;
  }

  @override
  set isNavigationBar(bool value) {
    _$isNavigationBarAtom.reportWrite(value, super.isNavigationBar, () {
      super.isNavigationBar = value;
    });
  }

  late final _$isMapAtom =
      Atom(name: '_HomeCustomerController.isMap', context: context);

  @override
  bool get isMap {
    _$isMapAtom.reportRead();
    return super.isMap;
  }

  @override
  set isMap(bool value) {
    _$isMapAtom.reportWrite(value, super.isMap, () {
      super.isMap = value;
    });
  }

  late final _$isTutorialAtom =
      Atom(name: '_HomeCustomerController.isTutorial', context: context);

  @override
  bool get isTutorial {
    _$isTutorialAtom.reportRead();
    return super.isTutorial;
  }

  @override
  set isTutorial(bool value) {
    _$isTutorialAtom.reportWrite(value, super.isTutorial, () {
      super.isTutorial = value;
    });
  }

  late final _$setIsTutorialAsyncAction =
      AsyncAction('_HomeCustomerController.setIsTutorial', context: context);

  @override
  Future<void> setIsTutorial() {
    return _$setIsTutorialAsyncAction.run(() => super.setIsTutorial());
  }

  @override
  String toString() {
    return '''
isNavigationBar: ${isNavigationBar},
isMap: ${isMap},
isTutorial: ${isTutorial},
isLastPage: ${isLastPage},
isLoading: ${isLoading},
isFiltersSorting: ${isFiltersSorting}
    ''';
  }
}
