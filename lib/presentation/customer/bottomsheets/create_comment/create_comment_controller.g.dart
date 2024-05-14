// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_comment_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateCommentController on _CreateCommentController, Store {
  Computed<bool>? _$isEnabledButtonCreateCommentComputed;

  @override
  bool get isEnabledButtonCreateComment =>
      (_$isEnabledButtonCreateCommentComputed ??= Computed<bool>(
              () => super.isEnabledButtonCreateComment,
              name: '_CreateCommentController.isEnabledButtonCreateComment'))
          .value;

  late final _$ratingAtom =
      Atom(name: '_CreateCommentController.rating', context: context);

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
      Atom(name: '_CreateCommentController.textComment', context: context);

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

  @override
  String toString() {
    return '''
rating: ${rating},
textComment: ${textComment},
isEnabledButtonCreateComment: ${isEnabledButtonCreateComment}
    ''';
  }
}
