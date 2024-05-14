import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/domain/entities/extensions/comment.dart';
import 'package:okoshki/domain/state/saloon/comments_store.dart';

part 'comments_customer_controller.g.dart';

// ignore: library_private_types_in_public_api
class CommentsCustomerSaloonController = _CommentsCustomerSaloonController
    with _$CommentsCustomerSaloonController;

abstract class _CommentsCustomerSaloonController with Store {
  _CommentsCustomerSaloonController({
    required CommentsSaloonStore commentsSaloonStore,
  }) : _commentsSaloonStore = commentsSaloonStore;

  final CommentsSaloonStore _commentsSaloonStore;

  List<Comment> get commentsList => _commentsSaloonStore.commentsList;

  bool get isLoading => _commentsSaloonStore.isLoading;

  String get numComments => _commentsSaloonStore.numComments;

   Map<String, List<Comment>> get commentsGroupSort {
    final group = groupBy(commentsList, (val) => val.monthYear);
    return SplayTreeMap<String, List<Comment>>.from(
        group, (keys1, keys2) => keys1.compareTo(keys2));
  }
}
