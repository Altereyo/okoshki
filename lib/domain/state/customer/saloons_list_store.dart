import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/client_blocking.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/domain/entities/search_item.dart';
import 'package:okoshki/domain/repository/api/saloon_repository.dart';
import 'package:okoshki/domain/repository/services/geo_repository.dart';
import 'package:okoshki/domain/state/customer/customer_store.dart';

part 'saloons_list_store.g.dart';

// ignore: library_private_types_in_public_api
class SaloonsListCustomerStore = _SaloonsListCustomerStore
    with _$SaloonsListCustomerStore;

abstract class _SaloonsListCustomerStore with Store {
  _SaloonsListCustomerStore({
    required GeoRepository geoRepository,
    required SaloonRepository saloonRepository,
    required CustomerStore customerStore,
  })  : _geoRepository = geoRepository,
        _saloonRepository = saloonRepository,
        _customerStore = customerStore;

  final GeoRepository _geoRepository;
  final SaloonRepository _saloonRepository;
  final CustomerStore _customerStore;

  Future<void> init() async {
    final point = await _geoRepository.getPoint();
    if (point != null) {
      await asyncWhen((_) => _customerStore.isLoading == false);
      sortSaloon = 'distance';
      pointSaloon = point;
      isGeolocation = true;
    } else {
      //сортировка по рейтингу и г Москва
      //как сделать город?
      sortSaloon = '-rating';
    }
    await getSaloonsList();
  }

  Future<void> refresh() async {
    isLoading = true;
    init().whenComplete(() => isLoading = false);
  }

  @observable
  bool isLoading = true;

  @observable
  String? sortSaloon;

  @observable
  String? pointSaloon;

  @observable
  int? pageSaloonList;

  @observable
  bool? isLastPage;

  @observable
  int? distance;

  @observable
  List<int>? services;

  @observable
  String? windows;

  @observable
  int? cost;

  @observable
  String? windowsDate;

  @observable
  bool isFiltersSorting = false;

  @observable
  bool isGeolocation = false;

  @observable
  ObservableList<Saloon> saloonsList = ObservableList();

  Future<void> getSaloonsList() async {
    isLoading = true;
    pageSaloonList = 1;
    final res = await _saloonRepository.getSaloonList(
      point: pointSaloon,
      distance: distance,
      services: services,
      sort: sortSaloon,
      windows: windows,
      cost: cost,
      windowsDate: windowsDate,
      page: pageSaloonList,
    );

    if (res.success) {
      saloonsList = ObservableList<Saloon>.of(res.data!.results);
      isLoading = false;
      isLastPage = res.data!.isLastPage;
    }
  }

  //pagination
  @action
  Future<void> getSaloonListAdd() async {
    if (isLastPage == false) {
      pageSaloonList = pageSaloonList! + 1;
    }
    isLastPage = true;
    final res = await _saloonRepository.getSaloonList(
      point: pointSaloon,
      sort: sortSaloon,
      page: pageSaloonList,
    );
    if (res.success) {
      saloonsList.addAll(res.data!.results);
      isLastPage = res.data!.isLastPage;
    }
  }

  //search
  @observable
  bool isLoadingSearch = true;

  @observable
  ObservableList<Saloon> saloonsSearchList = ObservableList();

  Future<void> getSaloonsSeacrhList({
    String? search,
  }) async {
    isLoadingSearch = true;
    final res = await _saloonRepository.getSaloonList(
      search: search,
    );

    if (res.success) {
      saloonsSearchList = ObservableList<Saloon>.of(res.data!.results);
      isLoadingSearch = false;
    }
  }

  //map
  @observable
  List<Saloon> mapSaloons = [];

  @action
  Future<void> getSaloonPolygon(String polygon) async {
    final res = await _saloonRepository.getSaloonList(polygon: polygon);

    if (res.success) {
      mapSaloons = res.data!.results;
    }
  }

  //searchsaloon autocomplete
  Future<List<SearchItem>> getSearchSaloonItemList(String search) async {
    final res = await _saloonRepository.searchSaloon(search);
    if (res.success) {
      return res.data!;
    }
    return [];
  }

  Future<ClientBlocking?> getClientBlocking({
    required int saloonId,
  }) async {
    final res = await _saloonRepository.getClientBlocking(
      saloonId: saloonId,
    );
    if (res.success) {
      return res.data!;
    }
    return null;
  }
}
