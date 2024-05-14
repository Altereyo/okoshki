import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/repository/services/url_launcher_repository.dart';
import 'package:okoshki/domain/state/app/app_setting_store.dart';

part 'contact_us_controller.g.dart';

// ignore: library_private_types_in_public_api
class ContactUsController = _ContactUsController with _$ContactUsController;

abstract class _ContactUsController with Store {
  _ContactUsController({
    required AppSettingStore appSettingStore,
    required UrlLauncherRepository urlLauncherRepository,
  })  : _appSettingStore = appSettingStore,
        _urlLauncherRepository = urlLauncherRepository;

  final AppSettingStore _appSettingStore;
  final UrlLauncherRepository _urlLauncherRepository;

  bool get isLoading => _appSettingStore.isLoading;

  Future<void> makePhoneCall() async {
    final phone = _appSettingStore.appSetting.phoneNumber;
    _urlLauncherRepository.makePhoneCall(phone);
  }

  Future<void> openInBrowser() async {
    const url = 'https://t.me/';
    final path = url + _appSettingStore.appSetting.telegramId;
    _urlLauncherRepository.openInBrowser(path);
  }
}
