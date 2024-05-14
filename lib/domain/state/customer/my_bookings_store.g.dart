// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_bookings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyBookingsCustomerStore on _MyBookingsCustomerStore, Store {
  Computed<String>? _$counterMyBookingComputed;

  @override
  String get counterMyBooking => (_$counterMyBookingComputed ??=
          Computed<String>(() => super.counterMyBooking,
              name: '_MyBookingsCustomerStore.counterMyBooking'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_MyBookingsCustomerStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isFiltersAtom =
      Atom(name: '_MyBookingsCustomerStore.isFilters', context: context);

  @override
  bool get isFilters {
    _$isFiltersAtom.reportRead();
    return super.isFilters;
  }

  @override
  set isFilters(bool value) {
    _$isFiltersAtom.reportWrite(value, super.isFilters, () {
      super.isFilters = value;
    });
  }

  late final _$myBookingsListAtom =
      Atom(name: '_MyBookingsCustomerStore.myBookingsList', context: context);

  @override
  ObservableList<Booking> get myBookingsList {
    _$myBookingsListAtom.reportRead();
    return super.myBookingsList;
  }

  @override
  set myBookingsList(ObservableList<Booking> value) {
    _$myBookingsListAtom.reportWrite(value, super.myBookingsList, () {
      super.myBookingsList = value;
    });
  }

  late final _$getBookingListAsyncAction =
      AsyncAction('_MyBookingsCustomerStore.getBookingList', context: context);

  @override
  Future<void> getBookingList({String? from, String? to}) {
    return _$getBookingListAsyncAction
        .run(() => super.getBookingList(from: from, to: to));
  }

  late final _$createBookingAsyncAction =
      AsyncAction('_MyBookingsCustomerStore.createBooking', context: context);

  @override
  Future<Booking> createBooking(
      {required int windowId, required int windowServiceId}) {
    return _$createBookingAsyncAction.run(() => super
        .createBooking(windowId: windowId, windowServiceId: windowServiceId));
  }

  late final _$updateBookingStatusCancelledAsyncAction = AsyncAction(
      '_MyBookingsCustomerStore.updateBookingStatusCancelled',
      context: context);

  @override
  Future<bool> updateBookingStatusCancelled({required int bookingId}) {
    return _$updateBookingStatusCancelledAsyncAction
        .run(() => super.updateBookingStatusCancelled(bookingId: bookingId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isFilters: ${isFilters},
myBookingsList: ${myBookingsList},
counterMyBooking: ${counterMyBooking}
    ''';
  }
}
