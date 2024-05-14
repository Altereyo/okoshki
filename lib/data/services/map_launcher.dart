import 'package:map_launcher/map_launcher.dart';

class MapLauncherService {
 
  Future< List<AvailableMap>> getAvailableMapList()async{
    return await MapLauncher.installedMaps;
  }


}
