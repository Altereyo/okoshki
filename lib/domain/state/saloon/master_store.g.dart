// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MasterSaloonStore on _MasterSaloonStore, Store {
  Computed<String>? _$numMastersSaloonComputed;

  @override
  String get numMastersSaloon => (_$numMastersSaloonComputed ??=
          Computed<String>(() => super.numMastersSaloon,
              name: '_MasterSaloonStore.numMastersSaloon'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_MasterSaloonStore.isLoading', context: context);

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

  late final _$saloonMastersListAtom =
      Atom(name: '_MasterSaloonStore.saloonMastersList', context: context);

  @override
  ObservableList<SaloonMaster> get saloonMastersList {
    _$saloonMastersListAtom.reportRead();
    return super.saloonMastersList;
  }

  @override
  set saloonMastersList(ObservableList<SaloonMaster> value) {
    _$saloonMastersListAtom.reportWrite(value, super.saloonMastersList, () {
      super.saloonMastersList = value;
    });
  }

  late final _$updateMasterInListMastersAsyncAction = AsyncAction(
      '_MasterSaloonStore.updateMasterInListMasters',
      context: context);

  @override
  Future<void> updateMasterInListMasters({required int masterId}) {
    return _$updateMasterInListMastersAsyncAction
        .run(() => super.updateMasterInListMasters(masterId: masterId));
  }

  late final _$deleteMasterAsyncAction =
      AsyncAction('_MasterSaloonStore.deleteMaster', context: context);

  @override
  Future<void> deleteMaster({required int masterId}) {
    return _$deleteMasterAsyncAction
        .run(() => super.deleteMaster(masterId: masterId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
saloonMastersList: ${saloonMastersList},
numMastersSaloon: ${numMastersSaloon}
    ''';
  }
}
