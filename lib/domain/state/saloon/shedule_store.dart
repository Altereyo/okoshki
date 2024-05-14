import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';
import 'package:okoshki/domain/repository/api/saloon_schedule_repository.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/domain/entities/extensions/saloon_schedule.dart';

part 'shedule_store.g.dart';

// ignore: library_private_types_in_public_api
class SheduleSaloonStore = _SheduleSaloonStore with _$SheduleSaloonStore;

abstract class _SheduleSaloonStore with Store {
  _SheduleSaloonStore({
    required SaloonScheduleRepository saloonScheduleRepository,
    required SaloonStore saloonStore,
  })  : _saloonScheduleRepository = saloonScheduleRepository,
        _saloonStore = saloonStore;
        
  final SaloonScheduleRepository _saloonScheduleRepository;
  final SaloonStore _saloonStore;

  Future<void> init() async {
    await asyncWhen((_) => _saloonStore.isLoading == false);
    await _getsaloonSheduleList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  @observable
  ObservableList<SaloonSchedule> saloonSheduleList = ObservableList();

  Future<void> _getsaloonSheduleList() async {
    final res = await _saloonScheduleRepository.getSaloonScheduleList(
        saloonId: _saloonStore.saloonId);

    if (res.success) {
      saloonSheduleList.addAll(res.data!);
    }
  }

  @action
  Future<void> updateSheduleSaloon(SaloonSchedule shedule) async {
    final res = await _saloonScheduleRepository.updateSaloonSchedule(
      sheduleId: shedule.id,
      startTime: shedule.startDateTime,
      endTime: shedule.endDateTime,
      weekend: shedule.weekend,
    );

    if (res.success) {
      //update in list
      final index = saloonSheduleList.indexWhere(
        (element) => element.id == res.data!.id,
      );
      saloonSheduleList[index] = res.data!;
    }
  }
}
