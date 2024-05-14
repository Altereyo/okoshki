// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_service_saloon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddServiceSaloonController on _AddServiceSaloonController, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_AddServiceSaloonController.isLoading'))
          .value;
  Computed<bool>? _$isEnabledButSaveServicesComputed;

  @override
  bool get isEnabledButSaveServices => (_$isEnabledButSaveServicesComputed ??=
          Computed<bool>(() => super.isEnabledButSaveServices,
              name: '_AddServiceSaloonController.isEnabledButSaveServices'))
      .value;

  late final _$indexPageAtom =
      Atom(name: '_AddServiceSaloonController.indexPage', context: context);

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

  late final _$selectedSerTypeAtom = Atom(
      name: '_AddServiceSaloonController.selectedSerType', context: context);

  @override
  ServiceType? get selectedSerType {
    _$selectedSerTypeAtom.reportRead();
    return super.selectedSerType;
  }

  @override
  set selectedSerType(ServiceType? value) {
    _$selectedSerTypeAtom.reportWrite(value, super.selectedSerType, () {
      super.selectedSerType = value;
    });
  }

  late final _$_selectedServicesIdAtom = Atom(
      name: '_AddServiceSaloonController._selectedServicesId',
      context: context);

  @override
  ObservableList<int> get _selectedServicesId {
    _$_selectedServicesIdAtom.reportRead();
    return super._selectedServicesId;
  }

  @override
  set _selectedServicesId(ObservableList<int> value) {
    _$_selectedServicesIdAtom.reportWrite(value, super._selectedServicesId, () {
      super._selectedServicesId = value;
    });
  }

  late final _$_AddServiceSaloonControllerActionController =
      ActionController(name: '_AddServiceSaloonController', context: context);

  @override
  void setIndexPage(ServiceType? serviceType) {
    final _$actionInfo = _$_AddServiceSaloonControllerActionController
        .startAction(name: '_AddServiceSaloonController.setIndexPage');
    try {
      return super.setIndexPage(serviceType);
    } finally {
      _$_AddServiceSaloonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListSelectedServices(int serviceId) {
    final _$actionInfo =
        _$_AddServiceSaloonControllerActionController.startAction(
            name: '_AddServiceSaloonController.addListSelectedServices');
    try {
      return super.addListSelectedServices(serviceId);
    } finally {
      _$_AddServiceSaloonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeListSelectedServices(int serviceId) {
    final _$actionInfo =
        _$_AddServiceSaloonControllerActionController.startAction(
            name: '_AddServiceSaloonController.removeListSelectedServices');
    try {
      return super.removeListSelectedServices(serviceId);
    } finally {
      _$_AddServiceSaloonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexPage: ${indexPage},
selectedSerType: ${selectedSerType},
isLoading: ${isLoading},
isEnabledButSaveServices: ${isEnabledButSaveServices}
    ''';
  }
}
