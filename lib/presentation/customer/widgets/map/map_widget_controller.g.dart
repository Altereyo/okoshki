// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_widget_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapWidgetController on _MapWidgetController, Store {
  Computed<List<Saloon>>? _$saloonListComputed;

  @override
  List<Saloon> get saloonList =>
      (_$saloonListComputed ??= Computed<List<Saloon>>(() => super.saloonList,
              name: '_MapWidgetController.saloonList'))
          .value;
  Computed<List<Saloon>>? _$_defaultSaloonsComputed;

  @override
  List<Saloon> get _defaultSaloons => (_$_defaultSaloonsComputed ??=
          Computed<List<Saloon>>(() => super._defaultSaloons,
              name: '_MapWidgetController._defaultSaloons'))
      .value;
  Computed<List<Saloon>>? _$_searchSaloonsComputed;

  @override
  List<Saloon> get _searchSaloons => (_$_searchSaloonsComputed ??=
          Computed<List<Saloon>>(() => super._searchSaloons,
              name: '_MapWidgetController._searchSaloons'))
      .value;

  late final _$isSearchingAtom =
      Atom(name: '_MapWidgetController.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$isGeoEnabledAtom =
      Atom(name: '_MapWidgetController.isGeoEnabled', context: context);

  @override
  bool get isGeoEnabled {
    _$isGeoEnabledAtom.reportRead();
    return super.isGeoEnabled;
  }

  @override
  set isGeoEnabled(bool value) {
    _$isGeoEnabledAtom.reportWrite(value, super.isGeoEnabled, () {
      super.isGeoEnabled = value;
    });
  }

  late final _$openedSaloonAtom =
      Atom(name: '_MapWidgetController.openedSaloon', context: context);

  @override
  Saloon? get openedSaloon {
    _$openedSaloonAtom.reportRead();
    return super.openedSaloon;
  }

  @override
  set openedSaloon(Saloon? value) {
    _$openedSaloonAtom.reportWrite(value, super.openedSaloon, () {
      super.openedSaloon = value;
    });
  }

  late final _$_MapWidgetControllerActionController =
      ActionController(name: '_MapWidgetController', context: context);

  @override
  void openSaloon(BuildContext context, Saloon saloon) {
    final _$actionInfo = _$_MapWidgetControllerActionController.startAction(
        name: '_MapWidgetController.openSaloon');
    try {
      return super.openSaloon(context, saloon);
    } finally {
      _$_MapWidgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeSaloon() {
    final _$actionInfo = _$_MapWidgetControllerActionController.startAction(
        name: '_MapWidgetController.closeSaloon');
    try {
      return super.closeSaloon();
    } finally {
      _$_MapWidgetControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearching: ${isSearching},
isGeoEnabled: ${isGeoEnabled},
openedSaloon: ${openedSaloon},
saloonList: ${saloonList}
    ''';
  }
}
