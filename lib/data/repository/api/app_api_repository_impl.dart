import 'package:okoshki/data/api/rest_client_api.dart';
import 'package:okoshki/data/models/app_document/app_document.dart';
import 'package:okoshki/data/models/help_tip/help_tip.dart';
import 'package:okoshki/data/models/intro_slide/intro_slide.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/app_setting.dart';
import 'package:okoshki/domain/repository/api/app_api_repository.dart';
import 'package:okoshki/internal/functions/safe_api_call.dart';

class AppApiRepositoryImpl extends AppApiRepository {
  final RestClientApi _restClientApi;

  AppApiRepositoryImpl({
    required RestClientApi restClientApi,
  }) : _restClientApi = restClientApi;

  @override
  Future<ApiResource<List<HelpTipModel>>> getHelpTipList(
    String type,
  ) async {
    final apiToBeCalled = _restClientApi.getHelpTipList(
      type,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<IntroSlideModel>>> getIntroSlideList(
    String type,
  ) async {
    final apiToBeCalled = _restClientApi.getIntroSlideList(
      type,
    );
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<AppDocumentModel>>>
      getAppDocumentsCustomerList() async {
    final apiToBeCalled = _restClientApi.getAppDocumentList('c');
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<List<AppDocumentModel>>>
      getAppDocumentsSaloonList() async {
    final apiToBeCalled = _restClientApi.getAppDocumentList('s');
    return await safeApiCall(apiToBeCalled);
  }

  @override
  Future<ApiResource<AppSetting>> getAppSetting() async {
    final apiToBeCalled = _restClientApi.getAppSetting();
    return await safeApiCall(apiToBeCalled);
  }
}
