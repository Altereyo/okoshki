import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/stock.dart';
import 'package:okoshki/domain/repository/api/stock_repository.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/internal/utils/logger.dart';

part 'stock_store.g.dart';

// ignore: library_private_types_in_public_api
class StockSaloonStore = _StockSaloonStore with _$StockSaloonStore;

abstract class _StockSaloonStore with Store {
  _StockSaloonStore({
    required SaloonStore saloonStore,
    required StockRepository stockRepository,
  })  : _saloonStore = saloonStore,
        _stockRepository = stockRepository;

  final SaloonStore _saloonStore;
  final StockRepository _stockRepository;

  @observable
  bool isLoading = true;

  @observable
  ObservableList<Stock> stockList = ObservableList();

  @computed
  String get numStock => stockList.length.toString();

  Future<void> init() async {
    await asyncWhen((_) => _saloonStore.isLoading == false);
    await _getStockList();
    isLoading = false;
  }

  @action
  Future<void> _getStockList() async {
    final res = await _stockRepository.getStockList(
      saloonId: _saloonStore.saloonId,
    );
    if (res.success) {
      stockList = ObservableList.of(res.data!);
      logger.i(stockList);
    }
  }

  @action
  Future<bool> createStock({
    required String title,
    required String duration,
    String? description,
    File? logo,
  }) async {
    final res = await _stockRepository.createStock(
      saloonId: _saloonStore.saloonId,
      title: title,
      duration: duration,
      description: description,
      logo: logo,
    );
    if (res.success) {
      //Добавление акции в лист
      stockList.add(res.data!);
    }
    return res.success;
  }

  @action
  Future<bool> updateStock({
    required int stockId,
    String? title,
    String? duration,
    String? description,
    File? logo,
  }) async {
    final res = await _stockRepository.updateStock(
      stockId: stockId,
      title: title,
      duration: duration,
      description: description,
      logo: logo,
    );
    if (res.success) {
      //Обновление акции в листе
      final index = stockList.indexWhere(
        (element) => element.id == res.data!.id,
      );
      stockList[index] = res.data!;
      logger.i(stockList);
    }

    return res.success;
  }

  @action
  Future<void> deleteLogoStock({required int stockId}) async {
    await _stockRepository.deleteLogoStock(
      stockId: stockId,
    );
  }

  @action
  Future<void> deleteStock({required int stockId}) async {
    final res = await _stockRepository.deleteStock(
      stockId: stockId,
    );
    if (res.success) {
      stockList.removeWhere((element) => element.id == stockId);
      logger.i(stockList);
    }
  }
}
