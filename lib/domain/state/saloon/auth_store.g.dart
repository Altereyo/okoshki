// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthSaloonStore on _AuthSaloonStore, Store {
  late final _$errorAuthorizeAtom =
      Atom(name: '_AuthSaloonStore.errorAuthorize', context: context);

  @override
  String get errorAuthorize {
    _$errorAuthorizeAtom.reportRead();
    return super.errorAuthorize;
  }

  @override
  set errorAuthorize(String value) {
    _$errorAuthorizeAtom.reportWrite(value, super.errorAuthorize, () {
      super.errorAuthorize = value;
    });
  }

  late final _$authorizeAsyncAction =
      AsyncAction('_AuthSaloonStore.authorize', context: context);

  @override
  Future<void> authorize({required String email, required String password}) {
    return _$authorizeAsyncAction
        .run(() => super.authorize(email: email, password: password));
  }

  @override
  String toString() {
    return '''
errorAuthorize: ${errorAuthorize}
    ''';
  }
}
