import 'package:get_storage/get_storage.dart';

class StorageService {
  final _storage = GetStorage();

  Future<void> clear() => _storage.erase();

  //token
  String? get getToken => _storage.read('token');
  set setToken(String? value) => _storage.write('token', value);

  //isIntroShown
  bool get getIsIntroShown => _storage.read('isIntroShown') ?? false;
  set setIsIntroShown(bool value) => _storage.write('isIntroShown', value);

  //isCustomerTutorialShown
  bool get getIsCustomerTutorialShown => _storage.read('isCustomerTutorialShown') ?? false;
  set setIsCustomerTutorialShown(bool value) => _storage.write('isCustomerTutorialShown', value);

  //isSaloonSettingsPassed
  bool get getIsSaloonSettingsPassed => _storage.read('isSaloonSettingsPassed') ?? false;
  set setIsSaloonSettingsPassed(bool value) => _storage.write('isSaloonSettingsPassed', value);

  //isSaloon
  bool get getIsSaloon => _storage.read('isSaloon') ?? false;
  set setIsSaloon(bool value) => _storage.write('isSaloon', value);
}