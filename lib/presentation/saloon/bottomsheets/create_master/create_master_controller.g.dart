// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_master_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateMasterController on _CreateMasterController, Store {
  Computed<bool>? _$isEnabledButtonSaveComputed;

  @override
  bool get isEnabledButtonSave => (_$isEnabledButtonSaveComputed ??=
          Computed<bool>(() => super.isEnabledButtonSave,
              name: '_CreateMasterController.isEnabledButtonSave'))
      .value;

  late final _$nameAtom =
      Atom(name: '_CreateMasterController.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$specializationAtom =
      Atom(name: '_CreateMasterController.specialization', context: context);

  @override
  String get specialization {
    _$specializationAtom.reportRead();
    return super.specialization;
  }

  @override
  set specialization(String value) {
    _$specializationAtom.reportWrite(value, super.specialization, () {
      super.specialization = value;
    });
  }

  late final _$avatarAtom =
      Atom(name: '_CreateMasterController.avatar', context: context);

  @override
  String? get avatar {
    _$avatarAtom.reportRead();
    return super.avatar;
  }

  @override
  set avatar(String? value) {
    _$avatarAtom.reportWrite(value, super.avatar, () {
      super.avatar = value;
    });
  }

  late final _$saloonMasterServicesListAtom = Atom(
      name: '_CreateMasterController.saloonMasterServicesList',
      context: context);

  @override
  ObservableList<SaloonMasterService> get saloonMasterServicesList {
    _$saloonMasterServicesListAtom.reportRead();
    return super.saloonMasterServicesList;
  }

  @override
  set saloonMasterServicesList(ObservableList<SaloonMasterService> value) {
    _$saloonMasterServicesListAtom
        .reportWrite(value, super.saloonMasterServicesList, () {
      super.saloonMasterServicesList = value;
    });
  }

  late final _$_CreateMasterControllerActionController =
      ActionController(name: '_CreateMasterController', context: context);

  @override
  void removeSalonMasterSevice(SaloonMasterService saloonMasterService) {
    final _$actionInfo = _$_CreateMasterControllerActionController.startAction(
        name: '_CreateMasterController.removeSalonMasterSevice');
    try {
      return super.removeSalonMasterSevice(saloonMasterService);
    } finally {
      _$_CreateMasterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
specialization: ${specialization},
avatar: ${avatar},
saloonMasterServicesList: ${saloonMasterServicesList},
isEnabledButtonSave: ${isEnabledButtonSave}
    ''';
  }
}
