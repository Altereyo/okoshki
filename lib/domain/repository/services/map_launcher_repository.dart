import 'package:map_launcher/map_launcher.dart';

abstract class MapLauncherRepository {

 Future< List<AvailableMap>>  getAvailableMapList();
}