// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommentsSaloonStore on _CommentsSaloonStore, Store {
  Computed<String>? _$numCommentsComputed;

  @override
  String get numComments =>
      (_$numCommentsComputed ??= Computed<String>(() => super.numComments,
              name: '_CommentsSaloonStore.numComments'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_CommentsSaloonStore.isLoading', context: context);

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

  late final _$commentsListAtom =
      Atom(name: '_CommentsSaloonStore.commentsList', context: context);

  @override
  ObservableList<Comment> get commentsList {
    _$commentsListAtom.reportRead();
    return super.commentsList;
  }

  @override
  set commentsList(ObservableList<Comment> value) {
    _$commentsListAtom.reportWrite(value, super.commentsList, () {
      super.commentsList = value;
    });
  }

  late final _$_getCommentsListAsyncAction =
      AsyncAction('_CommentsSaloonStore._getCommentsList', context: context);

  @override
  Future<void> _getCommentsList() {
    return _$_getCommentsListAsyncAction.run(() => super._getCommentsList());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
commentsList: ${commentsList},
numComments: ${numComments}
    ''';
  }
}
