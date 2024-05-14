// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IntroCustomerController on _IntroCustomerController, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_IntroCustomerController.isLoading'))
          .value;

  late final _$indexPageAtom =
      Atom(name: '_IntroCustomerController.indexPage', context: context);

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

  late final _$_IntroCustomerControllerActionController =
      ActionController(name: '_IntroCustomerController', context: context);

  @override
  void setIndex(int index) {
    final _$actionInfo = _$_IntroCustomerControllerActionController.startAction(
        name: '_IntroCustomerController.setIndex');
    try {
      return super.setIndex(index);
    } finally {
      _$_IntroCustomerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexPage: ${indexPage},
isLoading: ${isLoading}
    ''';
  }
}
