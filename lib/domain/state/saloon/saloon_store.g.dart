// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SaloonStore on _SaloonStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SaloonStore.isLoading', context: context);

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

  late final _$_saloonDetailAtom =
      Atom(name: '_SaloonStore._saloonDetail', context: context);

  @override
  SaloonDetail get _saloonDetail {
    _$_saloonDetailAtom.reportRead();
    return super._saloonDetail;
  }

  bool __saloonDetailIsInitialized = false;

  @override
  set _saloonDetail(SaloonDetail value) {
    _$_saloonDetailAtom.reportWrite(
        value, __saloonDetailIsInitialized ? super._saloonDetail : null, () {
      super._saloonDetail = value;
      __saloonDetailIsInitialized = true;
    });
  }

  late final _$updateSaloonDetailAsyncAction =
      AsyncAction('_SaloonStore.updateSaloonDetail', context: context);

  @override
  Future<void> updateSaloonDetail(
      {String? title,
      String? site,
      String? description,
      List<int>? addServices,
      List<int>? removeServices,
      String? setAddress}) {
    return _$updateSaloonDetailAsyncAction.run(() => super.updateSaloonDetail(
        title: title,
        site: site,
        description: description,
        addServices: addServices,
        removeServices: removeServices,
        setAddress: setAddress));
  }

  late final _$_SaloonStoreActionController =
      ActionController(name: '_SaloonStore', context: context);

  @override
  void setSallonDetail(SaloonDetail saloonDetail) {
    final _$actionInfo = _$_SaloonStoreActionController.startAction(
        name: '_SaloonStore.setSallonDetail');
    try {
      return super.setSallonDetail(saloonDetail);
    } finally {
      _$_SaloonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
