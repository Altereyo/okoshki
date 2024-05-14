abstract class LocalDataRepository {
  String? getToken();
  Future setToken(String? token);

  bool getIsIntroShown();
  Future setIsIntroShown(bool value);

  bool getIsCustomerTutorialShown();
  Future setIsCustomerTutorialShown(bool value);

  bool getIsSaloonSettingsPassed();
  Future setIsSaloonSettingsPassed(bool value);

  bool getIsSaloon();
  Future setIsSaloon(bool value);

  Future<void> clearStorage();
}