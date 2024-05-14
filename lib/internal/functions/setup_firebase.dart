import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:okoshki/data/services/firebase_service.dart';
import 'package:okoshki/firebase_options.dart';
import 'package:okoshki/internal/utils/sl.dart';

Future<void> setupFirebase(BuildContext context) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await sl<FirebaseService>().init(context);
}