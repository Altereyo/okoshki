// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_blocking_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientBlockingController on _ClientBlockingController, Store {
  late final _$clientBlockingAtom =
      Atom(name: '_ClientBlockingController.clientBlocking', context: context);

  @override
  ClientBlocking? get clientBlocking {
    _$clientBlockingAtom.reportRead();
    return super.clientBlocking;
  }

  @override
  set clientBlocking(ClientBlocking? value) {
    _$clientBlockingAtom.reportWrite(value, super.clientBlocking, () {
      super.clientBlocking = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ClientBlockingController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_getDateBlockingClientAsyncAction = AsyncAction(
      '_ClientBlockingController._getDateBlockingClient',
      context: context);

  @override
  Future<void> _getDateBlockingClient() {
    return _$_getDateBlockingClientAsyncAction
        .run(() => super._getDateBlockingClient());
  }

  @override
  String toString() {
    return '''
clientBlocking: ${clientBlocking},
isLoading: ${isLoading}
    ''';
  }
}
