import 'package:okoshki/data/services/share_service.dart';
import 'package:okoshki/domain/repository/services/share_repository.dart';

class ShareRepositoryImpl extends ShareRepository {
  ShareRepositoryImpl({required ShareService shareService})
      : _shareService = shareService;
      
  final ShareService _shareService;

  @override
  Future<void> opensTheSheetToShareTheText({required String text}) async {
    return _shareService.opensTheSheetToShareTheText(text: text);
  }
}
