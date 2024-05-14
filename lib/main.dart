import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:okoshki/application.dart';
import 'package:okoshki/internal/functions/setup_dependencies.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Intl.defaultLocale = 'ru_RU';
  initializeDateFormatting();
  await setupDependencies();
  // runApp(TestingApiScreen());
  runApp(const Application());
}
