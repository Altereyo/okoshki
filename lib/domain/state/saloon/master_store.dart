import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';
import 'package:okoshki/domain/repository/api/saloon_master_repository.dart';
import 'package:okoshki/domain/repository/api/saloon_master_services_repository.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';

part 'master_store.g.dart';

// ignore: library_private_types_in_public_api
class MasterSaloonStore = _MasterSaloonStore with _$MasterSaloonStore;

abstract class _MasterSaloonStore with Store {
  _MasterSaloonStore({
    required SaloonMasterRepository saloonMasterRepository,
    required SaloonMasterServiceRepository saloonMasterServiceRepository,
    required SaloonStore saloonStore,
  })  : _saloonMasterRepository = saloonMasterRepository,
        _saloonMasterServiceRepository = saloonMasterServiceRepository,
        _saloonStore = saloonStore;
  final SaloonMasterRepository _saloonMasterRepository;
  final SaloonMasterServiceRepository _saloonMasterServiceRepository;
  final SaloonStore _saloonStore;

  Future<void> init() async {
    await asyncWhen((_) => _saloonStore.isLoading == false);
    await _getMastersList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  @observable
  ObservableList<SaloonMaster> saloonMastersList = ObservableList();

  @computed
  String get numMastersSaloon => saloonMastersList.length.toString();

  @action
  Future<void> updateMasterInListMasters({required int masterId}) async {
    final res = await _saloonMasterRepository.getSaloonMaster(
      masterId: masterId,
    );

    if (res.success) {
      //Если мастера нету в листе то добавить в конец листа, иначе поменять в листе
      final isRes =
          saloonMastersList.any((element) => element.id == res.data!.id);
      if (isRes) {
        final index = saloonMastersList.indexWhere(
          (element) => element.id == masterId,
        );
        saloonMastersList[index] = res.data!;
      } else {
        saloonMastersList.add(res.data!);
      }
    }
  }

  Future<void> _getMastersList() async {
    final res = await _saloonMasterRepository.getMasterList(
      _saloonStore.saloonId,
    );

    if (res.success) {
      saloonMastersList.addAll(res.data!);
    }
  }

  @action
  Future<void> deleteMaster({required int masterId}) async {
    final res = await _saloonMasterRepository.deleteSaloonMaster(
      masterId: masterId,
    );

    if (res.success) {
      //remove master in list
      saloonMastersList.removeWhere((element) => element.id == masterId);
    }
  }

  Future<void> updateMaster({
    required int masterId,
    String? name,
    String? specialization,
    File? avatar,
  }) async {
    final res = await _saloonMasterRepository.updateSaloonMaster(
      masterId: masterId,
      salonId: _saloonStore.saloonId,
      name: name,
      specialization: specialization,
      avatar: avatar,
    );

    if (res.success) {}
  }

  Future<void> deleteSaloonMasterAvatar({
    required int masterId,
  }) async {
    final res = await _saloonMasterRepository.deleteSaloonMasterAvatar(
      masterId: masterId,
    );

    if (res.success) {}
  }

  Future<int?> createMaster({
    required String name,
    required String? specialization,
    File? avatar,
  }) async {
    final res = await _saloonMasterRepository.createMaster(
      salonId: _saloonStore.saloonId,
      name: name,
      specialization: specialization,
      avatar: avatar,
    );

    if (res.success) {
      return res.data!.id;
    }
    return null;
  }

  //services_master
  Future<void> createMasterService({
    required int masterId,
    required int serviceId,
    required String price,
    bool? isActive,
  }) async {
    final res = await _saloonMasterServiceRepository.createMasterService(
      masterId: masterId,
      serviceId: serviceId,
      price: price,
      isActive: isActive,
    );
    if (res.success) {}
  }

  Future<void> updateMasterService({
    required int masterServiceId,
    String? price,
    bool? isActive,
  }) async {
    final res = await _saloonMasterServiceRepository.updateMasterService(
      masterServiceId: masterServiceId,
      price: price,
      isActive: isActive,
    );
    if (res.success) {}
  }

  Future<void> deleteMasterService({
    required int masterServiceId,
  }) async {
    final res = await _saloonMasterServiceRepository.deleteMasterService(
      masterServiceId,
    );
    if (res.success) {}
  }
}
