// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StockSaloonStore on _StockSaloonStore, Store {
  Computed<String>? _$numStockComputed;

  @override
  String get numStock =>
      (_$numStockComputed ??= Computed<String>(() => super.numStock,
              name: '_StockSaloonStore.numStock'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_StockSaloonStore.isLoading', context: context);

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

  late final _$stockListAtom =
      Atom(name: '_StockSaloonStore.stockList', context: context);

  @override
  ObservableList<Stock> get stockList {
    _$stockListAtom.reportRead();
    return super.stockList;
  }

  @override
  set stockList(ObservableList<Stock> value) {
    _$stockListAtom.reportWrite(value, super.stockList, () {
      super.stockList = value;
    });
  }

  late final _$_getStockListAsyncAction =
      AsyncAction('_StockSaloonStore._getStockList', context: context);

  @override
  Future<void> _getStockList() {
    return _$_getStockListAsyncAction.run(() => super._getStockList());
  }

  late final _$createStockAsyncAction =
      AsyncAction('_StockSaloonStore.createStock', context: context);

  @override
  Future<bool> createStock(
      {required String title,
      required String duration,
      String? description,
      File? logo}) {
    return _$createStockAsyncAction.run(() => super.createStock(
        title: title,
        duration: duration,
        description: description,
        logo: logo));
  }

  late final _$updateStockAsyncAction =
      AsyncAction('_StockSaloonStore.updateStock', context: context);

  @override
  Future<bool> updateStock(
      {required int stockId,
      String? title,
      String? duration,
      String? description,
      File? logo}) {
    return _$updateStockAsyncAction.run(() => super.updateStock(
        stockId: stockId,
        title: title,
        duration: duration,
        description: description,
        logo: logo));
  }

  late final _$deleteLogoStockAsyncAction =
      AsyncAction('_StockSaloonStore.deleteLogoStock', context: context);

  @override
  Future<void> deleteLogoStock({required int stockId}) {
    return _$deleteLogoStockAsyncAction
        .run(() => super.deleteLogoStock(stockId: stockId));
  }

  late final _$deleteStockAsyncAction =
      AsyncAction('_StockSaloonStore.deleteStock', context: context);

  @override
  Future<void> deleteStock({required int stockId}) {
    return _$deleteStockAsyncAction
        .run(() => super.deleteStock(stockId: stockId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
stockList: ${stockList},
numStock: ${numStock}
    ''';
  }
}
