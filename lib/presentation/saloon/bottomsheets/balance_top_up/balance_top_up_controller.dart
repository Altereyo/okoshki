import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/state/saloon/balance_store.dart';
import 'package:okoshki/internal/utils/logger.dart';

import 'package:okoshki/internal/utils/sl.dart';

part 'balance_top_up_controller.g.dart';

// ignore: library_private_types_in_public_api
class BalanceTopUpController = _BalanceTopUpController
    with _$BalanceTopUpController;

abstract class _BalanceTopUpController with Store {
  _BalanceTopUpController({
    required BalanceSaloonStore balanceSaloonStore,
  }) : _balanceSaloonStore = balanceSaloonStore;
  final BalanceSaloonStore _balanceSaloonStore;

  final TextEditingController textEditingController = TextEditingController();
  final GroupButtonController groupButtonController = GroupButtonController();

  void init() {
    reaction((p0) => button, (button) {
      switch (button) {
        case 0:
          {
            sum = '1000';
            textEditingController.text = '1000';
          }
        case 1:
          {
            sum = '2000';
            textEditingController.text = '2000';
          }
        case 2:
          {
            sum = '5000';
            textEditingController.text = '5000';
          }
        case 3:
          {
            sum = '10000';
            textEditingController.text = '10000';
          }
      }
    });
  }

  @computed
  bool get isEnabledButtonTopUp => sum.isNotEmpty;

  @observable
  String sum = '';

  @observable
  int? button;

  Future<void> topUpBalance() async {
    await _balanceSaloonStore.getSaloonPaymentPdf(sum: sum);
    logger.i(sum);
  }

  Future<void> dispose() async {
    await sl.resetLazySingleton<BalanceTopUpController>();
  }
}
