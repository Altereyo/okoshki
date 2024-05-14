// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookingFormController on _BookingFormController, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_BookingFormController.isLoading'))
          .value;

  late final _$selectWindowAtom =
      Atom(name: '_BookingFormController.selectWindow', context: context);

  @override
  Window? get selectWindow {
    _$selectWindowAtom.reportRead();
    return super.selectWindow;
  }

  @override
  set selectWindow(Window? value) {
    _$selectWindowAtom.reportWrite(value, super.selectWindow, () {
      super.selectWindow = value;
    });
  }

  late final _$selectServiceAtom =
      Atom(name: '_BookingFormController.selectService', context: context);

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

  late final _$selectWindowServiceAtom = Atom(
      name: '_BookingFormController.selectWindowService', context: context);

  @override
  WindowService? get selectWindowService {
    _$selectWindowServiceAtom.reportRead();
    return super.selectWindowService;
  }

  @override
  set selectWindowService(WindowService? value) {
    _$selectWindowServiceAtom.reportWrite(value, super.selectWindowService, () {
      super.selectWindowService = value;
    });
  }

  late final _$servicesListAtom =
      Atom(name: '_BookingFormController.servicesList', context: context);

  @override
  ObservableList<Service> get servicesList {
    _$servicesListAtom.reportRead();
    return super.servicesList;
  }

  @override
  set servicesList(ObservableList<Service> value) {
    _$servicesListAtom.reportWrite(value, super.servicesList, () {
      super.servicesList = value;
    });
  }

  late final _$windowServicesListAtom =
      Atom(name: '_BookingFormController.windowServicesList', context: context);

  @override
  ObservableList<WindowService> get windowServicesList {
    _$windowServicesListAtom.reportRead();
    return super.windowServicesList;
  }

  @override
  set windowServicesList(ObservableList<WindowService> value) {
    _$windowServicesListAtom.reportWrite(value, super.windowServicesList, () {
      super.windowServicesList = value;
    });
  }

  late final _$_initWindowAsyncAction =
      AsyncAction('_BookingFormController._initWindow', context: context);

  @override
  Future<void> _initWindow() {
    return _$_initWindowAsyncAction.run(() => super._initWindow());
  }

  late final _$_BookingFormControllerActionController =
      ActionController(name: '_BookingFormController', context: context);

  @override
  void _initReaction() {
    final _$actionInfo = _$_BookingFormControllerActionController.startAction(
        name: '_BookingFormController._initReaction');
    try {
      return super._initReaction();
    } finally {
      _$_BookingFormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectWindow: ${selectWindow},
selectService: ${selectService},
selectWindowService: ${selectWindowService},
servicesList: ${servicesList},
windowServicesList: ${windowServicesList},
isLoading: ${isLoading}
    ''';
  }
}
