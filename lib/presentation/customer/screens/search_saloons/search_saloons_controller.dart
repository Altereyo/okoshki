import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/domain/entities/search_item.dart';
import 'package:okoshki/domain/state/customer/saloons_list_store.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/customer/widgets/map/map_widget_controller.dart';
import 'package:validators2/validators2.dart';

part 'search_saloons_controller.g.dart';

// ignore: library_private_types_in_public_api
class SearchSaloonController = _SearchSaloonController
    with _$SearchSaloonController;

abstract class _SearchSaloonController with Store {
  _SearchSaloonController({
    required SaloonsListCustomerStore homeCustomerStore,
  }) : _homeCustomerStore = homeCustomerStore;

  final SaloonsListCustomerStore _homeCustomerStore;

  List<Saloon> get saloonSearchList => _homeCustomerStore.saloonsSearchList;

  bool get isLoadingSearch => _homeCustomerStore.isLoadingSearch;

  @observable
  String search = '';

  @observable
  bool isMap = false;

  @action
  void onSearch(String text) {
    search = text;
    if (isLength(search, 3)) {
      _getSaloons();
    } else {
      clearSearch();
    }
  }

  @action
  void clearSearch() {
    saloonSearchList.clear();
    search = '';
    sl<MapWidgetController>().closeSaloon();
  }

  @action
  Future<void> _getSaloons() async {
    await _homeCustomerStore.getSaloonsSeacrhList(search: search);
  }

  Future<List<SearchItem>> getSearchSaloonItemList(String search) async {
    return await _homeCustomerStore.getSearchSaloonItemList(search);
  }
}
