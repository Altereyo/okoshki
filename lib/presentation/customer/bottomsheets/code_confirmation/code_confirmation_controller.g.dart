// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_confirmation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CodeConfirmationController on _CodeConfirmationController, Store {
  Computed<String>? _$errorAuthorizeComputed;

  @override
  String get errorAuthorize =>
      (_$errorAuthorizeComputed ??= Computed<String>(() => super.errorAuthorize,
              name: '_CodeConfirmationController.errorAuthorize'))
          .value;
  Computed<bool>? _$isEnabledButtonConfirmComputed;

  @override
  bool get isEnabledButtonConfirm => (_$isEnabledButtonConfirmComputed ??=
          Computed<bool>(() => super.isEnabledButtonConfirm,
              name: '_CodeConfirmationController.isEnabledButtonConfirm'))
      .value;

  late final _$smsCodeAtom =
      Atom(name: '_CodeConfirmationController.smsCode', context: context);

  @override
  String get smsCode {
    _$smsCodeAtom.reportRead();
    return super.smsCode;
  }

  @override
  set smsCode(String value) {
    _$smsCodeAtom.reportWrite(value, super.smsCode, () {
      super.smsCode = value;
    });
  }

  @override
  String toString() {
    return '''
smsCode: ${smsCode},
errorAuthorize: ${errorAuthorize},
isEnabledButtonConfirm: ${isEnabledButtonConfirm}
    ''';
  }
}
