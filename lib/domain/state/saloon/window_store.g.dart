// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WindowSaloonStore on _WindowSaloonStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_WindowSaloonStore.isLoading', context: context);

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

  late final _$windowsListAtom =
      Atom(name: '_WindowSaloonStore.windowsList', context: context);

  @override
  ObservableList<Window> get windowsList {
    _$windowsListAtom.reportRead();
    return super.windowsList;
  }

  @override
  set windowsList(ObservableList<Window> value) {
    _$windowsListAtom.reportWrite(value, super.windowsList, () {
      super.windowsList = value;
    });
  }

  late final _$_getWindowsListAsyncAction =
      AsyncAction('_WindowSaloonStore._getWindowsList', context: context);

  @override
  Future<void> _getWindowsList() {
    return _$_getWindowsListAsyncAction.run(() => super._getWindowsList());
  }

  late final _$createWindowAsyncAction =
      AsyncAction('_WindowSaloonStore.createWindow', context: context);

  @override
  Future<bool> createWindow({required Window newWindow}) {
    return _$createWindowAsyncAction
        .run(() => super.createWindow(newWindow: newWindow));
  }

  late final _$deleteWindowAsyncAction =
      AsyncAction('_WindowSaloonStore.deleteWindow', context: context);

  @override
  Future<void> deleteWindow(int windowId) {
    return _$deleteWindowAsyncAction.run(() => super.deleteWindow(windowId));
  }

  late final _$updateWindowAsyncAction =
      AsyncAction('_WindowSaloonStore.updateWindow', context: context);

  @override
  Future<bool> updateWindow(
      {required int windowId,
      String? startDt,
      String? endDt,
      required List<WindowService> delete,
      required List<WindowService> update,
      required List<WindowService> create}) {
    return _$updateWindowAsyncAction.run(() => super.updateWindow(
        windowId: windowId,
        startDt: startDt,
        endDt: endDt,
        delete: delete,
        update: update,
        create: create));
  }

  late final _$updateBookingQrAsyncAction =
      AsyncAction('_WindowSaloonStore.updateBookingQr', context: context);

  @override
  Future<bool> updateBookingQr({required String bookingUid}) {
    return _$updateBookingQrAsyncAction
        .run(() => super.updateBookingQr(bookingUid: bookingUid));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
windowsList: ${windowsList}
    ''';
  }
}
