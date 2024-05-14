import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/user_profile.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/domain/state/customer/auth_store.dart';
import 'package:okoshki/domain/state/customer/customer_store.dart';
import 'package:okoshki/domain/state/customer/favorite_saloons_store.dart';
import 'package:okoshki/domain/state/customer/my_bookings_store.dart';
import 'package:okoshki/domain/state/customer/my_comments_store.dart';

part 'profile_controller.g.dart';

// ignore: library_private_types_in_public_api
class ProfileCustomerController = _ProfileCustomerController
    with _$ProfileCustomerController;

abstract class _ProfileCustomerController with Store {
  _ProfileCustomerController({
    required LocalDataRepository localDataRepository,
    required CustomerStore customerStore,
    required AuthCustomerStore authCustomerStore,
    required MyBookingsCustomerStore myBookingsCustomerStore,
    required FavoriteSaloonsCustomerStore favoriteSaloonsCustomerStore,
    required MyCommentsCustomerStore myCommentCustomerStore,
  })  : _localDataRepository = localDataRepository,
        _customerStore = customerStore,
        _authCustomerStore = authCustomerStore,
        _myBookingsCustomerStore = myBookingsCustomerStore,
        _favoriteSaloonsCustomerStore = favoriteSaloonsCustomerStore,
        _myCommentCustomerStore = myCommentCustomerStore;

  final LocalDataRepository _localDataRepository;
  final CustomerStore _customerStore;
  final AuthCustomerStore _authCustomerStore;
  final MyBookingsCustomerStore _myBookingsCustomerStore;
  final FavoriteSaloonsCustomerStore _favoriteSaloonsCustomerStore;
  final MyCommentsCustomerStore _myCommentCustomerStore;

  @computed
  bool get isLoading => _customerStore.isLoading;

  UserProfile get userProfile => _customerStore.userProfile!;

  String get counterFavoriteSaloons =>
      _favoriteSaloonsCustomerStore.counterFavoriteSaloons;

  String get counterMyBooking => _myBookingsCustomerStore.counterMyBooking;

  String get counterMyComment => _myCommentCustomerStore.counterMyComment;

  String get nameCity => _customerStore.nameCity;

  bool get isAuthorized => _localDataRepository.getToken() != null;

  Future<void> logoutCustomer() async {
    await _authCustomerStore.logout();
  }
}
