import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/premium.dart';
import 'package:okoshki/domain/entities/premium_tariff.dart';
import 'package:okoshki/domain/repository/api/tariffs_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class TariffsRepositoryImpl extends TariffsRepository {
  final RestClientApi _restClientApi;

  TariffsRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<PremiumTariff>>> getPremiumTariffsList() async {
    final apiToBeCalled = _restClientApi.getPremiumTariffsList();
    return safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<Premium>> createSaloonPremiumTariff({
    required int saloonId,
    required int premiumTariffId,
  }) async {
    final apiToBeCalled = _restClientApi.createSaloonPremiumTariff(
      saloonId: saloonId,
      premiumTariffId: premiumTariffId,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<Premium>>> getSaloonPremiumTariffsList({
    required int saloonId,
  }) async {
    final apiToBeCalled = _restClientApi.getSaloonPremiumTariffsList(
      saloonId: saloonId,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
