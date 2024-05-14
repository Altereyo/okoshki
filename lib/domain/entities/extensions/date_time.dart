extension DateTimeExtension on DateTime {
  bool get isToday =>
      toDay.day == day && toDay.month == month && toDay.year == year;

  bool get isTomorrow =>
      tomorrow.day == day && tomorrow.month == month && tomorrow.year == year;

  bool get isAfterTomorrow =>
      afterTomorrow.day == day &&
      afterTomorrow.month == month &&
      afterTomorrow.year == year;

  DateTime get toDay => DateTime.now();

  DateTime get tomorrow => DateTime.now().add(const Duration(days: 1));

  DateTime get afterTomorrow => DateTime.now().add(const Duration(days: 2));

  //Конечная дата месяца
  DateTime get getlastDateTimeInMonth {
    return DateTime(year, month, _getDaysInMonth);
  }

  //Начальная дата месяца
  DateTime get getStartDateTimeInMonth {
    return DateTime(year, month);
  }

  int get _getDaysInMonth {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const daysInMonth = [31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysInMonth[month - 1];
  }
}
