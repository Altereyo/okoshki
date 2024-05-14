import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_master_service.dart';
import 'package:okoshki/domain/state/saloon/master_store.dart';

part 'create_master_controller.g.dart';

// ignore: library_private_types_in_public_api
class CreateMasterController = _CreateMasterController
    with _$CreateMasterController;

abstract class _CreateMasterController with Store {
  _CreateMasterController({
    required MasterSaloonStore masterSaloonStore,
  }) : _masterSaloonStore = masterSaloonStore;

  final MasterSaloonStore _masterSaloonStore;

  @observable
  String name = '';

  @observable
  String specialization = '';

  @observable
  String? avatar;

  @observable
  ObservableList<SaloonMasterService> saloonMasterServicesList =
      ObservableList<SaloonMasterService>();

  @computed
  bool get isEnabledButtonSave =>
      name.isNotEmpty &&
      specialization.isNotEmpty &&
      saloonMasterServicesList.isNotEmpty;

  @action
  void removeSalonMasterSevice(SaloonMasterService saloonMasterService) {
    saloonMasterServicesList.removeWhere(
      (element) => element == saloonMasterService,
    );
  }

  Future<void> createMaster() async {
    //create master
    final masterId = await _masterSaloonStore.createMaster(
        avatar: avatar != null ? File(avatar!) : null,
        name: name,
        specialization: specialization);

    if (masterId != null) {
      //create services master
      for (var saloonMasterService in saloonMasterServicesList) {
        await _masterSaloonStore.createMasterService(
            masterId: masterId,
            serviceId: saloonMasterService.service.id,
            price: saloonMasterService.price ,
            isActive: saloonMasterService.isActive);
      }
      //update masters list
      await _masterSaloonStore.updateMasterInListMasters(
        masterId: masterId,
      );
    }
  }
}
