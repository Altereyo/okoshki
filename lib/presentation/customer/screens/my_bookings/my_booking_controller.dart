import 'dart:collection';
import 'package:collection/collection.dart';

import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/booking.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/state/customer/my_bookings_store.dart';


part 'my_booking_controller.g.dart';

// ignore: library_private_types_in_public_api
class MyBookingsCustomerController = _MyBookingsCustomerController with _$MyBookingsCustomerController;

abstract class _MyBookingsCustomerController with Store {
  _MyBookingsCustomerController({
    required MyBookingsCustomerStore myBookingsCustomerStore,
  }) : _myBookingsCustomerStore = myBookingsCustomerStore;

  final MyBookingsCustomerStore _myBookingsCustomerStore;

  @computed
  bool get isLoading => _myBookingsCustomerStore.isLoading;

  bool get isFilters => _myBookingsCustomerStore.isFilters;

  List<Booking> get myBookingsList => _myBookingsCustomerStore.myBookingsList;

  Map<String, List<Booking>> get bookingGroupSort {
    final group = groupBy(myBookingsList, (val) => val.window.monthYear);
    return SplayTreeMap<String, List<Booking>>.from(
        group, (keys1, keys2) => keys1.compareTo(keys2));
  }
}
