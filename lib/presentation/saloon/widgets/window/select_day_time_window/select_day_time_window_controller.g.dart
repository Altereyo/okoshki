// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_day_time_window_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectDayTimeWindowController on _SelectDayTimeWindowController, Store {
  late final _$selectDayButtonAtom = Atom(
      name: '_SelectDayTimeWindowController.selectDayButton', context: context);

  @override
  int? get selectDayButton {
    _$selectDayButtonAtom.reportRead();
    return super.selectDayButton;
  }

  @override
  set selectDayButton(int? value) {
    _$selectDayButtonAtom.reportWrite(value, super.selectDayButton, () {
      super.selectDayButton = value;
    });
  }

  late final _$startDateTimeAtom = Atom(
      name: '_SelectDayTimeWindowController.startDateTime', context: context);

  @override
  DateTime get startDateTime {
    _$startDateTimeAtom.reportRead();
    return super.startDateTime;
  }

  @override
  set startDateTime(DateTime value) {
    _$startDateTimeAtom.reportWrite(value, super.startDateTime, () {
      super.startDateTime = value;
    });
  }

  late final _$endDateTimeAtom = Atom(
      name: '_SelectDayTimeWindowController.endDateTime', context: context);

  @override
  DateTime get endDateTime {
    _$endDateTimeAtom.reportRead();
    return super.endDateTime;
  }

  @override
  set endDateTime(DateTime value) {
    _$endDateTimeAtom.reportWrite(value, super.endDateTime, () {
      super.endDateTime = value;
    });
  }

  late final _$startHourAtom =
      Atom(name: '_SelectDayTimeWindowController.startHour', context: context);

  @override
  String get startHour {
    _$startHourAtom.reportRead();
    return super.startHour;
  }

  @override
  set startHour(String value) {
    _$startHourAtom.reportWrite(value, super.startHour, () {
      super.startHour = value;
    });
  }

  late final _$startMinuteAtom = Atom(
      name: '_SelectDayTimeWindowController.startMinute', context: context);

  @override
  String get startMinute {
    _$startMinuteAtom.reportRead();
    return super.startMinute;
  }

  @override
  set startMinute(String value) {
    _$startMinuteAtom.reportWrite(value, super.startMinute, () {
      super.startMinute = value;
    });
  }

  late final _$endHourAtom =
      Atom(name: '_SelectDayTimeWindowController.endHour', context: context);

  @override
  String get endHour {
    _$endHourAtom.reportRead();
    return super.endHour;
  }

  @override
  set endHour(String value) {
    _$endHourAtom.reportWrite(value, super.endHour, () {
      super.endHour = value;
    });
  }

  late final _$endMinuteAtom =
      Atom(name: '_SelectDayTimeWindowController.endMinute', context: context);

  @override
  String get endMinute {
    _$endMinuteAtom.reportRead();
    return super.endMinute;
  }

  @override
  set endMinute(String value) {
    _$endMinuteAtom.reportWrite(value, super.endMinute, () {
      super.endMinute = value;
    });
  }

  @override
  String toString() {
    return '''
selectDayButton: ${selectDayButton},
startDateTime: ${startDateTime},
endDateTime: ${endDateTime},
startHour: ${startHour},
startMinute: ${startMinute},
endHour: ${endHour},
endMinute: ${endMinute}
    ''';
  }
}
