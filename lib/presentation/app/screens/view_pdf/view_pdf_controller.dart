import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/repository/services/url_launcher_repository.dart';

part 'view_pdf_controller.g.dart';

// ignore: library_private_types_in_public_api
class ViewPDFController = _ViewPDFController with _$ViewPDFController;

abstract class _ViewPDFController with Store {
  _ViewPDFController({
    required UrlLauncherRepository urlLauncherRepository,
  }) : _urlLauncherRepository = urlLauncherRepository;

  final UrlLauncherRepository _urlLauncherRepository;

  Future<void> openInBrowser(String path)async{
    _urlLauncherRepository.openInBrowser(path);
  }
}
