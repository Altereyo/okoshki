import 'package:mobx/mobx.dart';
import 'package:okoshki/domain/entities/app_setting.dart';
import 'package:okoshki/domain/repository/api/app_api_repository.dart';
import 'package:okoshki/internal/utils/logger.dart';

part 'app_setting_store.g.dart';

// ignore: library_private_types_in_public_api
class AppSettingStore = _AppSettingStore with _$AppSettingStore;

abstract class _AppSettingStore with Store {
  _AppSettingStore({required AppApiRepository appApiRepository})
      : _appApiRepository = appApiRepository;

  final AppApiRepository _appApiRepository;
  late AppSetting appSetting;

  Future<void> init() async {
    await _getAppSetting();
    isLoading = false;
  }

  @observable
  bool isLoading = true;

  Future<void> _getAppSetting() async {
    final res = await _appApiRepository.getAppSetting();

    if (res.success) {
      appSetting = res.data!;
      logger.i(res.data);
    }
  }
}
