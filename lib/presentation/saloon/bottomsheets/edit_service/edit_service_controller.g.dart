// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_service_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditServiceController on _EditServiceController, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_EditServiceController.isLoading'))
          .value;
  Computed<bool>? _$isEnabledButSaveChangesComputed;

  @override
  bool get isEnabledButSaveChanges => (_$isEnabledButSaveChangesComputed ??=
          Computed<bool>(() => super.isEnabledButSaveChanges,
              name: '_EditServiceController.isEnabledButSaveChanges'))
      .value;

  late final _$_selectedServicesIdAtom = Atom(
      name: '_EditServiceController._selectedServicesId', context: context);

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

  late final _$_EditServiceControllerActionController =
      ActionController(name: '_EditServiceController', context: context);

  @override
  void addListSelectedServices(int serviceId) {
    final _$actionInfo = _$_EditServiceControllerActionController.startAction(
        name: '_EditServiceController.addListSelectedServices');
    try {
      return super.addListSelectedServices(serviceId);
    } finally {
      _$_EditServiceControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeListSelectedServices(int serviceId) {
    final _$actionInfo = _$_EditServiceControllerActionController.startAction(
        name: '_EditServiceController.removeListSelectedServices');
    try {
      return super.removeListSelectedServices(serviceId);
    } finally {
      _$_EditServiceControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isEnabledButSaveChanges: ${isEnabledButSaveChanges}
    ''';
  }
}
