// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rename_profile_customer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RenameProfileCustomerController
    on _RenameProfileCustomerController, Store {
  Computed<bool>? _$enabledButtonSaveNameComputed;

  @override
  bool get enabledButtonSaveName => (_$enabledButtonSaveNameComputed ??=
          Computed<bool>(() => super.enabledButtonSaveName,
              name: '_RenameProfileCustomerController.enabledButtonSaveName'))
      .value;

  late final _$userNameAtom =
      Atom(name: '_RenameProfileCustomerController.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  @override
  String toString() {
    return '''
userName: ${userName},
enabledButtonSaveName: ${enabledButtonSaveName}
    ''';
  }
}
