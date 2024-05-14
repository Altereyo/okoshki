import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/client_blocking.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';
import 'package:okoshki/domain/entities/saloon_list_page.dart';
import 'package:okoshki/domain/entities/search_item.dart';

abstract class SaloonRepository {
  Future<ApiResource<List<SearchItem>>> searchSaloon(
    String search,
  );

  Future<ApiResource<List<Saloon>>> getFavoriteSaloons();

  Future<ApiResource<SaloonListPage>> getMySaloon();

  Future<ApiResource<SaloonListPage>> getSaloonList({
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
  });

  Future<ApiResource<SaloonDetail>> getSaloonDetail({
    required int saloonId,
    String? point,
  });

  Future<ApiResource<SaloonDetail>> updateSaloonProfile({
    required int saloonId,
    String? title,
    List<int>? addServices,
    List<int>? removeServices,
    String? site,
    String? description,
    String? setAddress,
  });

  Future<ApiResource<ClientBlocking>> getClientBlocking({
    required int saloonId,
  });
}
