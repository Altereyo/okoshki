import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/client_blocking.dart';
import 'package:okoshki/domain/state/customer/saloons_list_store.dart';

part 'client_blocking_controller.g.dart';

// ignore: library_private_types_in_public_api
class ClientBlockingController = _ClientBlockingController
    with _$ClientBlockingController;

abstract class _ClientBlockingController with Store {
  _ClientBlockingController({
    required SaloonsListCustomerStore saloonsListCustomerStore,
    required int saloonId,
  })  : _saloonsListCustomerStore = saloonsListCustomerStore,
        _saloonId = saloonId;

  final SaloonsListCustomerStore _saloonsListCustomerStore;
  final int _saloonId;

  Future<void> init() async {
    await _getDateBlockingClient();
    isLoading = false;
  }

  @observable
  ClientBlocking? clientBlocking;

  @observable
  bool isLoading = true;

  @action
  Future<void> _getDateBlockingClient() async {
    clientBlocking = await _saloonsListCustomerStore.getClientBlocking(
      saloonId: _saloonId,
    );
  }
}
