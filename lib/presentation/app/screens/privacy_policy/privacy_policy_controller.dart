import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/app_document.dart';
import 'package:okoshki/domain/state/app/app_documents_store.dart';

part 'privacy_policy_controller.g.dart';

// ignore: library_private_types_in_public_api
class PrivacyPolicyController = _PrivacyPolicyController
    with _$PrivacyPolicyController;

abstract class _PrivacyPolicyController with Store {
  _PrivacyPolicyController({
    required AppDocumentsStore appDocumentsStore,
  }) : _appDocumentsStore = appDocumentsStore;
  final AppDocumentsStore _appDocumentsStore;

  bool get isLoading => _appDocumentsStore.isLoading;

  AppDocument? get appDocumentPrivacyPolycy {
    for (var appDocument in _appDocumentsStore.appDocumentsCustomerList) {
      if (appDocument.title == 'Политика конфиденциальности') {
        return appDocument;
      }
    }
    return null;
  }
}
