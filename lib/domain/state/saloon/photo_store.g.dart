// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PhotoSaloonStore on _PhotoSaloonStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_PhotoSaloonStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$saloonPhotosListAtom =
      Atom(name: '_PhotoSaloonStore.saloonPhotosList', context: context);

  @override
  ObservableList<SaloonPhoto> get saloonPhotosList {
    _$saloonPhotosListAtom.reportRead();
    return super.saloonPhotosList;
  }

  @override
  set saloonPhotosList(ObservableList<SaloonPhoto> value) {
    _$saloonPhotosListAtom.reportWrite(value, super.saloonPhotosList, () {
      super.saloonPhotosList = value;
    });
  }

  late final _$createLogoAsyncAction =
      AsyncAction('_PhotoSaloonStore.createLogo', context: context);

  @override
  Future<void> createLogo(File? file) {
    return _$createLogoAsyncAction.run(() => super.createLogo(file));
  }

  late final _$deleteLogoAsyncAction =
      AsyncAction('_PhotoSaloonStore.deleteLogo', context: context);

  @override
  Future<void> deleteLogo() {
    return _$deleteLogoAsyncAction.run(() => super.deleteLogo());
  }

  late final _$createPhotoAsyncAction =
      AsyncAction('_PhotoSaloonStore.createPhoto', context: context);

  @override
  Future<void> createPhoto(File file) {
    return _$createPhotoAsyncAction.run(() => super.createPhoto(file));
  }

  late final _$deletePhotoAsyncAction =
      AsyncAction('_PhotoSaloonStore.deletePhoto', context: context);

  @override
  Future<void> deletePhoto(SaloonPhoto saloonPhoto) {
    return _$deletePhotoAsyncAction.run(() => super.deletePhoto(saloonPhoto));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
saloonPhotosList: ${saloonPhotosList}
    ''';
  }
}
