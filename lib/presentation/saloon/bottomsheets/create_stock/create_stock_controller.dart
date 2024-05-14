import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/state/saloon/stock_store.dart';
import 'package:okoshki/internal/utils/sl.dart';

part 'create_stock_controller.g.dart';

// ignore: library_private_types_in_public_api
class CreateStockController = _CreateStockController
    with _$CreateStockController;

abstract class _CreateStockController with Store {
  _CreateStockController({
    required StockSaloonStore stockSalonStore,
  }) : _stockSaloonStore = stockSalonStore;

  final StockSaloonStore _stockSaloonStore;

  @observable
  String title = '';

  @observable
  String duration = '';

  @observable
  String description = '';

  @observable
  String? logo;

  @computed
  bool get isEnabledButtonCreate => title.isNotEmpty && duration.isNotEmpty;

  Future<bool> createStock() async {
    return await _stockSaloonStore.createStock(
      title: title,
      duration: duration ,
      description: description.isNotEmpty ? description : null,
      logo: logo != null ? File(logo!) : null,
    );
  }

  void dispose() async {
    await sl.resetLazySingleton<CreateStockController>();
  }
}
