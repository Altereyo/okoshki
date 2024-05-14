import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/help_tip.dart';
import 'package:okoshki/domain/entities/intro_slide.dart';
import 'package:okoshki/domain/repository/api/app_api_repository.dart';

part 'app_store.g.dart';

// ignore: library_private_types_in_public_api
class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  _AppStore({required AppApiRepository appApiRepository})
      : _appApiRepository = appApiRepository;

  final AppApiRepository _appApiRepository;

  List<HelpTip> helpTipCustomerList = [];
  List<HelpTip> helpTipSaloonList = [];
  List<IntroSlide> introSlidesCustomerList = [];
  List<IntroSlide> introSlidesSaloonList = [];

  Future<void> init() async {
    await _getHelpTipListCustomer();
    await _getHelpTipListSaloon();
    await _getIntroSlidesCustomerList();
    await _getIntroSlidesSaloonList();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  Future<void> _getHelpTipListCustomer() async {
    final res = await _appApiRepository.getHelpTipList('c');

    if (res.success) {
      helpTipCustomerList.addAll(res.data!);
    }
  }

  Future<void> _getHelpTipListSaloon() async {
    final res = await _appApiRepository.getHelpTipList('s');

    if (res.success) {
      helpTipSaloonList.addAll(res.data!);
    }
  }

  Future<void> _getIntroSlidesCustomerList() async {
    final res = await _appApiRepository.getIntroSlideList('c');

    if (res.success) {
      introSlidesCustomerList.addAll(res.data!);
    }
  }

  Future<void> _getIntroSlidesSaloonList() async {
    final res = await _appApiRepository.getIntroSlideList('s');

    if (res.success) {
      introSlidesSaloonList.addAll(res.data!);
    }
  }
}
