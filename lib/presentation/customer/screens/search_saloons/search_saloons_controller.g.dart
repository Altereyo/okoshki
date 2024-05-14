// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_saloons_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchSaloonController on _SearchSaloonController, Store {
  late final _$searchAtom =
      Atom(name: '_SearchSaloonController.search', context: context);

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$isMapAtom =
      Atom(name: '_SearchSaloonController.isMap', context: context);

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

  late final _$_getSaloonsAsyncAction =
      AsyncAction('_SearchSaloonController._getSaloons', context: context);

  @override
  Future<void> _getSaloons() {
    return _$_getSaloonsAsyncAction.run(() => super._getSaloons());
  }

  late final _$_SearchSaloonControllerActionController =
      ActionController(name: '_SearchSaloonController', context: context);

  @override
  void onSearch(String text) {
    final _$actionInfo = _$_SearchSaloonControllerActionController.startAction(
        name: '_SearchSaloonController.onSearch');
    try {
      return super.onSearch(text);
    } finally {
      _$_SearchSaloonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearch() {
    final _$actionInfo = _$_SearchSaloonControllerActionController.startAction(
        name: '_SearchSaloonController.clearSearch');
    try {
      return super.clearSearch();
    } finally {
      _$_SearchSaloonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
isMap: ${isMap}
    ''';
  }
}
