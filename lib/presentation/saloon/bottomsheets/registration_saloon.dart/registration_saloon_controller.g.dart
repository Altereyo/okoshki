// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_saloon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationSaloonController on _RegistrationSaloonController, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_RegistrationSaloonController.isLoading'))
          .value;
  Computed<bool>? _$isEnabledButtonRegistrationComputed;

  @override
  bool get isEnabledButtonRegistration =>
      (_$isEnabledButtonRegistrationComputed ??= Computed<bool>(
              () => super.isEnabledButtonRegistration,
              name:
                  '_RegistrationSaloonController.isEnabledButtonRegistration'))
          .value;

  late final _$_salonTitleAtom =
      Atom(name: '_RegistrationSaloonController._salonTitle', context: context);

  @override
  String get _salonTitle {
    _$_salonTitleAtom.reportRead();
    return super._salonTitle;
  }

  @override
  set _salonTitle(String value) {
    _$_salonTitleAtom.reportWrite(value, super._salonTitle, () {
      super._salonTitle = value;
    });
  }

  late final _$_phoneNumberAtom = Atom(
      name: '_RegistrationSaloonController._phoneNumber', context: context);

  @override
  String get _phoneNumber {
    _$_phoneNumberAtom.reportRead();
    return super._phoneNumber;
  }

  @override
  set _phoneNumber(String value) {
    _$_phoneNumberAtom.reportWrite(value, super._phoneNumber, () {
      super._phoneNumber = value;
    });
  }

  late final _$_emailAtom =
      Atom(name: '_RegistrationSaloonController._email', context: context);

  @override
  String get _email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  set _email(String value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  late final _$_servicesIdsListAtom = Atom(
      name: '_RegistrationSaloonController._servicesIdsList', context: context);

  @override
  ObservableList<int> get _servicesIdsList {
    _$_servicesIdsListAtom.reportRead();
    return super._servicesIdsList;
  }

  @override
  set _servicesIdsList(ObservableList<int> value) {
    _$_servicesIdsListAtom.reportWrite(value, super._servicesIdsList, () {
      super._servicesIdsList = value;
    });
  }

  late final _$_RegistrationSaloonControllerActionController =
      ActionController(name: '_RegistrationSaloonController', context: context);

  @override
  void setSaloonTitle(String title) {
    final _$actionInfo = _$_RegistrationSaloonControllerActionController
        .startAction(name: '_RegistrationSaloonController.setSaloonTitle');
    try {
      return super.setSaloonTitle(title);
    } finally {
      _$_RegistrationSaloonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneNumber(String phone) {
    final _$actionInfo = _$_RegistrationSaloonControllerActionController
        .startAction(name: '_RegistrationSaloonController.setPhoneNumber');
    try {
      return super.setPhoneNumber(phone);
    } finally {
      _$_RegistrationSaloonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_RegistrationSaloonControllerActionController
        .startAction(name: '_RegistrationSaloonController.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_RegistrationSaloonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addServices(int serviceId) {
    final _$actionInfo = _$_RegistrationSaloonControllerActionController
        .startAction(name: '_RegistrationSaloonController.addServices');
    try {
      return super.addServices(serviceId);
    } finally {
      _$_RegistrationSaloonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeServices(int serviceId) {
    final _$actionInfo = _$_RegistrationSaloonControllerActionController
        .startAction(name: '_RegistrationSaloonController.removeServices');
    try {
      return super.removeServices(serviceId);
    } finally {
      _$_RegistrationSaloonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isEnabledButtonRegistration: ${isEnabledButtonRegistration}
    ''';
  }
}
