import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/domain/entities/saloon_detail.dart';
import 'package:okoshki/domain/repository/api/saloon_repository.dart';

part 'saloon_store.g.dart';

// ignore: library_private_types_in_public_api
class SaloonStore = _SaloonStore with _$SaloonStore;

abstract class _SaloonStore with Store {
  _SaloonStore({
    required SaloonRepository saloonRepository,
  }) : _saloonRepository = saloonRepository;

  final SaloonRepository _saloonRepository;

  late Saloon _saloon;
  int get saloonId => _saloon.id;

  Future<void> init() async {
    await _getMySaloon();
    await _getSaloonDetail();
    isLoading = false;
  }

  Future<void> refresh() async {
    isLoading = true;
    init().whenComplete(() => isLoading = false);
  }

  @observable
  bool isLoading = true;

  @observable
  late SaloonDetail _saloonDetail;
  SaloonDetail get saloonDetail => _saloonDetail;

  @action
  void setSallonDetail(SaloonDetail saloonDetail) =>
      _saloonDetail = saloonDetail;

  @action
  Future<void> updateSaloonDetail({
    String? title,
    String? site,
    String? description,
    List<int>? addServices,
    List<int>? removeServices,
    String? setAddress,
  }) async {
    final res = await _saloonRepository.updateSaloonProfile(
      saloonId: saloonId,
      title: title,
      site: site,
      description: description,
      addServices: addServices,
      removeServices: removeServices,
      setAddress: setAddress,
    );

    if (res.success) {
      _saloonDetail = res.data!;
    }
  }

  Future<void> _getMySaloon() async {
    final res = await _saloonRepository.getMySaloon();

    if (res.success) {
      _saloon = res.data!.results.first;
    }
  }

  Future<void> _getSaloonDetail() async {
    final res = await _saloonRepository.getSaloonDetail(saloonId: saloonId);

    if (res.success) {
      _saloonDetail = res.data!;
    }
  }

 
}
