// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_comments_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyCommentsCustomerStore on _MyCommentsCustomerStore, Store {
  Computed<String>? _$counterMyCommentComputed;

  @override
  String get counterMyComment => (_$counterMyCommentComputed ??=
          Computed<String>(() => super.counterMyComment,
              name: '_MyCommentsCustomerStore.counterMyComment'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_MyCommentsCustomerStore.isLoading', context: context);

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

  late final _$myCommentsListAtom =
      Atom(name: '_MyCommentsCustomerStore.myCommentsList', context: context);

  @override
  ObservableList<Comment> get myCommentsList {
    _$myCommentsListAtom.reportRead();
    return super.myCommentsList;
  }

  @override
  set myCommentsList(ObservableList<Comment> value) {
    _$myCommentsListAtom.reportWrite(value, super.myCommentsList, () {
      super.myCommentsList = value;
    });
  }

  late final _$_getBookingListAsyncAction =
      AsyncAction('_MyCommentsCustomerStore._getBookingList', context: context);

  @override
  Future<void> _getBookingList({required int clientId}) {
    return _$_getBookingListAsyncAction
        .run(() => super._getBookingList(clientId: clientId));
  }

  late final _$createCommentAsyncAction =
      AsyncAction('_MyCommentsCustomerStore.createComment', context: context);

  @override
  Future<bool> createComment(
      {required int salonId, required int rating, required String text}) {
    return _$createCommentAsyncAction.run(() =>
        super.createComment(salonId: salonId, rating: rating, text: text));
  }

  late final _$updateCommentAsyncAction =
      AsyncAction('_MyCommentsCustomerStore.updateComment', context: context);

  @override
  Future<bool> updateComment(
      {required int commentId, required String text, required int rating}) {
    return _$updateCommentAsyncAction.run(() =>
        super.updateComment(commentId: commentId, text: text, rating: rating));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
myCommentsList: ${myCommentsList},
counterMyComment: ${counterMyComment}
    ''';
  }
}
