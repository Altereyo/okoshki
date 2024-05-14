import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:okoshki/domain/state/saloon/window_store.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/logger.dart';
import 'package:okoshki/internal/utils/sl.dart';
import 'package:okoshki/presentation/customer/screens/saloon_details/saloon_details_controller.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/window_detail/window_detail.dart';
import 'package:okoshki/presentation/saloon/bottomsheets/window_detail/window_detail_controller.dart';

class FirebaseService {
  final fcmInstance = FirebaseMessaging.instance;
  String? fcmToken;

  Future<void> redirectFromPush(BuildContext context, RemoteMessage msg) async {
    final router = sl<AppRouter>();
    final int? id = int.tryParse(msg.data['id']);
    final String info = msg.data['info'];

    switch (info) {
      case 'saloon_cancelled_booking':
        //TODO: add BookingsScreen to page stack
        logger.w('add BookingsScreen to page stack');
        router.replaceAll([
          const HomeCustomerRoute(),
          const ProfileCustomerRoute(),
        ]);
        break;

      case 'new_favorite_window':
        final saloonDetailsCustomerController =
            sl<SaloonDetailsCustomerController>(
          param1: id,
        );

        router.replaceAll([
          const HomeCustomerRoute(),
          SaloonDetailsCustomerRoute(
            controller: saloonDetailsCustomerController,
          ),
        ]);
        break;

      case 'balance_replenishment':
        //TODO: call BalanceHistorySheet from ProfileSaloonRoute constructor
        logger
            .w('call BalanceHistorySheet from ProfileSaloonRoute constructor');
        router.replaceAll([
          const HomeSaloonRoute(),
          const ProfileSaloonRoute(),
        ]);
        break;

      case 'client_new_booking':
      case 'client_cancelled_booking':
        //TODO: call BookingSheet from HomeSaloonRoute constructor
        router.replaceAll([
          const HomeSaloonRoute(),
        ]);

        final window = sl<WindowSaloonStore>().getWindowById(id!);
        final controllerWindow =
            sl<WindowDetailController>(param1: window!);
        showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) =>
              WindowDetailBottomSheet(controller: controllerWindow),
        );
        break;
      case 'client_new_comment':
      case 'client_changed_comment':
        //TODO: add CommentsScreen to page stack
        logger.w('add CommentsScreen to page stack');
        router.replaceAll([
          const HomeSaloonRoute(),
          const ProfileSaloonRoute(),
        ]);
        break;
      default:
        throw Exception('Unknown push info $info');
    }
  }

  /// exists (not null) when touching push from terminated state
  Future<RemoteMessage?> getMessageFromTerminatedState() async {
    return await FirebaseMessaging.instance.getInitialMessage();
  }

  /// fires when touching push from background state
  Future<void> _onMessageFromBackgroundState(
      void Function(RemoteMessage) callback) async {
    FirebaseMessaging.onMessageOpenedApp.listen(callback);
  }

  /// fires when touching push from foreground state
  Future<void> _onMessageFromForegroundState(
      void Function(RemoteMessage) callback) async {
    FirebaseMessaging.onMessage.listen(callback);
  }

  Future<void> init(BuildContext context) async {
    await fcmInstance.requestPermission();

    fcmToken = await fcmInstance.getToken();
    logger.f('FCM token: $fcmToken');

    //ios setup
    await fcmInstance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // fires when GETTING push from background/terminated state
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    _onMessageFromBackgroundState((msg) {
      redirectFromPush(context, msg);
    });

    _onMessageFromForegroundState((msg) {
      logger.i('Foreground msg: $msg');
      //TODO: show notification
      // firebaseService.showForegroundNotification(context, msg);
      // firebaseService.redirectFromPush(context, msg);
      // throw UnimplementedError();
    });
  }
}

@pragma('vm:entry-point')
Future<void> _handleBackgroundMessage(RemoteMessage msg) async {
  logger.w('onBackgroundMessage: $msg');
}
