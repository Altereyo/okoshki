import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/help_tip.dart';
import 'package:okoshki/domain/state/app/app_store.dart';

part 'help_tip_controller.g.dart';

// ignore: library_private_types_in_public_api
class HelpTipCustomerController = _HelpTipCustomerController
    with _$HelpTipCustomerController;

abstract class _HelpTipCustomerController with Store {
  _HelpTipCustomerController({required AppStore appStore})
      : _appStore = appStore;
  final AppStore _appStore;

  @computed
  bool get isLoading => _appStore.isLoading;

  List<HelpTip> get helpTipCustomerList => _appStore.helpTipCustomerList;
}
