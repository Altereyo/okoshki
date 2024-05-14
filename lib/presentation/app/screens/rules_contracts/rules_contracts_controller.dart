import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/app_document.dart';
import 'package:okoshki/domain/state/app/app_documents_store.dart';

part 'rules_contracts_controller.g.dart';

// ignore: library_private_types_in_public_api
class RulesContractsController = _RulesContractsController
    with _$RulesContractsController;

abstract class _RulesContractsController with Store {
  _RulesContractsController({
    required AppDocumentsStore appDocumentsStore,
  }) : _appDocumentsStore = appDocumentsStore;
  final AppDocumentsStore _appDocumentsStore;

  bool get isLoading => _appDocumentsStore.isLoading;

  List<AppDocument> get appDocumentsCustomerList => _appDocumentsStore.appDocumentsCustomerList;
  List<AppDocument> get appDocumentsSaloonList => _appDocumentsStore.appDocumentsSaloonList;
}
