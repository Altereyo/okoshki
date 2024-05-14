import 'package:map_launcher/map_launcher.dart';
import 'package:okoshki/data/services/map_launcher.dart';
import 'package:okoshki/domain/repository/services/map_launcher_repository.dart';

class MapLauncherRepositoryImpl extends MapLauncherRepository {
  MapLauncherRepositoryImpl({
    required MapLauncherService mapLauncherService,
  }) : _mapLauncherService = mapLauncherService;

  final MapLauncherService _mapLauncherService;

  @override
  Future<List<AvailableMap>> getAvailableMapList() {
   return _mapLauncherService.getAvailableMapList();
  }
}
