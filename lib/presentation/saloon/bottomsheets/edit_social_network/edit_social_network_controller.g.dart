// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_social_network_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditSocialNetworkController on _EditSocialNetworkController, Store {
  late final _$editSocialNetworkListAtom = Atom(
      name: '_EditSocialNetworkController.editSocialNetworkList',
      context: context);

  @override
  ObservableList<SocialNetwork> get editSocialNetworkList {
    _$editSocialNetworkListAtom.reportRead();
    return super.editSocialNetworkList;
  }

  @override
  set editSocialNetworkList(ObservableList<SocialNetwork> value) {
    _$editSocialNetworkListAtom.reportWrite(value, super.editSocialNetworkList,
        () {
      super.editSocialNetworkList = value;
    });
  }

  @override
  String toString() {
    return '''
editSocialNetworkList: ${editSocialNetworkList}
    ''';
  }
}
