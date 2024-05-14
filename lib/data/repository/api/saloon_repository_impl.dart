import 'package:okoshki/data/api/requests/get_saloon_list/get_saloon_list.dart';
import 'package:okoshki/data/api/requests/update_saloon_profile/update_saloon_profile.dart';
import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/saloon_detail/saloon_detail.dart';
import 'package:okoshki/data/models/saloon_list_page/saloon_list_page.dart';
import 'package:okoshki/data/models/search_item/search_item.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/client_blocking.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/domain/repository/api/saloon_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class SaloonRepositoryImpl extends SaloonRepository {
  final RestClientApi _restClientApi;

  SaloonRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<SearchItemModel>>> searchSaloon(
    String search,
  ) async {
    final apiToBeCalled = _restClientApi.searchSaloon(
      search,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<Saloon>>> getFavoriteSaloons() async {
    final apiToBeCalled = _restClientApi.getFavoriteSaloons();
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonListPageModel>> getMySaloon() async {
    const body = GetSaloonListBody(
      owner: true,
    );
    final apiToBeCalled = _restClientApi.getSaloonList(
      body.toJson(),
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonListPageModel>> getSaloonList({
    String? polygon,
    String? point,
    int? distance,
    List<int>? services,
    String? sort,
    String? windows,
    String? search,
    int? cost,
    String? windowsDate,
    int? page,
  }) async {
    final body = GetSaloonListBody(
      polygon: polygon,
      point: point,
      distance: distance,
      services: services?.join(','),
      sort: sort,
      windows: windows,
      search: search,
      cost: cost,
      windowsDate: windowsDate,
      page: page,
      pageSize: 10,
    );
    final apiToBeCalled = _restClientApi.getSaloonList(
      body.toJson(),
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonDetailModel>> getSaloonDetail({
    required int saloonId,
    String? point,
  }) async {
    final apiToBeCalled = _restClientApi.getSaloonDetail(
      saloonId: saloonId,
      point: point,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<SaloonDetailModel>> updateSaloonProfile({
    required int saloonId,
    String? title,
    List<int>? addServices,
    List<int>? removeServices,
    String? site,
    String? description,
    String? setAddress,
  }) async {
    if (site != null &&
        !site.contains('https://') &&
        !site.contains('http://')) {
      site = 'https://$site';
    }
    final body = UpdateSaloonProfileBody(
      title: title,
      addServices: addServices?.join(','),
      removeServices: removeServices?.join(','),
      site: site,
      description: description,
      setAddress: setAddress,
    );
    final apiToBeCalled = _restClientApi.updateSaloonData(
      saloonId: saloonId,
      body: body,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<ClientBlocking>> getClientBlocking({
    required int saloonId,
  }) async {
    final apiToBeCalled = _restClientApi.getClientBlocking(
      saloonId: saloonId,
    );
    return await safeApiCall(apiToBeCalled);
  }
}
