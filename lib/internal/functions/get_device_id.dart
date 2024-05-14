import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<String?> getDeviceId() async {
  if (Platform.isIOS) {
    final deviceInfo = DeviceInfoPlugin();
    final iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor;
  } else if (Platform.isAndroid) {
    const androidIdPlugin = AndroidId();
    return await androidIdPlugin.getId();
  } else {
    throw Exception('Unknown platform');
  }
}
