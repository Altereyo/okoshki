import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/saloon.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/domain/state/customer/saloons_list_store.dart';

part 'home_controller.g.dart';

// ignore: library_private_types_in_public_api
class HomeCustomerController = _HomeCustomerController
    with _$HomeCustomerController;

abstract class _HomeCustomerController with Store {
  _HomeCustomerController({
    required LocalDataRepository localDataRepository,
    required SaloonsListCustomerStore saloonListCustomerStore,
  })  : _localDataRepository = localDataRepository,
        _saloonListCustomerStore = saloonListCustomerStore;

  final LocalDataRepository _localDataRepository;
  final SaloonsListCustomerStore _saloonListCustomerStore;
  final ScrollController controllerScroll = ScrollController();

  Future<void> init() async {
    isTutorial = _localDataRepository.getIsCustomerTutorialShown();
    initScrooll();
  }

  @observable
  bool isNavigationBar = true;

  List<Saloon> get saloonsList => _saloonListCustomerStore.saloonsList;

  @computed
  bool? get isLastPage => _saloonListCustomerStore.isLastPage;

  @observable
  bool isMap = false;

  @computed
  bool get isLoading => _saloonListCustomerStore.isLoading;

  @computed
  bool get isFiltersSorting => _saloonListCustomerStore.isFiltersSorting;

  @observable
  bool isTutorial = false;

  @action
  Future<void> setIsTutorial() async {
    await _localDataRepository.setIsCustomerTutorialShown(true);
    isTutorial = true;
  }

  void initScrooll() {
    controllerScroll.addListener(() {
      final userScroll = controllerScroll.position.userScrollDirection ==
          ScrollDirection.reverse;
      if (userScroll && isNavigationBar) {
        isNavigationBar = false;
      }
      if (!userScroll && !isNavigationBar) {
        isNavigationBar = true;
      }
      if (controllerScroll.position.extentAfter == 0.0 &&
          _saloonListCustomerStore.isLastPage == false) {
        _saloonListCustomerStore.getSaloonListAdd();
      }
    });
  }

  void dispose() {
    controllerScroll.dispose();
  }

  Future<void> get onRefresh => _saloonListCustomerStore.refresh();
}
