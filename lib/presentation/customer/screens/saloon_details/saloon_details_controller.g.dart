// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saloon_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SaloonDetailsCustomerController
    on _SaloonDetailsCustomerController, Store {
  late final _$itemCountCommentAtom = Atom(
      name: '_SaloonDetailsCustomerController.itemCountComment',
      context: context);

  @override
  int get itemCountComment {
    _$itemCountCommentAtom.reportRead();
    return super.itemCountComment;
  }

  @override
  set itemCountComment(int value) {
    _$itemCountCommentAtom.reportWrite(value, super.itemCountComment, () {
      super.itemCountComment = value;
    });
  }

  late final _$_SaloonDetailsCustomerControllerActionController =
      ActionController(
          name: '_SaloonDetailsCustomerController', context: context);

  @override
  void initItemCountComment() {
    final _$actionInfo =
        _$_SaloonDetailsCustomerControllerActionController.startAction(
            name: '_SaloonDetailsCustomerController.initItemCountComment');
    try {
      return super.initItemCountComment();
    } finally {
      _$_SaloonDetailsCustomerControllerActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setItemCountComment() {
    final _$actionInfo =
        _$_SaloonDetailsCustomerControllerActionController.startAction(
            name: '_SaloonDetailsCustomerController.setItemCountComment');
    try {
      return super.setItemCountComment();
    } finally {
      _$_SaloonDetailsCustomerControllerActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemCountComment: ${itemCountComment}
    ''';
  }
}
