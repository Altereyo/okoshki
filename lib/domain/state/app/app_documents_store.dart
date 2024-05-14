import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/app_document.dart';
import 'package:okoshki/domain/repository/api/app_api_repository.dart';

part 'app_documents_store.g.dart';

// ignore: library_private_types_in_public_api
class AppDocumentsStore = _AppDocumentsStore with _$AppDocumentsStore;

abstract class _AppDocumentsStore with Store {
  _AppDocumentsStore({required AppApiRepository appApiRepository})
      : _appApiRepository = appApiRepository;

  final AppApiRepository _appApiRepository;
  
  List<AppDocument> appDocumentsCustomerList = [];
  List<AppDocument> appDocumentsSaloonList = [];

  Future<void> init() async {
    await _getAppDocumentsCustomerList();
    await _getAppDocumentsSaloonList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  Future<void> _getAppDocumentsCustomerList() async {
    final res = await _appApiRepository.getAppDocumentsCustomerList();

    if (res.success) {
      appDocumentsCustomerList.addAll(res.data!);
    }
  }

  Future<void> _getAppDocumentsSaloonList() async {
    final res = await _appApiRepository.getAppDocumentsSaloonList();

    if (res.success) {
      appDocumentsSaloonList.addAll(res.data!);
    }
  }
}
