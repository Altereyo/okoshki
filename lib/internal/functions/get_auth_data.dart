
import 'dart:io';

import 'package:okoshki/data/services/firebase_service.dart';
import 'package:okoshki/internal/functions/get_device_id.dart';
import 'package:okoshki/internal/utils/sl.dart';

Future<({String deviceId, String deviceType, String firebaseToken})> getAuthData() async {
  final firebaseToken = sl<FirebaseService>().fcmToken!;
  final deviceId = await getDeviceId();

  if (Platform.isIOS) {
    return (firebaseToken: firebaseToken, deviceId: deviceId!, deviceType: 'ios');
  } else if (Platform.isAndroid) {
    return (firebaseToken: firebaseToken, deviceId: deviceId!, deviceType: 'android');
  } else {
    throw Exception('Unknown platform');
  }
}
