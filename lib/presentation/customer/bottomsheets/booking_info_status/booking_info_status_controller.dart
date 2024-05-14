import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/booking.dart';
import 'package:okoshki/domain/entities/comment.dart';
import 'package:okoshki/domain/state/customer/my_comments_store.dart';

part 'booking_info_status_controller.g.dart';

// ignore: library_private_types_in_public_api
class BookingInfoStatusController = _BookingInfoStatusController
    with _$BookingInfoStatusController;

abstract class _BookingInfoStatusController with Store {
  _BookingInfoStatusController({
    required MyCommentsCustomerStore commentsCustomerStore,
    required Booking booking,
  })  : _commentsCustomerStore = commentsCustomerStore,
        _booking = booking;

  final MyCommentsCustomerStore _commentsCustomerStore;
  final Booking _booking;

  Booking get booking => _booking;
  String get status => _booking.status;
  int get saloonId => _booking.salon.id;

  bool get isCommentFromTheSalon => _commentsCustomerStore.myCommentsList.any(
        (element) => element.salon.id == saloonId,
      );

  Comment? get getCommentFromTheSaloon =>
      _commentsCustomerStore.myCommentsList.firstWhereOrNull(
        (element) => element.salon.id == saloonId,
      );
}
