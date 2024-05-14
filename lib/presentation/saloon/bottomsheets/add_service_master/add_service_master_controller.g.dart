// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_service_master_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddServiceMasterController on _AddServiceMasterController, Store {
  Computed<bool>? _$isEnabledButSaveServicesComputed;

  @override
  bool get isEnabledButSaveServices => (_$isEnabledButSaveServicesComputed ??=
          Computed<bool>(() => super.isEnabledButSaveServices,
              name: '_AddServiceMasterController.isEnabledButSaveServices'))
      .value;

  late final _$indexPageAtom =
      Atom(name: '_AddServiceMasterController.indexPage', context: context);

  @override
  int get indexPage {
    _$indexPageAtom.reportRead();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.reportWrite(value, super.indexPage, () {
      super.indexPage = value;
    });
  }

  late final _$isSelectedSerTypeAtom = Atom(
      name: '_AddServiceMasterController.isSelectedSerType', context: context);

  @override
  ServiceType? get isSelectedSerType {
    _$isSelectedSerTypeAtom.reportRead();
    return super.isSelectedSerType;
  }

  @override
  set isSelectedSerType(ServiceType? value) {
    _$isSelectedSerTypeAtom.reportWrite(value, super.isSelectedSerType, () {
      super.isSelectedSerType = value;
    });
  }

  late final _$selectedServicesAtom = Atom(
      name: '_AddServiceMasterController.selectedServices', context: context);

  @override
  ObservableList<Service> get selectedServices {
    _$selectedServicesAtom.reportRead();
    return super.selectedServices;
  }

  @override
  set selectedServices(ObservableList<Service> value) {
    _$selectedServicesAtom.reportWrite(value, super.selectedServices, () {
      super.selectedServices = value;
    });
  }

  late final _$_AddServiceMasterControllerActionController =
      ActionController(name: '_AddServiceMasterController', context: context);

  @override
  void setIndexPage(ServiceType? serviceType) {
    final _$actionInfo = _$_AddServiceMasterControllerActionController
        .startAction(name: '_AddServiceMasterController.setIndexPage');
    try {
      return super.setIndexPage(serviceType);
    } finally {
      _$_AddServiceMasterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListSelectedServices(Service service) {
    final _$actionInfo =
        _$_AddServiceMasterControllerActionController.startAction(
            name: '_AddServiceMasterController.addListSelectedServices');
    try {
      return super.addListSelectedServices(service);
    } finally {
      _$_AddServiceMasterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeListSelectedServices(Service service) {
    final _$actionInfo =
        _$_AddServiceMasterControllerActionController.startAction(
            name: '_AddServiceMasterController.removeListSelectedServices');
    try {
      return super.removeListSelectedServices(service);
    } finally {
      _$_AddServiceMasterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexPage: ${indexPage},
isSelectedSerType: ${isSelectedSerType},
selectedServices: ${selectedServices},
isEnabledButSaveServices: ${isEnabledButSaveServices}
    ''';
  }
}
