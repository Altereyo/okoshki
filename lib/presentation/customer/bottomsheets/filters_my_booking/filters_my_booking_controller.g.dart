// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_my_booking_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FiltersMyBookingController on _FiltersMyBookingController, Store {
  Computed<bool>? _$isResetButtonComputed;

  @override
  bool get isResetButton =>
      (_$isResetButtonComputed ??= Computed<bool>(() => super.isResetButton,
              name: '_FiltersMyBookingController.isResetButton'))
          .value;

  late final _$isNotReviewAtom =
      Atom(name: '_FiltersMyBookingController.isNotReview', context: context);

  @override
  bool get isNotReview {
    _$isNotReviewAtom.reportRead();
    return super.isNotReview;
  }

  @override
  set isNotReview(bool value) {
    _$isNotReviewAtom.reportWrite(value, super.isNotReview, () {
      super.isNotReview = value;
    });
  }

  late final _$dateButtonAtom =
      Atom(name: '_FiltersMyBookingController.dateButton', context: context);

  @override
  int get dateButton {
    _$dateButtonAtom.reportRead();
    return super.dateButton;
  }

  @override
  set dateButton(int value) {
    _$dateButtonAtom.reportWrite(value, super.dateButton, () {
      super.dateButton = value;
    });
  }

  late final _$_FiltersMyBookingControllerActionController =
      ActionController(name: '_FiltersMyBookingController', context: context);

  @override
  void onTapResetFilters() {
    final _$actionInfo = _$_FiltersMyBookingControllerActionController
        .startAction(name: '_FiltersMyBookingController.onTapResetFilters');
    try {
      return super.onTapResetFilters();
    } finally {
      _$_FiltersMyBookingControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isNotReview: ${isNotReview},
dateButton: ${dateButton},
isResetButton: ${isResetButton}
    ''';
  }
}
