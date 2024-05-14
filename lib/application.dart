import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:okoshki/internal/ui/app_theme.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final appRouter = sl<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: appRouter.config(
        deepLinkBuilder: (deepLink) {
          if (deepLink.path.contains('/salon/')) {
            ///'https://okoshki.net/salon/12';
            ///После создания аккаунтов разработчика закончить настройки для каждой платформы
            ///https://docs.flutter.dev/ui/navigation/deep-linking
            final saloonId = int.parse(deepLink.path.split('/salon/').last);
            final saloonDetailsCustomerController =
                sl<SaloonDetailsCustomerController>(
              param1: saloonId,
            );
            return DeepLink([
              const SplashRoute(),
              // HomeCustomerRoute(),
              SaloonDetailsCustomerRoute(
                controller: saloonDetailsCustomerController,
              ),
            ]);
          } else {
            return DeepLink.defaultPath;
          }
        },
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru', 'ru_RU')],
      title: 'Okoshki',
      theme: appTheme,
    );
  }
}
