import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_master.dart';

part 'master_window_controller.g.dart';

// ignore: library_private_types_in_public_api
class MasterWindowController = _MasterWindowController
    with _$MasterWindowController;

abstract class _MasterWindowController with Store {
  _MasterWindowController({required this.saloonMaster});
  
  final SaloonMaster saloonMaster;
  
  @observable
  int? windowServiceId;

  @observable
  String? prise;

  @observable
  bool isSelect = false;
}
