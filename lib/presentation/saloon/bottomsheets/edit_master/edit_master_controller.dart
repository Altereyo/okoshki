import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/saloon_master_service.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/entities/saloon_master_service.dart';
import 'package:okoshki/domain/state/saloon/master_store.dart';

part 'edit_master_controller.g.dart';

// ignore: library_private_types_in_public_api
class EditMasterController = _EditMasterController with _$EditMasterController;

abstract class _EditMasterController with Store {
  _EditMasterController({
    required SaloonMaster saloonMaster,
    required MasterSaloonStore masterSaloonStore,
  })  : _saloonMaster = saloonMaster,
        _masterSaloonStore = masterSaloonStore;

  final MasterSaloonStore _masterSaloonStore;
  final SaloonMaster _saloonMaster;

  Future<void> init() async {
    //Создание копии мастера
    name = _saloonMaster.name;
    specialization = _saloonMaster.specialization!;
    avatar = _saloonMaster.avatar;
    for (var element in _saloonMaster.services!) {
      saloonMasterServicesList.add(element.copyWith());
    }
  }

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

  Future<void> saveChangesMaster() async {
    await _updateNameMaster();
    await _updateSpecializationMaster();
    await _updateAvatar();
    await _updateMasterServices();
    await _deleteMasterServices();
    await _createMasterService();
    await _masterSaloonStore.updateMasterInListMasters(
        masterId: _saloonMaster.id);
  }

  Future<void> _updateNameMaster() async {
    if (name != _saloonMaster.name) {
      await _masterSaloonStore.updateMaster(
        masterId: _saloonMaster.id,
        name: name,
      );
    }
  }

  Future<void> _updateSpecializationMaster() async {
    if (specialization != _saloonMaster.specialization) {
      await _masterSaloonStore.updateMaster(
        masterId: _saloonMaster.id,
        specialization: specialization,
      );
    }
  }

  Future<void> _updateAvatar() async {
    if (avatar == null) {
      if (_saloonMaster.avatar != null) {
        await _masterSaloonStore.deleteSaloonMasterAvatar(
          masterId: _saloonMaster.id,
        );
      }
    } else if (avatar != _saloonMaster.avatar) {
      await _masterSaloonStore.updateMaster(
        masterId: _saloonMaster.id,
        avatar: File(avatar!),
      );
    }
  }

  Future<void> _deleteMasterServices() async {
    //Проходимся по всем услугам которые были у мастера
    for (var service in _saloonMaster.services!) {
      //Проверяем есть ли она в листе новых услуг
      final res = saloonMasterServicesList.any(
        (element) => service.id == element.id,
      );
      if (!res) {
        //Если услуги нет то удаляем ее
        await _masterSaloonStore.deleteMasterService(
          masterServiceId: service.id!,
        );
      }
    }
  }

  Future<void> _updateMasterServices() async {
    //Проходимся по всем новым услугам
    for (var service in saloonMasterServicesList) {
      //Проверяем была ли эта услуга
      final res = _saloonMaster.services!.any(
        (element) => element.id == service.id,
      );
      if (res) {
        //Проверяем есть ли изменения в услуге, если есть то обновление услуги
        final res = _saloonMaster.services!.any(
          (element) =>
              element.isActive != service.isActive ||
              element.price != service.price,
        );
        if (res) {
          await _masterSaloonStore.updateMasterService(
            masterServiceId: service.id!,
            price: service.price,
            isActive: service.isActive,
          );
        }
      }
    }
  }

  Future<void> _createMasterService() async {
    //Проходимся по новым услугам мастера
    for (var newServise in saloonMasterServicesList) {
      //Проверяем есть ли она в листе услг мастера
      final res = _saloonMaster.services!.any(
        (element) => element.id == newServise.id,
      );
      if (!res) {
        //Если услуги нет то добавлемя ее в лист
        await _masterSaloonStore.createMasterService(
          masterId: _saloonMaster.id,
          serviceId: newServise.service.id,
          price: newServise.price,
          isActive: newServise.isActive,
        );
      }
    }
  }
}
