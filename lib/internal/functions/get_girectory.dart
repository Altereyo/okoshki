
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<Directory?> getDirectory() async {
  Directory? directory;
  if (Platform.isIOS) {
    directory = await getApplicationDocumentsDirectory();
  } else {
    directory = Directory('/storage/emulated/0/Download');
    if (!await directory.exists())
      directory = await getExternalStorageDirectory();
  }
  return directory;
}
