// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanning_qr_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScanningQrSaloonController on _ScanningQrSaloonController, Store {
  late final _$isErrorAtom =
      Atom(name: '_ScanningQrSaloonController.isError', context: context);

  @override
  bool? get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool? value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  @override
  String toString() {
    return '''
isError: ${isError}
    ''';
  }
}
