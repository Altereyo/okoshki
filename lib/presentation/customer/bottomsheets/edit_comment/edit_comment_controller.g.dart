// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_comment_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditCommentController on _EditCommentController, Store {
  Computed<bool>? _$isEnabledButtonEditCommentComputed;

  @override
  bool get isEnabledButtonEditComment =>
      (_$isEnabledButtonEditCommentComputed ??= Computed<bool>(
              () => super.isEnabledButtonEditComment,
              name: '_EditCommentController.isEnabledButtonEditComment'))
          .value;

  late final _$ratingAtom =
      Atom(name: '_EditCommentController.rating', context: context);

  @override
  double get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(double value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  late final _$textCommentAtom =
      Atom(name: '_EditCommentController.textComment', context: context);

  @override
  String get textComment {
    _$textCommentAtom.reportRead();
    return super.textComment;
  }

  @override
  set textComment(String value) {
    _$textCommentAtom.reportWrite(value, super.textComment, () {
      super.textComment = value;
    });
  }

  late final _$_EditCommentControllerActionController =
      ActionController(name: '_EditCommentController', context: context);

  @override
  void init() {
    final _$actionInfo = _$_EditCommentControllerActionController.startAction(
        name: '_EditCommentController.init');
    try {
      return super.init();
    } finally {
      _$_EditCommentControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rating: ${rating},
textComment: ${textComment},
isEnabledButtonEditComment: ${isEnabledButtonEditComment}
    ''';
  }
}
