import 'package:group_button/group_button.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/premium.dart';
import 'package:okoshki/domain/entities/premium_tariff.dart';
import 'package:okoshki/domain/state/saloon/tariffs_store.dart';

part 'premium_connect_controller.g.dart';

// ignore: library_private_types_in_public_api
class PremiumConnectController = _PremiumConnectController
    with _$PremiumConnectController;

abstract class _PremiumConnectController with Store {
  _PremiumConnectController({
    required TariffsSaloonStore tariffsSaloonStore,
  }) : _tariffsSaloonStore = tariffsSaloonStore;

  final TariffsSaloonStore _tariffsSaloonStore;
  late GroupButtonController groupButtonController;

  @computed
  bool get isLoading => _tariffsSaloonStore.isLoading;

  @observable
  PremiumTariff? selectPremiumTariff;

  @observable
  int monthButton = 0;

  Premium? get premium => _tariffsSaloonStore.premium;

  ObservableList<PremiumTariff> get premiumTarriffsList =>
      _tariffsSaloonStore.premiumTarriffsList;

  void init() {
    groupButtonController = GroupButtonController(selectedIndex: monthButton);
    selectPremiumTariff = premiumTarriffsList[0];
    initReaction();
  }

  void initReaction() {
    reaction((p0) => monthButton, (button) {
      switch (button) {
        case 0:
          selectPremiumTariff = premiumTarriffsList[0];
        case 1:
          selectPremiumTariff = premiumTarriffsList[1];
        case 2:
          selectPremiumTariff = premiumTarriffsList[2];
      }
    });
  }

  Future<bool> apply() async {
    return await _tariffsSaloonStore.createSaloonPremiumTariff(
      premiumTariffId: selectPremiumTariff!.id,
    );
  }
}
