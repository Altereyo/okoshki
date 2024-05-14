import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/premium.dart';
import 'package:okoshki/domain/state/saloon/auth_store.dart';
import 'package:okoshki/domain/state/saloon/tariffs_store.dart';

part 'settings_controller.g.dart';

// ignore: library_private_types_in_public_api
class SettingsSaloonController = _SettingsSaloonController
    with _$SettingsSaloonController;

abstract class _SettingsSaloonController with Store {
  _SettingsSaloonController({
    required AuthSaloonStore authSaloonStore,
    required TariffsSaloonStore tariffsSaloonStore,
  })  : _authSaloonStore = authSaloonStore,
        _saloonTariffsStore = tariffsSaloonStore;

  final AuthSaloonStore _authSaloonStore;
  final TariffsSaloonStore _saloonTariffsStore;

  bool get isLoading => _saloonTariffsStore.isLoading;

  Premium? get premium => _saloonTariffsStore.premium;

  Future<void> logoutSaloon() async {
    //logout saloon
    await _authSaloonStore.logoutSaloon();
  }
}
