// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_recovery_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PasswordRecoveryController on _PasswordRecoveryController, Store {
  Computed<bool>? _$isEnabledButtonRecoveryComputed;

  @override
  bool get isEnabledButtonRecovery => (_$isEnabledButtonRecoveryComputed ??=
          Computed<bool>(() => super.isEnabledButtonRecovery,
              name: '_PasswordRecoveryController.isEnabledButtonRecovery'))
      .value;

  late final _$emailRecoveryAtom =
      Atom(name: '_PasswordRecoveryController.emailRecovery', context: context);

  @override
  String get emailRecovery {
    _$emailRecoveryAtom.reportRead();
    return super.emailRecovery;
  }

  @override
  set emailRecovery(String value) {
    _$emailRecoveryAtom.reportWrite(value, super.emailRecovery, () {
      super.emailRecovery = value;
    });
  }

  late final _$errorEmailRecoveryAtom = Atom(
      name: '_PasswordRecoveryController.errorEmailRecovery', context: context);

  @override
  String? get errorEmailRecovery {
    _$errorEmailRecoveryAtom.reportRead();
    return super.errorEmailRecovery;
  }

  @override
  set errorEmailRecovery(String? value) {
    _$errorEmailRecoveryAtom.reportWrite(value, super.errorEmailRecovery, () {
      super.errorEmailRecovery = value;
    });
  }

  @override
  String toString() {
    return '''
emailRecovery: ${emailRecovery},
errorEmailRecovery: ${errorEmailRecovery},
isEnabledButtonRecovery: ${isEnabledButtonRecovery}
    ''';
  }
}
