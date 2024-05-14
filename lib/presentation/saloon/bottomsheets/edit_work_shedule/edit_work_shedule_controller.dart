import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_schedule.dart';
import 'package:okoshki/domain/entities/extensions/saloon_schedule.dart';
import 'package:okoshki/domain/state/saloon/shedule_store.dart';

part 'edit_work_shedule_controller.g.dart';

// ignore: library_private_types_in_public_api
class EditWorkSheduleController = _EditWorkSheduleController
    with _$EditWorkSheduleController;

abstract class _EditWorkSheduleController with Store {
  _EditWorkSheduleController({
    required SheduleSaloonStore sheduleSaloonStore,
  }) : _sheduleSaloonStore = sheduleSaloonStore;

  final SheduleSaloonStore _sheduleSaloonStore;

  Future<void> init() async {
    //Создание копии листа расписания
    for (var element in _sheduleSaloonStore.saloonSheduleList) {
      editSheduleList.add(element.copyWith());
    }
  }
  //Редактируемое расписание
  @observable
  ObservableList<SaloonSchedule> editSheduleList = ObservableList();

  Future<void> updateShedule() async {
    for (var editShedule in editSheduleList) {
      //Если редактируемого экземпляра нет то обновить данные
      final res = _sheduleSaloonStore.saloonSheduleList.where((element) =>
          element.id == editShedule.id &&
          element.startTime == editShedule.startTime &&
          element.endTime == editShedule.endTime &&
          element.weekend == editShedule.weekend);

      if (res.isEmpty) {
        _sheduleSaloonStore.updateSheduleSaloon(editShedule);
      }
    }
  }
}
