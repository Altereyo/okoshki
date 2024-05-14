abstract class UrlLauncherRepository {
  Future<void> makePhoneCall(String phone);
  Future<void> openInBrowser(String path);
}
