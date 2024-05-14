// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_networks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SocialNetworksSaloonStore on _SocialNetworksSaloonStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SocialNetworksSaloonStore.isLoading', context: context);

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

  late final _$socialNetworksListAtom = Atom(
      name: '_SocialNetworksSaloonStore.socialNetworksList', context: context);

  @override
  ObservableList<SocialNetwork> get socialNetworksList {
    _$socialNetworksListAtom.reportRead();
    return super.socialNetworksList;
  }

  @override
  set socialNetworksList(ObservableList<SocialNetwork> value) {
    _$socialNetworksListAtom.reportWrite(value, super.socialNetworksList, () {
      super.socialNetworksList = value;
    });
  }

  late final _$_getSocialNetworksListAsyncAction = AsyncAction(
      '_SocialNetworksSaloonStore._getSocialNetworksList',
      context: context);

  @override
  Future<void> _getSocialNetworksList() {
    return _$_getSocialNetworksListAsyncAction
        .run(() => super._getSocialNetworksList());
  }

  late final _$updateSocialNetworkAsyncAction = AsyncAction(
      '_SocialNetworksSaloonStore.updateSocialNetwork',
      context: context);

  @override
  Future<void> updateSocialNetwork(
      {required List<SocialNetwork> editSocialNetworkList}) {
    return _$updateSocialNetworkAsyncAction.run(() => super
        .updateSocialNetwork(editSocialNetworkList: editSocialNetworkList));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
socialNetworksList: ${socialNetworksList}
    ''';
  }
}
