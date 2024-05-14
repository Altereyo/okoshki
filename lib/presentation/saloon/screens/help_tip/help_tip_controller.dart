import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/help_tip.dart';
import 'package:okoshki/domain/state/app/app_store.dart';

part 'help_tip_controller.g.dart';

// ignore: library_private_types_in_public_api
class HelpTipSaloonController = _HelpTipSaloonController
    with _$HelpTipSaloonController;

abstract class _HelpTipSaloonController with Store {
  _HelpTipSaloonController({
    required AppStore appStore,
  }) : _appStore = appStore;

  final AppStore _appStore;
  
  @computed
  bool get isLoading => _appStore.isLoading;

  List<HelpTip> get helpTipSaloonList => _appStore.helpTipSaloonList;
}
