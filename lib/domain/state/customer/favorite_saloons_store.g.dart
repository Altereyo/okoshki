// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_saloons_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteSaloonsCustomerStore on _FavoriteSaloonsCustomerStore, Store {
  Computed<String>? _$counterFavoriteSaloonsComputed;

  @override
  String get counterFavoriteSaloons => (_$counterFavoriteSaloonsComputed ??=
          Computed<String>(() => super.counterFavoriteSaloons,
              name: '_FavoriteSaloonsCustomerStore.counterFavoriteSaloons'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_FavoriteSaloonsCustomerStore.isLoading', context: context);

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

  late final _$favoriteSaloonsListAtom = Atom(
      name: '_FavoriteSaloonsCustomerStore.favoriteSaloonsList',
      context: context);

  @override
  ObservableList<Saloon> get favoriteSaloonsList {
    _$favoriteSaloonsListAtom.reportRead();
    return super.favoriteSaloonsList;
  }

  @override
  set favoriteSaloonsList(ObservableList<Saloon> value) {
    _$favoriteSaloonsListAtom.reportWrite(value, super.favoriteSaloonsList, () {
      super.favoriteSaloonsList = value;
    });
  }

  late final _$_getFavoriteSaloonsListAsyncAction = AsyncAction(
      '_FavoriteSaloonsCustomerStore._getFavoriteSaloonsList',
      context: context);

  @override
  Future<void> _getFavoriteSaloonsList() {
    return _$_getFavoriteSaloonsListAsyncAction
        .run(() => super._getFavoriteSaloonsList());
  }

  late final _$updateFavoriteSaloonAsyncAction = AsyncAction(
      '_FavoriteSaloonsCustomerStore.updateFavoriteSaloon',
      context: context);

  @override
  Future<void> updateFavoriteSaloon({int? favoriteSalonId}) {
    return _$updateFavoriteSaloonAsyncAction.run(
        () => super.updateFavoriteSaloon(favoriteSalonId: favoriteSalonId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
favoriteSaloonsList: ${favoriteSaloonsList},
counterFavoriteSaloons: ${counterFavoriteSaloons}
    ''';
  }
}
