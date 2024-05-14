import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/domain/repository/api/comment_repository.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/internal/utils/logger.dart';

part 'comments_store.g.dart';

// ignore: library_private_types_in_public_api
class CommentsSaloonStore = _CommentsSaloonStore with _$CommentsSaloonStore;

abstract class _CommentsSaloonStore with Store {
  _CommentsSaloonStore({
    required SaloonStore saloonStore,
    required CommentRepository commentRepository,
  })  : _saloonStore = saloonStore,
        _commentRepository = commentRepository;

  final SaloonStore _saloonStore;
  final CommentRepository _commentRepository;

  @observable
  bool isLoading = true;

  @observable
  ObservableList<Comment> commentsList = ObservableList();

  @computed
  String get numComments => commentsList.length.toString();

  Future<void> init() async {
    await asyncWhen((_) => _saloonStore.isLoading == false);
    await _getCommentsList();
    isLoading = false;
  }

  @action
  Future<void> _getCommentsList() async {
    final res = await _commentRepository.getCommentList(
      saloonId: _saloonStore.saloonId,
    );

    if (res.success) {
      commentsList = ObservableList.of(res.data!);
      logger.i(commentsList);
    }
  }
}
