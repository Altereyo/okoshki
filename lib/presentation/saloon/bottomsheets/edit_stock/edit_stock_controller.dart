import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/stock.dart';
import 'package:okoshki/domain/state/saloon/stock_store.dart';

part 'edit_stock_controller.g.dart';

// ignore: library_private_types_in_public_api
class EditStockController = _EditStockController with _$EditStockController;

abstract class _EditStockController with Store {
  _EditStockController({
    required StockSaloonStore stockSaloonStore,
    required Stock stock,
  })  : _stockSaloonStore = stockSaloonStore,
        _stock = stock;

  final StockSaloonStore _stockSaloonStore;
  final Stock _stock;

  void init() {
    title = _stock.title;
    duration = _stock.duration;
    description = _stock.description ?? '';
    logo = _stock.logo;
  }

  @observable
  String title = '';

  @observable
  String duration = '';

  @observable
  String description = '';

  @observable
  String? logo;

  @computed
  bool get isEnabledButtonEdit => title.isNotEmpty && duration.isNotEmpty;

  Future<bool> updateStock() async {
    if(logo == null && _stock.logo !=null){
        await _stockSaloonStore.deleteLogoStock(stockId: _stock.id);
    }
    return await _stockSaloonStore.updateStock(
      stockId: _stock.id,
      title: title == _stock.title ? null : title,
      duration: duration == _stock.duration ? null : duration,
      description: description == _stock.description ? null : description,
      logo: logo == _stock.logo
          ? null
          : logo == null
              ? null
              : File(logo!),
    );
  }
}
