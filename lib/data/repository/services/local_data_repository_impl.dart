import 'package:okoshki/data/services/storage_service.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';

class LocalDataRepositoryImpl extends LocalDataRepository {
  LocalDataRepositoryImpl({required StorageService storageService})
      : _storageService = storageService;

  final StorageService _storageService;

  @override
  String? getToken() => _storageService.getToken;
  @override
  Future setToken(String? token) async => _storageService.setToken = token;

  @override
  bool getIsIntroShown() => _storageService.getIsIntroShown;
  @override
  Future setIsIntroShown(bool value) async => _storageService.setIsIntroShown = value;

  @override
  bool getIsCustomerTutorialShown() => _storageService.getIsCustomerTutorialShown;
  @override
  Future setIsCustomerTutorialShown(bool value) async => _storageService.setIsCustomerTutorialShown = value;

  @override
  bool getIsSaloonSettingsPassed() => _storageService.getIsSaloonSettingsPassed;
  @override
  Future setIsSaloonSettingsPassed(bool value) async => _storageService.setIsSaloonSettingsPassed = value;

  @override
  bool getIsSaloon() => _storageService.getIsSaloon;
  @override
  Future setIsSaloon(bool value) async => _storageService.setIsSaloon = value;

  @override
  Future<void> clearStorage() => _storageService.clear();
}