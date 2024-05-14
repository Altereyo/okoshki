import 'dart:core';

import 'package:intl/intl.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';

extension SaloonScheduleExtension on SaloonSchedule {
  SaloonSchedule copyWith({
    String? startTime,
    String? endTime,
    bool? weekend,
  }) =>
      SaloonSchedule(
        id: id,
        weekDay: weekDay,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        weekend: weekend ?? this.weekend,
      );

  DateTime get startDateTime => DateFormat.Hm().parse(startTime);

  DateTime get endDateTime => DateFormat.Hm().parse(endTime);

  set startDateTime(DateTime dateTime) =>
      startTime = DateFormat.Hm().format(dateTime);

  set endDateTime(DateTime dateTime) =>
      endTime = DateFormat.Hm().format(dateTime);

  String get timeStartEnd =>
      '${DateFormat.Hm().format(startDateTime)} - ${DateFormat.Hm().format(endDateTime)}';

  String get startHour => DateFormat('HH').format(startDateTime);

  String get startMinute => DateFormat('mm').format(startDateTime);

  String get endHour => DateFormat('HH').format(endDateTime);

  String get endMinute => DateFormat('mm').format(endDateTime);

  String get getDayOfTheWeek => switch (weekDay) {
        1 => 'Понедельник',
        2 => 'Вторник',
        3 => 'Среда',
        4 => 'Четверг',
        5 => 'Пятница',
        6 => 'Суббота',
        7 => 'Воскресенье',
        _ => "null"
      };

  String get getDayOfTheWeekAbbreviation => switch (weekDay) {
        1 => 'Пн',
        2 => 'Вт',
        3 => 'Ср',
        4 => 'Чт',
        5 => 'Пт',
        6 => 'Сб',
        7 => 'Вс',
        _ => "null"
      };
}
