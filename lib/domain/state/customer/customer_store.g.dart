// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerStore on _CustomerStore, Store {
  Computed<String>? _$nameCityComputed;

  @override
  String get nameCity =>
      (_$nameCityComputed ??= Computed<String>(() => super.nameCity,
              name: '_CustomerStore.nameCity'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_CustomerStore.isLoading', context: context);

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

  late final _$userProfileAtom =
      Atom(name: '_CustomerStore.userProfile', context: context);

  @override
  UserProfile? get userProfile {
    _$userProfileAtom.reportRead();
    return super.userProfile;
  }

  @override
  set userProfile(UserProfile? value) {
    _$userProfileAtom.reportWrite(value, super.userProfile, () {
      super.userProfile = value;
    });
  }

  late final _$citiesListAtom =
      Atom(name: '_CustomerStore.citiesList', context: context);

  @override
  List<City> get citiesList {
    _$citiesListAtom.reportRead();
    return super.citiesList;
  }

  @override
  set citiesList(List<City> value) {
    _$citiesListAtom.reportWrite(value, super.citiesList, () {
      super.citiesList = value;
    });
  }

  late final _$updateUserProfileAsyncAction =
      AsyncAction('_CustomerStore.updateUserProfile', context: context);

  @override
  Future<void> updateUserProfile({String? userName, int? targetCity}) {
    return _$updateUserProfileAsyncAction.run(() =>
        super.updateUserProfile(userName: userName, targetCity: targetCity));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
userProfile: ${userProfile},
citiesList: ${citiesList},
nameCity: ${nameCity}
    ''';
  }
}
