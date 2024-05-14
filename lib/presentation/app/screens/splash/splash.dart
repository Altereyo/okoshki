import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:okoshki/data/services/firebase_service.dart';
import 'package:okoshki/domain/repository/api/auth_repository.dart';
import 'package:okoshki/domain/repository/services/local_data_repository.dart';
import 'package:okoshki/internal/functions/request_permissions.dart';
import 'package:okoshki/internal/functions/setup_firebase.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/router/path_route.dart';
import 'package:okoshki/internal/ui/app_assets.dart';
import 'package:okoshki/internal/utils/sl.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  /// we are animating manually, by .animateTo(), so duration affects only speed of animation
  final Duration animationSpeed = const Duration(seconds: 2);
  AnimationController? animationController;
  bool isTokenValid = true;
  String? pickedPage;
  RemoteMessage? push;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: animationSpeed);
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Future<void> loadData() async {
    animationController?.animateTo(0.2);
    await requestPermissions();
    animationController?.animateTo(0.4);
    await setupFirebase(context);
    animationController?.animateTo(0.5);
    await handleFcmMessages();
    animationController?.animateTo(0.6);
    await checkToken();
    if (push == null) {
      animationController?.animateTo(0.8);
      await pickPage();
    }
    await animationController?.animateTo(1);
    print('Splash data loaded');
    redirect();
  }

  void redirect() {
    if (push != null) {
      print('Redirecting from push ${push!.data['info']}');
      sl<FirebaseService>().redirectFromPush(context, push!);
    } else {
      print('Redirecting to $pickedPage');
      final appRouter = sl<AppRouter>();
      appRouter.replaceNamed(pickedPage!);
    }
  }

  Future<void> checkToken() async {
    final storage = sl<LocalDataRepository>();
    final token = storage.getToken();
    if (token != null) {
      final res = await sl<AuthRepository>().checkToken(token);
      isTokenValid = res.success;
    }
  }

  Future<void> handleFcmMessages() async {
    final firebaseService = sl<FirebaseService>();
    /// push which caused the application to open from a terminated state.
    push = await firebaseService.getMessageFromTerminatedState();
  }

  Future<void> pickPage() async {
    final storage = sl<LocalDataRepository>();
    String? token = storage.getToken();
    bool isSaloon = storage.getIsSaloon();
    bool isIntroShown = storage.getIsIntroShown();
    bool isSaloonSettingsPassed = storage.getIsSaloonSettingsPassed();

    if (token == null || !isTokenValid) {
      // редирект на авторизацию
      pickedPage = PathRoute.authCustomerScreen;
    } else if (!isSaloon && isIntroShown) {
      // редирект на главную страницу клиента
      pickedPage = PathRoute.homeCustomerScreen;
    } else if (!isSaloon && !isIntroShown) {
      // редирект на интро клиента
      pickedPage = PathRoute.introCustomerScreen;
    } else if (isSaloon && !isIntroShown) {
      // редирект на интро салона
      pickedPage = PathRoute.introSaloonScreen;
    } else if (isSaloon && isSaloonSettingsPassed) {
      // редирект на главную страницу салона
      pickedPage = PathRoute.homeSaloonScreen;
    } else if (isSaloon && !isSaloonSettingsPassed) {
      // редирект на первичную страницу настроек салона
      pickedPage = PathRoute.primarySettingSaloonScreen;
    }
    print('Page picked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppAssets.lottieSplash,
          controller: animationController,
          repeat: false,
          width: 350,
        ),
      ),
    );
  }
}
