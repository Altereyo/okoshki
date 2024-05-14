import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/window_service.dart';

part 'select_window_service_controller.g.dart';

// ignore: library_private_types_in_public_api
class SelectWindowServiceController = _SelectWindowServiceController
    with _$SelectWindowServiceController;

abstract class _SelectWindowServiceController with Store {
  @observable
  ObservableList<List<WindowService>> windowServices = ObservableList();

  //Для редактирования окошка
  @observable
  ObservableList<List<WindowService>> deleteWindowService = ObservableList();

  @observable
  ObservableList<List<WindowService>> createWindowService = ObservableList();

  @observable
  ObservableList<List<WindowService>> updateWindowService = ObservableList();

  //Соединяет в один лист
  List<WindowService> get windowServicesList {
    final List<WindowService> list = [];
    for (var element in windowServices) {
      list.addAll(element);
    }
    return list;
  }

  List<WindowService> get deleteWindowServicesList {
    final List<WindowService> list = [];
    for (var element in deleteWindowService) {
      list.addAll(element);
    }
    return list;
  }

  List<WindowService> get createWindowServicesList {
    final List<WindowService> list = [];
    for (var element in createWindowService) {
      list.addAll(element);
    }
    return list;
  }

  List<WindowService> get updateWindowServicesList {
    final List<WindowService> list = [];
    for (var element in updateWindowService) {
      list.addAll(element);
    }
    return list;
  }
}
