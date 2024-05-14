import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/state/saloon/master_store.dart';

part 'masters_controller.g.dart';

// ignore: library_private_types_in_public_api
class MastersSaloonController = _MastersSaloonController
    with _$MastersSaloonController;

abstract class _MastersSaloonController with Store {
  _MastersSaloonController({
    required MasterSaloonStore masterSaloonStore,
  }) : _masterSaloonStore = masterSaloonStore;

  final MasterSaloonStore _masterSaloonStore;

  @computed
  bool get isLoading => _masterSaloonStore.isLoading;

  ObservableList<SaloonMaster> get saloonMastersList =>
      _masterSaloonStore.saloonMastersList;

  Future<void> deleteMaster(int masterId) async {
    await _masterSaloonStore.deleteMaster(masterId: masterId);
  }
}
