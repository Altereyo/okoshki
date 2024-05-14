import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/domain/repository/api/comment_repository.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/domain/state/customer/customer_store.dart';
import 'package:okoshki/internal/utils/logger.dart';

part 'my_comments_store.g.dart';

// ignore: library_private_types_in_public_api
class MyCommentsCustomerStore = _MyCommentsCustomerStore
    with _$MyCommentsCustomerStore;

abstract class _MyCommentsCustomerStore with Store {
  _MyCommentsCustomerStore({
    required CommentRepository commentRepository,
    required LocalDataRepository localDataRepository,
    required CustomerStore customerStore,
  })  : _commentRepository = commentRepository,
        _localDataRepository = localDataRepository,
        _customerStore = customerStore;

  final CommentRepository _commentRepository;
  final LocalDataRepository _localDataRepository;
  final CustomerStore _customerStore;

  Future<void> init() async {
    if (_localDataRepository.getToken() != null) {
      await asyncWhen((_) => _customerStore.isLoading == false);
      await _getBookingList(clientId: _customerStore.userProfile!.id);
    }
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  @observable
  ObservableList<Comment> myCommentsList = ObservableList();

  @computed
  String get counterMyComment => myCommentsList.length.toString();

  @action
  Future<void> _getBookingList({
    required int clientId,
  }) async {
    final res = await _commentRepository.getCommentList(
      clientId: clientId,
    );
    if (res.success) {
      myCommentsList = ObservableList.of(res.data!);
    }
    logger.i(myCommentsList);
  }

  @action
  Future<bool> createComment({
    required int salonId,
    required int rating,
    required String text,
  }) async {
    final res = await _commentRepository.createComment(
      salonId: salonId,
      rating: rating,
      text: text,
    );

    if (res.success) {
      myCommentsList.insert(0, res.data!);
    }
    return res.success;
  }

  @action
  Future<bool> updateComment({
  required int commentId,
  required String text,
  required int rating,
}) async {
    final res = await _commentRepository.updateComment(
      commentId: commentId,
      text: text,
      rating: rating,
    );
    if(res.success){
      final index = myCommentsList.indexWhere(
        (element) => element.id == res.data!.id,
      );
      myCommentsList[index] = res.data!;
    }
     return res.success;
  }
}
