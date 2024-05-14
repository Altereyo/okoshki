import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/app_document.dart';
import 'package:okoshki/domain/state/app/app_documents_store.dart';

part 'terms_of_service_controller.g.dart';

// ignore: library_private_types_in_public_api
class TermsOfServiceController = _TermsOfServiceController
    with _$TermsOfServiceController;

abstract class _TermsOfServiceController with Store {
  _TermsOfServiceController({
    required AppDocumentsStore appDocumentsStore,
  }) : _appDocumentsStore = appDocumentsStore;
  final AppDocumentsStore _appDocumentsStore;

  bool get isLoading => _appDocumentsStore.isLoading;

  AppDocument? get appDocumentTermsOfService {
    for (var appDocument in _appDocumentsStore.appDocumentsCustomerList) {
      if (appDocument.title == 'Условия сервиса') {
        return appDocument;
      }
    }
    return null;
  }
}
