import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/domain/entities/extensions/comment.dart';
import 'package:okoshki/domain/state/customer/my_comments_store.dart';

part 'edit_comment_controller.g.dart';

// ignore: library_private_types_in_public_api
class EditCommentController = _EditCommentController
    with _$EditCommentController;

abstract class _EditCommentController with Store {
  _EditCommentController({
    required MyCommentsCustomerStore myCommentsCustomerStore,
    required Comment comment,
  })  : _myCommentsCustomerStore = myCommentsCustomerStore,
        _comment = comment;
  final Comment _comment;
  final MyCommentsCustomerStore _myCommentsCustomerStore;

  @action
  void init() {
    rating = _comment.rating.toDouble();
    textComment = _comment.createUpdateText;
  }

  @observable
  double rating = 0.0;

  @observable
  String textComment = '';

  @computed
  bool get isEnabledButtonEditComment =>
      textComment.isNotEmpty && textComment != _comment.createUpdateText || rating!= _comment.rating.toDouble();

  Future<bool> editComment() async {
    return await _myCommentsCustomerStore.updateComment(
      commentId: _comment.id,
      text: textComment,
      rating: rating.toInt(),
    );
  }
}
