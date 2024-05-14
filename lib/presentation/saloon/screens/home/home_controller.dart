import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/window.dart';
import 'package:okoshki/domain/entities/window.dart';
import 'package:okoshki/domain/state/saloon/window_store.dart';

part 'home_controller.g.dart';

// ignore: library_private_types_in_public_api
class HomeSaloonController = _HomeSaloonController with _$HomeSaloonController;

abstract class _HomeSaloonController with Store {
  _HomeSaloonController({
    required WindowSaloonStore windowSaloonStore,
  }) : _windowSaloonStore = windowSaloonStore;

  final WindowSaloonStore _windowSaloonStore;

  DateTime get dateTime => _windowSaloonStore.dateTime;

  @computed
  bool get isLoading => _windowSaloonStore.isLoading;

  Future<void> refreshWindows() {
    return _windowSaloonStore.refresh();
  }

  Map<int, List<Window>> get windowsGroupSort {
    final group =
        groupBy(_windowSaloonStore.windowsList, (val) => val.startDateTime.day);
    return SplayTreeMap<int, List<Window>>.from(
        group, (keys1, keys2) => keys1.compareTo(keys2));
  }
}
