import 'package:share_plus/share_plus.dart';

class ShareService {
  Future<void> opensTheSheetToShareTheText({
    required String text,
  }) async {
    return Share.share(text);
  }
}
