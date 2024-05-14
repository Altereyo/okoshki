import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/state/customer/my_bookings_store.dart';

part 'filters_my_booking_controller.g.dart';

// ignore: library_private_types_in_public_api
class FiltersMyBookingController = _FiltersMyBookingController
    with _$FiltersMyBookingController;

abstract class _FiltersMyBookingController with Store {
  _FiltersMyBookingController({
    required MyBookingsCustomerStore myBookingsCustomerStore,
  }) : _myBookingsCustomerStore = myBookingsCustomerStore;

  final MyBookingsCustomerStore _myBookingsCustomerStore;

  late GroupButtonController buttonDateController;

  void init() {
    buttonDateController = GroupButtonController(
      selectedIndex: dateButton,
    );
  }
  @observable
  bool isNotReview = false;

  @observable
  int dateButton = 0;

  (String?, String?) get dateFilters {
    final currentDateTime = DateTime.now();
    //с начала месяца
    final startMonthCurrentDateTime = DateTime(
      currentDateTime.year,
      currentDateTime.month,
      1,
    );
    //Последние 3 месяца
    final lastThreeMonth = DateTime(
      currentDateTime.year,
      currentDateTime.month -2,
      1,
    );
    //Последние 6 месяца
    final lastSixMonth = DateTime(
      currentDateTime.year,
      currentDateTime.month -5,
      1,
    );
    return switch (dateButton) {
      0 => (null, null),
      1 => (
          DateFormat.yMd().format(startMonthCurrentDateTime),
          DateFormat.yMd().format(currentDateTime)
        ),
      2 => (
          DateFormat.yMd().format(lastThreeMonth),
          DateFormat.yMd().format(currentDateTime)
        ),
      3 => (
          DateFormat.yMd().format(lastSixMonth),
          DateFormat.yMd().format(currentDateTime)
        ),
      _ => (null, null),
    };
  }

  //отображение кнопки сбросить фильтр
  @computed
  bool get isResetButton => (dateButton != 0);

  //сброс фильтра
  @action
  void onTapResetFilters() {
    dateButton = 0;
    buttonDateController.selectIndex(0);
    _myBookingsCustomerStore.isFilters = false;
  }

  //применить фильтр
  Future<void> applyFilters() async {
    _myBookingsCustomerStore.isFilters = true;

    await _myBookingsCustomerStore.getBookingList(
      from: dateFilters.$1,
      to: dateFilters.$2,
    );
  }
}
