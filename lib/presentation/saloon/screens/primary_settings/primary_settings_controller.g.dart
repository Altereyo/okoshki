// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PrimarySettingsSaloonController
    on _PrimarySettingsSaloonController, Store {
  Computed<bool>? _$enabledButtonNextPageTwoComputed;

  @override
  bool get enabledButtonNextPageTwo => (_$enabledButtonNextPageTwoComputed ??=
          Computed<bool>(() => super.enabledButtonNextPageTwo,
              name:
                  '_PrimarySettingsSaloonController.enabledButtonNextPageTwo'))
      .value;
  Computed<bool>? _$enabledButtonNextPageFourComputed;

  @override
  bool get enabledButtonNextPageFour => (_$enabledButtonNextPageFourComputed ??=
          Computed<bool>(() => super.enabledButtonNextPageFour,
              name:
                  '_PrimarySettingsSaloonController.enabledButtonNextPageFour'))
      .value;
  Computed<bool>? _$enabledButtonNextPageFiveComputed;

  @override
  bool get enabledButtonNextPageFive => (_$enabledButtonNextPageFiveComputed ??=
          Computed<bool>(() => super.enabledButtonNextPageFive,
              name:
                  '_PrimarySettingsSaloonController.enabledButtonNextPageFive'))
      .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_PrimarySettingsSaloonController.isLoading'))
          .value;

  late final _$indexPageAtom = Atom(
      name: '_PrimarySettingsSaloonController.indexPage', context: context);

  @override
  int get indexPage {
    _$indexPageAtom.reportRead();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.reportWrite(value, super.indexPage, () {
      super.indexPage = value;
    });
  }

  late final _$_PrimarySettingsSaloonControllerActionController =
      ActionController(
          name: '_PrimarySettingsSaloonController', context: context);

  @override
  void setIndex(int index) {
    final _$actionInfo = _$_PrimarySettingsSaloonControllerActionController
        .startAction(name: '_PrimarySettingsSaloonController.setIndex');
    try {
      return super.setIndex(index);
    } finally {
      _$_PrimarySettingsSaloonControllerActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexPage: ${indexPage},
enabledButtonNextPageTwo: ${enabledButtonNextPageTwo},
enabledButtonNextPageFour: ${enabledButtonNextPageFour},
enabledButtonNextPageFive: ${enabledButtonNextPageFive},
isLoading: ${isLoading}
    ''';
  }
}
