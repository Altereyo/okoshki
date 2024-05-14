import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/premium.dart';
import 'package:okoshki/domain/entities/premium_tariff.dart';
import 'package:okoshki/domain/repository/api/tariffs_repository.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/internal/utils/logger.dart';

part 'tariffs_store.g.dart';

// ignore: library_private_types_in_public_api
class TariffsSaloonStore = _TariffsSaloonStore with _$TariffsSaloonStore;

abstract class _TariffsSaloonStore with Store {
  _TariffsSaloonStore({
    required SaloonStore saloonStore,
    required TariffsRepository tariffsRepository,
  })  : _saloonStore = saloonStore,
        _tariffsRepository = tariffsRepository;

  final SaloonStore _saloonStore;
  final TariffsRepository _tariffsRepository;

  @observable
  bool isLoading = true;

  @observable
  ObservableList<PremiumTariff> premiumTarriffsList = ObservableList();

  @observable
  Premium? premium;

  Future<void> init() async {
    await asyncWhen((_) => _saloonStore.isLoading == false);
    await _getPrimiumTariffsList();
    await _getSaloonPremiumTariffsList();
    isLoading = false;
  }

  @action
  Future<void> _getPrimiumTariffsList() async {
    final res = await _tariffsRepository.getPremiumTariffsList();

    if (!res.success) {
      logger.e(res.message);
    }
    premiumTarriffsList = ObservableList.of(res.data!);
  }

  @action
  Future<bool> createSaloonPremiumTariff({
    required int premiumTariffId,
  }) async {
    
    final res = await _tariffsRepository.createSaloonPremiumTariff(
      saloonId: _saloonStore.saloonId,
      premiumTariffId: premiumTariffId,
    );

    if (!res.success) {
      logger.e(res.message);
      return false;
    }

    premium = res.data!;
    return true;
  }

  @action
  Future<void> _getSaloonPremiumTariffsList() async {
    final res = await _tariffsRepository.getSaloonPremiumTariffsList(
      saloonId: _saloonStore.saloonId,
    );
    if (!res.success) {
      logger.e(res.message);
    }
    if (_saloonStore.saloonDetail.isPremium == false) {
      return;
    }
    if (res.data!.isNotEmpty) {
      res.data!.sort((a, b) => a.endDate.compareTo(b.endDate));
      premium = res.data!.last;
    }
  }
}
