import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon_document.dart';
import 'package:okoshki/domain/repository/api/saloon_documents_repository.dart';
import 'package:okoshki/domain/state/saloon/saloon_store.dart';

part 'documents_store.g.dart';

// ignore: library_private_types_in_public_api
class DocumentsSaloonStore = _DocumentsSaloonStore with _$DocumentsSaloonStore;

abstract class _DocumentsSaloonStore with Store {
  _DocumentsSaloonStore({
    required SaloonStore saloonStore,
    required SaloonDocumentsRepository documentsRepository,
  })  : _saloonStore = saloonStore,
        _documentsRepository = documentsRepository;

  final SaloonStore _saloonStore;
  final SaloonDocumentsRepository _documentsRepository;

  Future<void> init() async {
    await asyncWhen((_) => _saloonStore.isLoading == false);
    await _getSaloonDocumentsList();
    isLoading = false;
  }

  List<SaloonDocument> saloonDocumentsList = [];

  @observable
  bool isLoading = true;

  Future<void> _getSaloonDocumentsList() async {
    final res = await _documentsRepository.getSaloonDocumentList(
      _saloonStore.saloonId,
    );

    if (res.success) {
      saloonDocumentsList.addAll(res.data!);
    }
  }
}
