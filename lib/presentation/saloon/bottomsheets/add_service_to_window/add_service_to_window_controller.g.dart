// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_service_to_window_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddServiceToWindowController on _AddServiceToWindowController, Store {
  Computed<bool>? _$isSelectMasterComputed;

  @override
  bool get isSelectMaster =>
      (_$isSelectMasterComputed ??= Computed<bool>(() => super.isSelectMaster,
              name: '_AddServiceToWindowController.isSelectMaster'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_AddServiceToWindowController.isLoading'))
          .value;
  Computed<bool>? _$isEnabledButtonConfirmComputed;

  @override
  bool get isEnabledButtonConfirm => (_$isEnabledButtonConfirmComputed ??=
          Computed<bool>(() => super.isEnabledButtonConfirm,
              name: '_AddServiceToWindowController.isEnabledButtonConfirm'))
      .value;

  late final _$indexPageAtom =
      Atom(name: '_AddServiceToWindowController.indexPage', context: context);

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

  late final _$selectSerTypeAtom = Atom(
      name: '_AddServiceToWindowController.selectSerType', context: context);

  @override
  ServiceType? get selectSerType {
    _$selectSerTypeAtom.reportRead();
    return super.selectSerType;
  }

  @override
  set selectSerType(ServiceType? value) {
    _$selectSerTypeAtom.reportWrite(value, super.selectSerType, () {
      super.selectSerType = value;
    });
  }

  late final _$selectServiceAtom = Atom(
      name: '_AddServiceToWindowController.selectService', context: context);

  @override
  Service? get selectService {
    _$selectServiceAtom.reportRead();
    return super.selectService;
  }

  @override
  set selectService(Service? value) {
    _$selectServiceAtom.reportWrite(value, super.selectService, () {
      super.selectService = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_AddServiceToWindowController.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
indexPage: ${indexPage},
selectSerType: ${selectSerType},
selectService: ${selectService},
isSelectMaster: ${isSelectMaster},
isLoading: ${isLoading},
isEnabledButtonConfirm: ${isEnabledButtonConfirm}
    ''';
  }
}
