import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_photo.dart';
import 'package:okoshki/domain/repository/api/saloon_photo_repository.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';

part 'photo_store.g.dart';

// ignore: library_private_types_in_public_api
class PhotoSaloonStore = _PhotoSaloonStore with _$PhotoSaloonStore;

abstract class _PhotoSaloonStore with Store {
  _PhotoSaloonStore({
    required SaloonPhotoRepository saloonPhotoRepository,
    required SaloonStore saloonStore,
  })  : _saloonPhotoRepository = saloonPhotoRepository,
        _saloonStore = saloonStore;

  final SaloonPhotoRepository _saloonPhotoRepository;
  final SaloonStore _saloonStore;

  Future<void> init() async {
    await asyncWhen((_) => _saloonStore.isLoading == false);
    await _getSaloonPhotosList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  @observable
  ObservableList<SaloonPhoto> saloonPhotosList = ObservableList();

  @action
  Future<void> createLogo(File? file) async {
    final res = await _saloonPhotoRepository.createLogo(
      saloonId: _saloonStore.saloonId,
      logo: file!,
    );

    if (res.success) {
      _saloonStore.setSallonDetail(res.data!);
    }
  }

  @action
  Future<void> deleteLogo() async {
    final res = await _saloonPhotoRepository.deleteLogo(
      saloonId: _saloonStore.saloonId,
    );

    if (res.success) {
      _saloonStore.setSallonDetail(res.data!);
    }
  }

  @action
  Future<void> createPhoto(File file) async {
    final res = await _saloonPhotoRepository.createPhoto(
      saloonId: _saloonStore.saloonId,
      photo: file,
    );

    if (res.success) {
      saloonPhotosList.add(res.data!);
    }
  }

  @action
  Future<void> deletePhoto(SaloonPhoto saloonPhoto) async {
    final res =
        await _saloonPhotoRepository.deleteSaloonPhoto(photoId: saloonPhoto.id);

    if (res.success) {
      for (var element in saloonPhotosList) {
        if (element.id == saloonPhoto.id) {
          saloonPhotosList.remove(element);
          return;
        }
      }
    }
  }

  Future<void> _getSaloonPhotosList() async {
    final res = await _saloonPhotoRepository.getPhotoList(
      saloonId: _saloonStore.saloonId,
    );

    if (res.success) {
      saloonPhotosList.addAll(res.data!);
    }
  }
}
