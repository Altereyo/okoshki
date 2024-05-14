import 'dart:async';

import 'package:mobx/mobx.dart';

part 'test_api_store.g.dart';

// ignore: library_private_types_in_public_api
class TestApiStore = _TestApiStore with _$TestApiStore;

abstract class _TestApiStore with Store {
  _TestApiStore();

  @observable
  bool isLoading = false;

  @action
  Future<void> func () async {
      print('pressed');
      isLoading = true;
      await Future.delayed(Duration(seconds: 2));
      isLoading = false;
  }
}
