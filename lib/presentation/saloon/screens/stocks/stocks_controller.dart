import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/stock.dart';
import 'package:okoshki/domain/state/saloon/stock_store.dart';

part 'stocks_controller.g.dart';

// ignore: library_private_types_in_public_api
class StocksSaloonController = _StocksSaloonController
    with _$StocksSaloonController;

abstract class _StocksSaloonController with Store {
  _StocksSaloonController({
    required StockSaloonStore stockSaloonStore,
  }) : _stockSaloonStore = stockSaloonStore;

  final StockSaloonStore _stockSaloonStore;

  List<Stock> get stockList => _stockSaloonStore.stockList;

  bool get isLoading => _stockSaloonStore.isLoading;

  Future<void> deleteStock({required int stockId}) async {
    await _stockSaloonStore.deleteStock(stockId: stockId);
  }
}
