import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/intro_slide.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/domain/state/app/app_store.dart';

part 'intro_controller.g.dart';

// ignore: library_private_types_in_public_api
class IntroSaloonController = _IntroSaloonController
    with _$IntroSaloonController;

abstract class _IntroSaloonController with Store {
  _IntroSaloonController({
    required LocalDataRepository localDataRepository,
    required AppStore appStore,
  })  : _localDataRepository = localDataRepository,
        _appStore = appStore;

  final LocalDataRepository _localDataRepository;
  final AppStore _appStore;

  List<IntroSlide> get introSlidesSaloonList => _appStore.introSlidesSaloonList;

  @computed
  bool get isLoading => _appStore.isLoading;

  @observable
  int indexPage = 0;

  @action
  void setIndex(int index) {
    indexPage = index;
  }
   Future<void> setLocalDataRepository() async {
    await _localDataRepository.setIsIntroShown(true);
    await _localDataRepository.setIsSaloon(true);
  }
}
