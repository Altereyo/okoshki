import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/domain/state/customer/my_comments_store.dart';

part 'my_comments_controller.g.dart';

// ignore: library_private_types_in_public_api
class MyCommentsCustomerController = _MyCommentsCustomerController with _$MyCommentsCustomerController;

abstract class _MyCommentsCustomerController with Store {
  _MyCommentsCustomerController({
    required MyCommentsCustomerStore myCommentsCustomerStore,
  }) : _myCommentsCustomerStore = myCommentsCustomerStore;

  final MyCommentsCustomerStore _myCommentsCustomerStore;

  @computed
  bool get isLoading => _myCommentsCustomerStore.isLoading;

  List<Comment> get myCommentsList => _myCommentsCustomerStore.myCommentsList;
}
