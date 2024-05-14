import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/state/customer/my_comments_store.dart';

part 'create_comment_controller.g.dart';

// ignore: library_private_types_in_public_api
class CreateCommentController = _CreateCommentController
    with _$CreateCommentController;

abstract class _CreateCommentController with Store {
  _CreateCommentController({
    required MyCommentsCustomerStore myCommentsCustomerStore,
    required int saloonId,
  })  : _myCommentsCustomerStore = myCommentsCustomerStore,
        _saloonId = saloonId;
  final int _saloonId;
  final MyCommentsCustomerStore _myCommentsCustomerStore;

  @observable
  double rating = 0.0;

  @observable
  String textComment = '';

  @computed
  bool get isEnabledButtonCreateComment => textComment.isNotEmpty;

  Future<bool> createComment() async {
    return await _myCommentsCustomerStore.createComment(
      salonId: _saloonId,
      rating: rating.toInt(),
      text: textComment,
    );
  }
}
