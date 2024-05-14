import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/premium.dart';
import 'package:okoshki/domain/entities/premium_tariff.dart';

abstract class TariffsRepository {
  Future<ApiResource<List<PremiumTariff>>> getPremiumTariffsList();

  Future<ApiResource<Premium>> createSaloonPremiumTariff({
    required int saloonId,
    required int premiumTariffId,
  });

  Future<ApiResource<List<Premium>>> getSaloonPremiumTariffsList({
    required int saloonId,
  });
}
