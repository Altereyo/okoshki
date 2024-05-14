import 'dart:io';

import 'package:okoshki/data/services/snackbar_service.dart';
import 'package:okoshki/internal/functions/get_girectory.dart';
import 'package:okoshki/internal/utils/sl.dart';

Future<void> downloadStorageDirectory({
  required List<int> bytes,
  required String title,
}) async {
  final directory = await getDirectory();

  if (directory != null) {
    final file = File('${directory.path}/$title.pdf');

    await file.writeAsBytes(bytes);
    sl<SnackbarService>().showCustomSnack(
      content: 'Файл загружен: ${directory.path}/$title.pdf',
    );
  }
}
