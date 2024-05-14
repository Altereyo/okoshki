import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_document.dart';
import 'package:okoshki/domain/state/saloon/documents_store.dart';

part 'documents_controller.g.dart';

// ignore: library_private_types_in_public_api
class DocumentsSaloonController = _DocumentsSaloonController
    with _$DocumentsSaloonController;

abstract class _DocumentsSaloonController with Store {
  _DocumentsSaloonController({
    required DocumentsSaloonStore documentsSaloonStore,
  }) : _documentsSaloonStore = documentsSaloonStore;

  final DocumentsSaloonStore _documentsSaloonStore;

  @computed
  bool get isLoading => _documentsSaloonStore.isLoading;

  List<SaloonDocument> get saloonDocumentsList => _documentsSaloonStore.saloonDocumentsList;
}
