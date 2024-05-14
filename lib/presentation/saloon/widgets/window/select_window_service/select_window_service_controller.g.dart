// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_window_service_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectWindowServiceController on _SelectWindowServiceController, Store {
  late final _$windowServicesAtom = Atom(
      name: '_SelectWindowServiceController.windowServices', context: context);

  @override
  ObservableList<List<WindowService>> get windowServices {
    _$windowServicesAtom.reportRead();
    return super.windowServices;
  }

  @override
  set windowServices(ObservableList<List<WindowService>> value) {
    _$windowServicesAtom.reportWrite(value, super.windowServices, () {
      super.windowServices = value;
    });
  }

  late final _$deleteWindowServiceAtom = Atom(
      name: '_SelectWindowServiceController.deleteWindowService',
      context: context);

  @override
  ObservableList<List<WindowService>> get deleteWindowService {
    _$deleteWindowServiceAtom.reportRead();
    return super.deleteWindowService;
  }

  @override
  set deleteWindowService(ObservableList<List<WindowService>> value) {
    _$deleteWindowServiceAtom.reportWrite(value, super.deleteWindowService, () {
      super.deleteWindowService = value;
    });
  }

  late final _$createWindowServiceAtom = Atom(
      name: '_SelectWindowServiceController.createWindowService',
      context: context);

  @override
  ObservableList<List<WindowService>> get createWindowService {
    _$createWindowServiceAtom.reportRead();
    return super.createWindowService;
  }

  @override
  set createWindowService(ObservableList<List<WindowService>> value) {
    _$createWindowServiceAtom.reportWrite(value, super.createWindowService, () {
      super.createWindowService = value;
    });
  }

  late final _$updateWindowServiceAtom = Atom(
      name: '_SelectWindowServiceController.updateWindowService',
      context: context);

  @override
  ObservableList<List<WindowService>> get updateWindowService {
    _$updateWindowServiceAtom.reportRead();
    return super.updateWindowService;
  }

  @override
  set updateWindowService(ObservableList<List<WindowService>> value) {
    _$updateWindowServiceAtom.reportWrite(value, super.updateWindowService, () {
      super.updateWindowService = value;
    });
  }

  @override
  String toString() {
    return '''
windowServices: ${windowServices},
deleteWindowService: ${deleteWindowService},
createWindowService: ${createWindowService},
updateWindowService: ${updateWindowService}
    ''';
  }
}
