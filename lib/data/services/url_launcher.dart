import 'package:okoshki/internal/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<void> makePhoneCall(String phone) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    try {
      await launchUrl(launchUri);
    } catch (e) {
      logger.e(e.toString());
    }
  }

  Future<void> openInBrowser(String path) async {
    final Uri launchUri = Uri.parse(path);
    try {
      await launchUrl(launchUri, mode: LaunchMode.inAppBrowserView);
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
