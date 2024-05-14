// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthSaloonController on _AuthSaloonController, Store {
  Computed<String>? _$errorAuthorizeComputed;

  @override
  String get errorAuthorize =>
      (_$errorAuthorizeComputed ??= Computed<String>(() => super.errorAuthorize,
              name: '_AuthSaloonController.errorAuthorize'))
          .value;
  Computed<bool>? _$isEnabledButtonToComeInComputed;

  @override
  bool get isEnabledButtonToComeIn => (_$isEnabledButtonToComeInComputed ??=
          Computed<bool>(() => super.isEnabledButtonToComeIn,
              name: '_AuthSaloonController.isEnabledButtonToComeIn'))
      .value;

  late final _$emailAtom =
      Atom(name: '_AuthSaloonController.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AuthSaloonController.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$isHidenPasswordViewAtom =
      Atom(name: '_AuthSaloonController.isHidenPasswordView', context: context);

  @override
  bool get isHidenPasswordView {
    _$isHidenPasswordViewAtom.reportRead();
    return super.isHidenPasswordView;
  }

  @override
  set isHidenPasswordView(bool value) {
    _$isHidenPasswordViewAtom.reportWrite(value, super.isHidenPasswordView, () {
      super.isHidenPasswordView = value;
    });
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
isHidenPasswordView: ${isHidenPasswordView},
errorAuthorize: ${errorAuthorize},
isEnabledButtonToComeIn: ${isEnabledButtonToComeIn}
    ''';
  }
}
