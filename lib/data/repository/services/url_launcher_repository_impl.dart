import 'package:okoshki/data/services/url_launcher.dart';
import 'package:okoshki/domain/repository/services/url_launcher_repository.dart';

class UrlLauncherRepositoryImpl extends UrlLauncherRepository {
  UrlLauncherRepositoryImpl({
    required UrlLauncherService urlLauncherService,
  }) : _urlLauncherService = urlLauncherService;

  final UrlLauncherService _urlLauncherService;

  @override
  Future<void> makePhoneCall(String phone) async {
    await _urlLauncherService.makePhoneCall(phone);
  }

  @override
  Future<void> openInBrowser(String path) async {
    await _urlLauncherService.openInBrowser(path);
  }
}
