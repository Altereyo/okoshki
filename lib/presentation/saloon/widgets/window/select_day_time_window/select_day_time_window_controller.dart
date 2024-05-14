import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/date_time.dart';

part 'select_day_time_window_controller.g.dart';

// ignore: library_private_types_in_public_api
class SelectDayTimeWindowController = _SelectDayTimeWindowController
    with _$SelectDayTimeWindowController;

abstract class _SelectDayTimeWindowController with Store {
  final DateTime _curentDateTime = DateTime.now();

  @observable
  int? selectDayButton;

  @observable
  DateTime startDateTime = DateTime.now();

  @observable
  DateTime endDateTime = DateTime.now();

  @observable
  String startHour = '';

  @observable
  String startMinute = '';

  @observable
  String endHour = '';

  @observable
  String endMinute = '';

  void init() {
    _reactionController();
  }

  void _reactionController() {
    autorun(
      (p0) {
        switch (selectDayButton) {
          case 0:
            {
              startDateTime = startDateTime.copyWith(
                day: _curentDateTime.toDay.day,
              );
              endDateTime = endDateTime.copyWith(
                day: _curentDateTime.toDay.day,
              );
            }
          case 1:
            {
              startDateTime = startDateTime.copyWith(
                day: _curentDateTime.tomorrow.day,
              );
              endDateTime = endDateTime.copyWith(
                day: _curentDateTime.tomorrow.day,
              );
            }
          case 2:
            {
              startDateTime = startDateTime.copyWith(
                day: _curentDateTime.afterTomorrow.day,
              );
              endDateTime = endDateTime.copyWith(
                day: _curentDateTime.afterTomorrow.day,
              );
            }
        }
      },
    );
    reaction(
      (_) => startHour,
      (hour) => startDateTime = startDateTime.copyWith(
        hour: int.tryParse(hour),
      ),
    );
    reaction(
      (_) => startMinute,
      (minute) => startDateTime = startDateTime.copyWith(
        minute: int.tryParse(minute),
      ),
    );
    reaction(
      (_) => endHour,
      (hour) => endDateTime = endDateTime.copyWith(
        hour: int.tryParse(hour),
      ),
    );
    reaction(
      (_) => endMinute,
      (minute) => endDateTime = endDateTime.copyWith(
        minute: int.tryParse(minute),
      ),
    );
  }

 
}
