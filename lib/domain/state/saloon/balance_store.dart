import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/extensions/date_time.dart';
import 'package:okoshki/domain/entities/saloon_balance.dart';
import 'package:okoshki/domain/repository/api/saloon_balance_repository.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';
import 'package:okoshki/internal/utils/logger.dart';

part 'balance_store.g.dart';

// ignore: library_private_types_in_public_api
class BalanceSaloonStore = _BalanceSaloonStore with _$BalanceSaloonStore;

abstract class _BalanceSaloonStore with Store {
  _BalanceSaloonStore({
    required SaloonBalanceRepository saloonBalanceRepository,
    required SaloonStore saloonStore,
  })  : _saloonBalanceRepository = saloonBalanceRepository,
        _saloonStore = saloonStore;

  final SaloonBalanceRepository _saloonBalanceRepository;
  final SaloonStore _saloonStore;

  Future<void> init() async {
    await asyncWhen((_) => _saloonStore.isLoading == false);
    initReaction();
    isLoading = false;
  }

  void initReaction() async {
    reaction((p0) => fromDateTime, (p0) async => await getSaloonBalanceList());
    reaction((p0) => toDateTime, (p0) async => await getSaloonBalanceList());
  }

  @observable
  bool isLoading = true;

  @observable
  DateTime fromDateTime = DateTime.now();

  @observable
  DateTime toDateTime = DateTime.now();

  @observable
  ObservableList<SaloonBalance> saloonBalanceList = ObservableList();

  @action
  Future<void> getSaloonBalanceList() async {
    isLoading = true;
    final res = await _saloonBalanceRepository.getSaloonBalanceList(
      saloonId: _saloonStore.saloonId,
      from: fromDateTime.getStartDateTimeInMonth,
      to: toDateTime.getlastDateTimeInMonth,
    );

    if (res.success) {
      saloonBalanceList = ObservableList.of(res.data!);
      logger.i(saloonBalanceList);
      isLoading = false;
    }
  }

  Future<void> getSaloonPaymentPdf({required String sum}) async {
    await _saloonBalanceRepository.getSaloonPaymentPdf(
      saloonId: _saloonStore.saloonId,
      sum: sum,
    );
  }
}
