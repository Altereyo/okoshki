// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthCustomerController on _AuthCustomerController, Store {
  Computed<bool>? _$isEnabledButtonGetCodeComputed;

  @override
  bool get isEnabledButtonGetCode => (_$isEnabledButtonGetCodeComputed ??=
          Computed<bool>(() => super.isEnabledButtonGetCode,
              name: '_AuthCustomerController.isEnabledButtonGetCode'))
      .value;

  late final _$phoneNumberAtom =
      Atom(name: '_AuthCustomerController.phoneNumber', context: context);

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  @override
  String toString() {
    return '''
phoneNumber: ${phoneNumber},
isEnabledButtonGetCode: ${isEnabledButtonGetCode}
    ''';
  }
}
