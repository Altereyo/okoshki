import 'package:okoshki/domain/entities/api_response.dart';
import 'package:okoshki/domain/entities/app_document.dart';
import 'package:okoshki/domain/entities/app_setting.dart';
import 'package:okoshki/domain/entities/help_tip.dart';
import 'package:okoshki/domain/entities/intro_slide.dart';

abstract class AppApiRepository {
  /// c as Customer OR s as Saloon
  Future<ApiResource<List<HelpTip>>> getHelpTipList(String type);
  /// c as Customer OR s as Saloon
  Future<ApiResource<List<IntroSlide>>> getIntroSlideList(String type);
  Future<ApiResource<List<AppDocument>>> getAppDocumentsCustomerList();
  Future<ApiResource<List<AppDocument>>> getAppDocumentsSaloonList();
  Future<ApiResource<AppSetting>> getAppSetting();
}
